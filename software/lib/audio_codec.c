#include <stdio.h>
#include <signal.h>
#include <sys/time.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>
#include <unistd.h>
#include "spicomm.h"
#include "audio_codec.h"
#include "board.h"
#include "math.h"

#define INTERVAL 5


int32_t fifo_level( uint8_t adcdac)
{
	uint8_t databuffer[3];
	uint16_t fifo_level;
	spiCommand( READ, addrAudioCodec | adcdac, 2 );
	spiRead(databuffer, 2);
	fifo_level = (uint16_t)databuffer[0] << 8 | databuffer[1];
   // printf("fifo_level %d , hex byte0 %x, byte1 %x \n",  fifo_level, databuffer[0], databuffer[1]);
	return fifo_level;
}

float getSampleRate(uint8_t config)
{
	float samplerate;
	samplerate = MASATERCLKFREQ  /( I2SFSDIV * 2 * ( (config&0x0f) +1) );
	return samplerate;
}

/*
 *    To measure time put in 
 * 
	struct timeval begin, end;
	double elapsedTime;
	gettimeofday(&begin, NULL);
	//do sometihgn
	gettimeofday(&end, NULL);
        elapsedTime = (end.tv_sec - begin.tv_sec) * 1000.0;      // sec to ms
        elapsedTime += (end.tv_usec - begin.tv_usec) / 1000.0;
 
 */

int audioSPI(uint8_t address, uint8_t data)
{
    uint8_t databuffer[3];
    //Transfer Config Shift data out on falling edge valid on rising edge
    databuffer[0] = 0x0B;
    //Data MSB (address)
    databuffer[1] = address | 0xA0;
    databuffer[2] = data;
    spiCommand(WRITE, addrSPI, 3 );
    spiWrite(databuffer, 3);
    //50us (8 real)
    usleep(50);
    return 1; //can add readback of status bit to see that write is actually finished
}


int setI2Sconfig( uint8_t config)
{
    uint8_t databuffer[1];

    printf("I2SConfig %x \n", config);
    databuffer[0] = config | 0x40;
    spiCommand( WRITE, addrAudioCodec | I2SCONFIG, 1 );
    spiWrite( databuffer, 1 );
    usleep(50000);
    /*AK4621 Config */
    //addr 0, 00000111  Power up device

    /*Cloclk and format
     * DIF[2..0] 011  I2S
     * DFS[1..0] 00 32-54kHz
     * DFS[1..0] 01 54-108kHz
     * DFS[1..0] 10 108-206kHz
     * CMODE 0 128/256..fs  CMODE 1 192/384..fs
     * CKS[1..0]  0 256, 1 512, 2 1024, 3 auto (512 norm, 256 double, 128 quad)
     *
     * 011 0 00 00
     */
    audioSPI(2, 0x60);
    //Exit reset
    audioSPI(1, 3);

    return 1;
}

int sineGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples)
{
    uint32_t i;
    printf("[ ");
	for( i=0; i<nrOfSamples; i++ )
	{
		samples[i] = amplitude * (float) sin( ((double)i/(double)samplerate)*frequency * M_PI * 2.0 );
        printf("%f ", samples[i]);
	}

    printf("]; \n ------------------------------\n", samples[i]);
    return 1;
}

int squareGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples)
{
    uint32_t i;
    uint32_t freqcounter, freqcountermax;
    double signal = 1.0;

    freqcountermax = round(samplerate/(frequency*2));

    freqcounter = 0;
    //printf("[ ");
    for( i=0; i<nrOfSamples; i++ )
    {
        if( freqcounter < freqcountermax )
        {
            freqcounter++;
        }
        else
        {

            signal = -signal;
            freqcounter = 0;
        }
        samples[i] = amplitude * signal;
      //  printf("%f ", samples[i]);
    }

    //printf("]; \n ------------------------------\n", samples[i]);
    return 1;
}

int diracGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples)
{
    uint32_t i;
    uint32_t freqcounter, freqcountermax;
    double signal = 1.0;

    freqcountermax = round(samplerate/(frequency));

    freqcounter = 0;

    for( i=0; i<nrOfSamples; i++ )
    {
        if( freqcounter < freqcountermax )
        {
            freqcounter++;
            signal = 1.0;
        }
        else
        {

            signal = -1.0;
            freqcounter = 0;
        }
        samples[i] = amplitude * signal;
    }

    //printf("]; \n ------------------------------\n", samples[i]);
    return 1;
}

int setDacSampleCount(int fifofill)
{
    uint8_t databuffer[2];
    databuffer[0]= (fifofill >> 8) & 0xff;
    spiCommand( WRITE, addrAudioCodec | I2SDACFIFOH, 1 );
    spiWrite( databuffer, 1 );
    databuffer[0]= fifofill&0xff;
    spiCommand( WRITE, addrAudioCodec | I2SDACFIFOL, 1 );
    spiWrite( databuffer, 1 );
    return 1;
}

