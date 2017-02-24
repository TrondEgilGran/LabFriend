//scope_control.c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include "spicomm.h"
#include "scope_control.h"

static uint8_t global_channel_config[nrOfChannels];
static uint8_t global_attenuationEnabled[nrOfChannels];
static uint8_t global_AC_Enabled[nrOfChannels];
static float global_probe_attenuation[nrOfChannels];


//-------Definitions---------------------------
#define min_buffersize 18432   //Base/minimum buffersize used for the datacapture

char *decimal_to_binary(int n, int numbits)
{
   int c, d, count;
   char *pointer;
 
   count = 0;
   pointer = (char*)malloc(32+1);
 
   if ( pointer == NULL )
      exit(EXIT_FAILURE);
 
   for ( c = numbits ; c >= 0 ; c-- )
   {
      d = n >> c;
 
      if ( d & 1 )
         *(pointer+count) = 1 + '0';
      else
         *(pointer+count) = 0 + '0';
 
      count++;
   }
   *(pointer+count) = '\0';
 
   return  pointer;
}

int set_probe_attenuation(uint8_t channel, float attenuation)
{
	if( channel >= nrOfChannels )
	{
		printf("You specified to high numer of channels will exit\n");
		return 0;
	}
	global_probe_attenuation[channel] = attenuation;

    return 1;
}

void init_scope_control(void)
{
	int i;
	printf("Start program\n");
	for(i=0; i< nrOfChannels; i++)
	{
		set_ACDC(i, DC);
		set_Attenuation(i,OFF);
		set_gain(i, GAINx1);
		set_probe_attenuation(i, 1.0);
	}
}

/*Dataformat for config
 * CHANNEL 0 BIT0 ---- ATTREL-
 * CHANNEL 0 BIT1 ---- ATTREL+
 * CHANNEL 0 BIT2 ---- DCREL-
 * CHANNEL 0 BIT3 ---- DCREL+
 * CHANNEL 0 BIT4 ---- GMUXA --|----- AB 00=1x , 01=4x, 10=2x, 11=AUX
 * CHANNEL 0 BIT5 ---- GMUXB --|
 * CHANNEL 0 BIT6 ---- GMUXC --|----- CD 00=5x4x,  01=4x, 10=2x, 11=5x2x
 * CHANNEL 0 BIT7 ---- GMUXD --|
 * CHANNEL 1 BIT0 ---- ATTREL-
 * CHANNEL 1 BIT1 ---- ATTREL+
 * CHANNEL 1 BIT2 ---- DCREL-
 * CHANNEL 1 BIT3 ---- DCREL+
 * CHANNEL 1 BIT4 ---- GMUXA --
 * CHANNEL 1 BIT5 ---- GMUXB --
 * CHANNEL 1 BIT6 ---- GMUXC -- 
 * CHANNEL 1 BIT7 ---- GMUXD --
 * 
 * gain 1 AB = 00 CD = 00 =0x00
 * gain 2 AB = 10 CD = 10 =0x0A
 * gain 4 AB = 01 CD = 01 =0x05
 * gain 10 AB = 10 CD = 11 =0x0E
 * gain 20 AB = 01 CD = 00 =0x01
 * gain 40 AB = 10 CD = 00 =0x02
 * 
 */

int set_gain( uint8_t channel, uint8_t gain)
{
	uint8_t databuffer[3];
	
	if( gain == GAINx1 || gain == GAINx2 || gain == GAINx4 || gain == GAINx10 || gain == GAINx20 || gain == GAINx40 )
	{
		global_channel_config[channel] = (global_channel_config[channel] & ~gainMask) | gain << gainShift;

		databuffer[0] = global_channel_config[0];
		databuffer[1] = global_channel_config[1];
		
		spiCommand( WRITE, addr74595, 2 );
		spiWrite( databuffer, 2 );
        printf( "written channel %d, config %x \n", channel,  global_channel_config[channel]);
		return 1;
	}
	else
	{
		printf("gain value not valid, only 0x0,0x1,0x2,0x5,0xA,0xE allowed \n");
		return 0;
	}
	
}

//Keep for later use when using direct buffer digital out
int set_digital_out( uint8_t outputByte)
{
    uint8_t databuffer[3];
    databuffer[0] = outputByte;
    spiCommand( WRITE, addrdigitalOut, 1 );
    spiWrite( databuffer, 1 );
    return 1;
}
//DWG Config //FPGA
//Byte 0 Config
//bit0 - Enable 1=enable 0=diasble
//bit1 - Direct buffer 1=just one byte data, 0=data with specific buffersize
//bit2 - Single burst 1=single burst 0=loop data
//bit3 - reserved
//bit4 - reserved
//bit7-5 - buffersize bit 10-8
//-------------------------------------
//Byte 1 Buffersize/data
//If direct buffer = 1 data here else
//bit7-0 buffersize 7-0
//-------------------------------------
//Byte 2
//bit 2-0 samplerate 10-8
//-------------------------------------
//Byte 3
//bit7-0 samplerate 7-0
//----------------------------------
//Byte 4....buffersize
//DATA

int run_dwg(uint8_t mode, uint16_t sample_rate, uint16_t buffersize, uint8_t *datain)
{
    int i;
    uint8_t *databuffer;
    uint16_t tempbuffsize = buffersize-1;
    databuffer = (uint8_t *) malloc(buffersize+4);

    databuffer[0] = mode | (tempbuffsize >> 3)&0x00E0;
    databuffer[1] = tempbuffsize&0x00FF;
    databuffer[2] = (sample_rate >> 8)&0x0007;
    databuffer[3] = (sample_rate)&0x00ff;
    printf("DWG CONF %x %x %x %x \n", databuffer[0], databuffer[1], databuffer[2], databuffer[3]);
    for(i=0; i < buffersize; i++)
    {
        databuffer[i+4] = datain[i];
        printf("DWG DO %x \n", databuffer[i+4]);
    }

    spiCommand(WRITE, addrDWG, buffersize+4);
    spiWrite(databuffer,buffersize+4);

    free(databuffer);

}

//AWG COnfig
//Byte 0 Config
//bit0 - Enable 1=enable 0=diasble
//bit1 - Direct buffer 1=just one byte data, 0=data with specific buffersize
//bit2 - Single burst 1=single burst 0=loop data
//bit3 - reserved
//bit4 - reserved
//bit7-5 - buffersize bit 10-8
//-------------------------------------
//Byte 1 Buffersize/data
//If direct buffer = 1 data here else
//bit7-0 buffersize 7-0
//-------------------------------------
//Byte 2
//bit 2-0 samplerate 10-8
//-------------------------------------
//Byte 3
//bit7-0 samplerate 7-0
//----------------------------------
//Byte 4....buffersize
//DATA

int run_awg(uint8_t mode, uint16_t sample_rate, uint16_t buffersize, uint8_t *datain)
{
    int i;
    uint8_t *databuffer;
    uint16_t tempbuffsize = buffersize-1;
    databuffer = (uint8_t *) malloc(buffersize+4);

    databuffer[0] = mode | (tempbuffsize >> 3)&0x00E0;
    databuffer[1] = tempbuffsize&0x00FF;
    databuffer[2] = (sample_rate >> 8)&0x0007;
    databuffer[3] = (sample_rate)&0x00ff;
    printf("AWG CONF %x %x %x %x \n", databuffer[0], databuffer[1], databuffer[2], databuffer[3]);
    for(i=0; i < buffersize; i++)
    {
        databuffer[i+4] = datain[i];
    }

    spiCommand(WRITE, addrAWG, buffersize+4);
    spiWrite(databuffer,buffersize+4);

    free(databuffer);

}