int setDACdata( float * samples_R,  float * samples_L, float gainerror_L, float offseterror_L, float gainerror_R, float offseterror_R, int samplecount)
{
	uint8_t * databuffer;
	int32_t raw;
    uint16_t fifofill=0;
	int i, dbi;
    databuffer = (uint8_t *) malloc(FifoBufferSize*6);
	
	if (databuffer==NULL) exit (1);
	
	if( samplecount == FULL)
	{
        fifofill = FifoBufferSize;
	}
	else if( samplecount == FIFOLEVEL )
	{
        fifofill = FifoBufferSize - fifo_level( I2SDACCOUNTER );
	}
    else
    {
        fifofill = samplecount;
    }
    fifo_level( I2SDACCOUNTER );

	dbi = 0;
	for( i=0; i < fifofill; i++)
	{
		raw = round(MAXSIGNALRAW*(gainerror_L* samples_L[i] + offseterror_L)/MAXINPUT_AMPLITUDE);
		databuffer[dbi] = 0x000000FF & (raw >> 16);
		databuffer[dbi + 1] = 0x000000FF & (raw >> 8);
		databuffer[dbi + 2] = 0x000000FF & raw;
       // printf("%d ", raw);
		dbi = dbi + 3;
		
		raw = round(MAXSIGNALRAW*(gainerror_R* samples_R[i] + offseterror_R)/MAXINPUT_AMPLITUDE);
		databuffer[dbi] = 0x000000FF & (raw >> 16);
		databuffer[dbi + 1] = 0x000000FF & (raw >> 8);
		databuffer[dbi + 2] = 0x000000FF & raw;
       // printf("%d \n", raw);
		dbi = dbi + 3;
		
	}
    fifo_level( I2SDACCOUNTER );
	
	printf("%x %x \n", fifofill, addrAudioCodec | I2SDACDATA);
	spiCommand( WRITE, addrAudioCodec | I2SDACDATA, fifofill*6 );
	spiWrite(databuffer, fifofill*6);
	free(databuffer);
	fifofill = fifo_level( I2SDACCOUNTER );
	return fifofill;
	
}

int getADCdata(double * samples_R,  double * samples_L, float gainerror_L, float offseterror_L, float gainerror_R, float offseterror_R )
{
	uint32_t  i, dbi;
	int32_t  raw;
	uint8_t * databuffer;
	uint16_t fifolevel;
	
    databuffer = (uint8_t *) malloc(FifoBufferSize*6);
	if (databuffer==NULL) exit (1);
	
    fifolevel = fifo_level(I2SADCCOUNTER);
    //fifolevel = FifoBufferSize;

	spiCommand( READ, addrAudioCodec | I2SADCDATA, fifolevel*6 );
	spiRead(databuffer, fifolevel*6);

	dbi = 0;
	for( i= 0; i < fifolevel; i++)
	{
		raw = ((databuffer[dbi+2] << 8) | (databuffer[dbi + 1] << 16) | (databuffer[dbi] << 24)) >> 8;
		samples_L[i] = gainerror_L*MAXINPUT_AMPLITUDE*(float)raw/MAXSIGNALRAW + offseterror_L;
        //printf("%d %x ", i, raw);
		dbi = dbi + 3;
		raw = ((databuffer[dbi+2] << 8) | (databuffer[dbi + 1] << 16) | (databuffer[dbi] << 24)) >> 8;
		samples_R[i] = gainerror_R*MAXINPUT_AMPLITUDE*(float)raw/MAXSIGNALRAW + offseterror_R;
		dbi = dbi + 3;
        //printf("%x \n", raw);
	}

    fifo_level(I2SADCCOUNTER);
    free(databuffer);
	
	return fifolevel;
}

/*
int howmany = 0;

void alarm_wakeup (int i)
{
   struct itimerval tout_val;

   signal(SIGALRM,alarm_wakeup);

   howmany += INTERVAL;
   
   printf("\n%d sec up partner, Wakeup!!!\n",howmany);
   tout_val.it_interval.tv_sec = 0;
   tout_val.it_interval.tv_usec = 0;
   tout_val.it_value.tv_sec = INTERVAL; // 10 seconds timer 
   tout_val.it_value.tv_usec = 0;
   
   setitimer(ITIMER_REAL, &tout_val,0);
   
}

void exit_func (int i)
{
    signal(SIGINT,exit_func);
    printf("\nBye Bye!!!\n");
    exit(0);
}

int main ()
{
  struct itimerval tout_val;
  
  tout_val.it_interval.tv_sec = 0;
  tout_val.it_interval.tv_usec = 0;
  tout_val.it_value.tv_sec = INTERVAL; // 10 seconds timer 
  tout_val.it_value.tv_usec = 0;
  setitimer(ITIMER_REAL, &tout_val,0);

  signal(SIGALRM,alarm_wakeup); // set the Alarm signal capture 
  signal(SIGINT,exit_func);
  
  while (1)
  {
    //printf("!");
  }
  
  return 0;

}
*/