int set_ACDC( uint8_t channel, uint8_t acdc)
{
	uint8_t databuffer[3];
	
	global_AC_Enabled[channel] = acdc;
	
	global_channel_config[channel] = (global_channel_config[channel] & ~DCMask) | acdc << DCShift;

    if(channel == 1)
    {
        databuffer[0] = global_channel_config[0]& ~DCMask;
        databuffer[1] = global_channel_config[1];
    }
    else
    {
        databuffer[0] = global_channel_config[0];
        databuffer[1] = global_channel_config[1]& ~DCMask;
    }
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );
    printf( "Pre written channel %d, config %x\n", channel,  global_channel_config[channel] );
	
	//Wait for dealy for relay to settle
    usleep(200000);
	
	
    databuffer[0] = global_channel_config[0]& ~DCMask;
    databuffer[1] = global_channel_config[1]& ~DCMask;
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );

	
    printf( "Post written config0 %x, config1 %x \n", global_channel_config[0], global_channel_config[1]);
	return 1;
}

int set_Attenuation( uint8_t channel, uint8_t attenuation)
{
	uint8_t databuffer[3];
	
	global_attenuationEnabled[channel] = attenuation;
	
	global_channel_config[channel] = (global_channel_config[channel] & ~AttMask) | attenuation << AttShift;
		

    if(channel == 1)
    {
        databuffer[0] = global_channel_config[0]& ~AttMask;
        databuffer[1] = global_channel_config[1];
    }
    else
    {
        databuffer[0] = global_channel_config[0];
        databuffer[1] = global_channel_config[1]& ~AttMask;
    }

	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );
    printf( "Pre written channel %d, config %x \n", channel,  global_channel_config[channel]);
	
	//Wait for dealy for relay to settle
    usleep(200000);

    databuffer[0] = global_channel_config[0]&~AttMask;
    databuffer[1] = global_channel_config[1]&~AttMask;
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );


    printf( "Post written channel %d, config %x \n", channel,  global_channel_config[channel]);

	return 1;
}

uint8_t set_trigger_voltage( uint8_t channel, float trigger_voltage)
{
	float gain, attenuation, adc_voltage;
	uint8_t adc_raw_byte;

    attenuation = 1.0;

	switch( (global_channel_config[channel] & gainMask) >> gainShift )
	{
		case GAINx1 :
			gain = 1.0;
			break;
		case GAINx2 :
			gain = 2.0;
			break;
		case GAINx4 :
			gain = 4.0;
			break;
		case GAINx10 :
			gain = 10.0;
			break;
		case GAINx20 :
			gain = 20.0;
			break;
		case GAINx40 :
			gain = 40.0;
			break;
		default :
			printf("Not valid gain value will exit\n");
			return 0;
			break;
	}
	
	if( global_attenuationEnabled[channel] == ON )
	{
		attenuation = attenuation_value;
	}
	else if ( global_attenuationEnabled[channel] == OFF )
	{
		attenuation = 1.0;
	}
	else
	{
		printf("Not valid attenuation value, only ON and OFF accepted will exit \n");
	}
	
    adc_voltage = gain*trigger_voltage/(attenuation + global_probe_attenuation[channel]) + ADCrange/2;
    adc_raw_byte = (uint8_t) round(adc_voltage*255.0/ADCrange);
	printf("setting trigger level for channel %d to %f V and ADC byte to %x\n", channel, adc_voltage, adc_raw_byte);
	return adc_raw_byte;
}

int scope_data_available(void)
{
    uint8_t databuffer[5];
    int returnvalue = 0;

    databuffer[command] = cmd_read_status;
    spiCommand( WRITE, addrHSaqusition, 1 );
    spiWrite( databuffer, 1 );
    spiCommand( READ, addrHSaqusition, 1 );
    spiRead( databuffer, 1 );
    printf("status: %x\n", databuffer[0]);

    if( (scope_status_ram_data_full & databuffer[0]) ==  scope_status_ram_data_full )
    {
        returnvalue = 1;
    }

    return returnvalue;
}

int scope_read_trigger(void)
{
    uint8_t databuffer[6];
    int returnvalue = 0;

    databuffer[command] = cmd_read_trigger;
    spiCommand( WRITE, addrHSaqusition, 1 );
    spiWrite( databuffer, 1 );
    spiCommand( READ, addrHSaqusition, 6 );
    spiRead( databuffer, 6 );

    printf("data 1 %x\n", databuffer[0]);
    printf("data 2 %x\n", databuffer[1]);
    printf("data 3 %x\n", databuffer[2]);
    printf("data 4 %x\n", databuffer[3]);
    printf("data 5 %x\n", databuffer[4]);
    printf("data 6 %x\n", databuffer[5]);

    return returnvalue;
}

int set_scope_config( 	uint8_t trigger_value, 
			uint8_t trigger_source,
		        uint8_t trigger_edge,
			uint8_t ram0_sel, 
		        uint8_t ram_digi_muxed,
			uint8_t adc_powerdown, 
		        uint8_t adc_clock,
			uint32_t trigger_ram_offset,
            uint8_t start_capture,
            uint32_t scopedatasize,
            uint16_t srdiv)
{
	uint8_t databuffer[8];

    databuffer[0] = 0x06;
    spiCommand( WRITE, addrHSaqusition | 0x10, 1 );
    spiWrite( databuffer, 1 );

    databuffer[0] = cmd_configure2;
    databuffer[1] = 0x000000FF & scopedatasize;
    databuffer[2] = 0x000000FF & (scopedatasize >> 8);
    databuffer[3] = 0x000000FF & (scopedatasize >> 16);
    databuffer[4] = 0x00FF & srdiv;
    databuffer[5] = 0x00ff & srdiv >> 8;

    spiCommand( WRITE, addrHSaqusition, 6 );
    spiWrite( databuffer, 6 );

    //Config 1
    //-------------------------------------------------------------------------------------------------
	databuffer[command] 		= cmd_configure;
	databuffer[conf_ram_mux]	= 	ram0_sel ;
	databuffer[conf_clock_power]	=	(adc_powerdown << adc_powerdown_shift) |
                        (adc_clock << adc_clock_pol_shift) | 0x0;
    databuffer[conf_trigger]	=	((trigger_source << trigger_source_shift)& trigger_source_mask) |
                        ((trigger_edge << trigger_edge_shift)& trigger_edge_mask) |
                        (trigger_source) ;
						printf("trigger Conf %x\n", databuffer[conf_trigger]);
	databuffer[conf_trigger_value]	= 	trigger_value;
	databuffer[conf_trigger_time_offset0] = 0x000000FF & trigger_ram_offset;
	databuffer[conf_trigger_time_offset1] = 0x000000FF & (trigger_ram_offset >> 8);
	databuffer[conf_trigger_time_offset2] = (0x000000FF & (trigger_ram_offset >> 16)); 
	databuffer[conf_trigger_time_offset2+1] = start_capture ;
	
	spiCommand( WRITE, addrHSaqusition, 9 );
	spiWrite( databuffer, 9 );
	printf( "Scope config started\n");
	if( start_capture == 1 ) printf("data capture started\n");
	
	return 1;
}



int read_ram( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint32_t buffersize, uint8_t number_of_channels)
{
    uint8_t *databuffer;
	int ramadress=0;
	int i, ia;
    FILE *f = fopen("didi.txt", "w");
    if (f == NULL)
    {
        printf("Error opening file!\n");
        exit(1);
    }

    databuffer = (uint8_t *) malloc(min_buffersize+5);
    if (databuffer==NULL) exit (1);

	databuffer[command] = cmd_read_ram;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	
    usleep(1000);

    if( (buffersize % min_buffersize) != 0 )
    {
        printf("buffersize too low minimum %d, or not devidable by minimum buffersize without a reminder, reminder %d\n", min_buffersize, (buffersize % min_buffersize));
        return 0;
    }
    else if (buffersize > 16777216)
    {
        printf("buffersize too high max 16773120, \n", min_buffersize);
        return 0;
    }

	ramadress=0;
    for(i = 0; i < buffersize/min_buffersize; i ++ )
	{	
        spiCommand( READ, addrHSaqusition, min_buffersize );
        spiRead( databuffer, min_buffersize );
		//printf("Read address %d to %d, ramaddr %d\n", i*bytesPerRamAddress, i*bytesPerRamAddress +192, ramadress);
        if(number_of_channels = 3)
        {
            for( ia = 0; ia < min_buffersize; ia=ia+12)
            {
                *(ram_group_0 + ramadress+3)   = databuffer[0+ia];
                *(ram_group_0 + ramadress+2) = databuffer[1+ia];
                *(ram_group_0 + ramadress+1) = databuffer[2+ia];
                *(ram_group_0 + ramadress+0) = databuffer[3+ia];
                *(ram_group_1 + ramadress+3)   = databuffer[4+ia];
                *(ram_group_1 + ramadress+2) = databuffer[5+ia];
                *(ram_group_1 + ramadress+1) = databuffer[6+ia];
                *(ram_group_1 + ramadress+0) = databuffer[7+ia];
                *(ram_group_2 + ramadress+3) = databuffer[8+ia];
                *(ram_group_2 + ramadress+2) = databuffer[9+ia];
                *(ram_group_2 + ramadress+1) = databuffer[10+ia];
                *(ram_group_2 + ramadress+0) = databuffer[11+ia];
                ramadress = ramadress + 4;
                fprintf(f," %d %x %x %x \n", ia, databuffer[0+ia],databuffer[4+ia], databuffer[8+ia]);
                fprintf(f," %d %x %x %x \n", ia, databuffer[1+ia],databuffer[5+ia], databuffer[9+ia]);
                fprintf(f," %d %x %x %x \n", ia, databuffer[2+ia],databuffer[6+ia], databuffer[10+ia]);
                fprintf(f," %d %x %x %x \n", ia, databuffer[3+ia],databuffer[7+ia], databuffer[11+ia]);

            }
         }
         else if(number_of_channels = 2)
         {
             for( ia = 0; ia < min_buffersize; ia=ia+8)
             {
                 *(ram_group_0 + ramadress)   = databuffer[0+ia];
                 *(ram_group_0 + ramadress+1) = databuffer[1+ia];
                 *(ram_group_0 + ramadress+2) = databuffer[2+ia];
                 *(ram_group_0 + ramadress+3) = databuffer[3+ia];
                 *(ram_group_1 + ramadress)   = databuffer[4+ia];
                 *(ram_group_1 + ramadress+1) = databuffer[5+ia];
                 *(ram_group_1 + ramadress+2) = databuffer[6+ia];
                 *(ram_group_1 + ramadress+3) = databuffer[7+ia];
                 ramadress = ramadress + 4;
                 //printf(" %d %x %x %x \n", ia, databuffer[0+ia],databuffer[1+ia], databuffer[2+ia]);
             }
         }
         else if(number_of_channels = 1)
         {
             for( ia = 0; ia < min_buffersize; ia=ia+4)
             {
                 *(ram_group_0 + ramadress)   = databuffer[0+ia];
                 *(ram_group_0 + ramadress+1) = databuffer[1+ia];
                 *(ram_group_0 + ramadress+2) = databuffer[2+ia];
                 *(ram_group_0 + ramadress+3) = databuffer[3+ia];
                 ramadress = ramadress + 4;
                 //printf(" %d %x %x %x \n", ia, databuffer[0+ia],databuffer[1+ia], databuffer[2+ia]);
             }
        }
        else
        {
            printf("Wrong number of samples should be 1, 2 or 3 not %d\n", number_of_channels);
            return 0;
        }
    }
	databuffer[command] = 0x07;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );


    databuffer[command] = cmd_read_status;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	spiCommand( READ, addrHSaqusition, 1 );
	spiRead( databuffer, 1 );
	printf("end status %x\n", databuffer[0]);
	
    fclose(f);
    free(databuffer);
	return 1;
}


int new_read_ram(void)
{
    uint8_t *databuffer;
	int ramadress=0;
    int i, ia=0;
	int trigger, tstop;
	char bitstring[10];
	FILE *f = fopen("file.txt", "w");
	if (f == NULL)
	{
		printf("Error opening file!\n");
		exit(1);
	}

    databuffer = (uint8_t *) malloc(min_buffersize+5);
    if (databuffer==NULL) exit (1);
    
    databuffer[command] = cmd_read_status;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	spiCommand( READ, addrHSaqusition, 1 );
	spiRead( databuffer, 1 );
	printf("start status %x\n", databuffer[0]);
	
	//Read trigger
	/*databuffer[command] = cmd_read_trigger;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	spiCommand( READ, addrHSaqusition, 6 );
	spiRead( databuffer, 6 );
	trigger = (int)databuffer[0] | (int)databuffer[1] << 8 | (int)databuffer[2] << 16;
	tstop = (int)databuffer[3] | (int)databuffer[4] << 8 | (int)databuffer[5] << 16;
	printf("trigger %x  stop %x\n", trigger, tstop);*/
	databuffer[command] = cmd_read_ram ;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	
	usleep(1000);
	
	ramadress=0;
   // for(i = 0; i < (nrOfRamAddresses*3)/min_buffersize; i ++ )
    //{
        spiCommand( READ, addrHSaqusition, min_buffersize );
        spiRead( databuffer, min_buffersize );
		//printf("Read address %d to %d, ramaddr %d\n", i*bytesPerRamAddress, i*bytesPerRamAddress +192, ramadress);
        for( ia = 0; ia < min_buffersize; ia= ia+12)
		{
			 ramadress++;
			//printf("%d %x \n", ramadress, databuffer[ia]);
            //fprintf(f, " %d %d %s \n", ramadress, databuffer[ia], decimal_to_binary(databuffer[ia], 8) );
             fprintf(f,"%d %d %d %d \n", ia, databuffer[ia], databuffer[ia+4], databuffer[ia+8]  );
             fprintf(f,"%d %d %d %d \n", ia+1, databuffer[ia+1], databuffer[ia+5], databuffer[ia+9]  );
             fprintf(f,"%d %d %d %d \n", ia+2, databuffer[ia+2], databuffer[ia+6], databuffer[ia+10]  );
             fprintf(f,"%d %d %d %d \n", ia+3, databuffer[ia+3], databuffer[ia+7], databuffer[ia+11]  );
		}
    //}
	
	databuffer[command] = cmd_read_status;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	spiCommand( READ, addrHSaqusition, 1 );
	spiRead( databuffer, 1 );
	printf("end status %x\n", databuffer[0]);
	
	
	fclose(f);
    free(databuffer);
	return 1;
}

int read_ram_fast( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint8_t *ram_group_3)
{
    uint8_t *databuffer;
    int ramadress=0;
    int i, ia;

    databuffer = (uint8_t *) malloc(min_buffersize+5);
    if (databuffer==NULL) exit (1);

    databuffer[command] = cmd_read_ram;
    spiCommand( WRITE, addrHSaqusition | fastRamRead, 1 );
    spiWrite( databuffer, 1 );


    ramadress=0;
    for(i = 0; i < (nrOfRamAddresses_fast*bytesPerRamAddress)/min_buffersize; i ++ )
    {
        spiCommand( READ, addrHSaqusition | fastRamRead, min_buffersize );
        spiRead( databuffer, min_buffersize );
        //printf("Read address %d to %d, ramaddr %d\n", i*bytesPerRamAddress, i*bytesPerRamAddress +192, ramadress);
        for( ia = 0; ia < min_buffersize; ia=ia+3)
        {
            *(ram_group_0 + ramadress) = databuffer[0+ia];
            *(ram_group_1 + ramadress) = databuffer[1+ia];
            *(ram_group_2 + ramadress) = databuffer[2+ia];
            ramadress = ramadress + 1;
            //printf(" %d %x %x %x \n", ia, databuffer[0+ia],databuffer[1+ia], databuffer[2+ia]);
        }
    }
    databuffer[command] = 0x07;
    spiCommand( WRITE, addrHSaqusition, 1 );
    spiWrite( databuffer, 1 );

    spiCommand( WRITE, addrHSaqusition, 1 );
    spiWrite( databuffer, 1 );


    databuffer[command] = cmd_read_status;
    spiCommand( WRITE, addrHSaqusition, 1 );
    spiWrite( databuffer, 1 );
    spiCommand( READ, addrHSaqusition, 1 );
    spiRead( databuffer, 1 );
    printf("end status %x\n", databuffer[0]);


    free(databuffer);
    return 1;
}



