//I2CDAC

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include "spicomm.h"
#include "dcio.h"
#include "board.h"



/*
 * PWM ouput Voltage
 * PWMOV=PWMVOLTAGE*(PWMMAX-PWMVAL)/PWMMAX
 *
 * PWMVAL=PWMMAX-PWMMAX*PWMOV/PWMVOLTAGE
 * 
 * Offset Adjustment Voltage
 * VO=VREFL-OFFSETRFB*(PWMOV-VREFL)/OFFSETRG
 *
 * (OFFSETRG/-OFFSETRFB)*(VO-VREFL)+VREFL=PWMOV
 *
 *
 * Voltage Outputs
 * VO=PWMOV*(1+VORFB/VORG)
 *
 * PWMOV=VO/(1+VORFB/VORG)
 *
 *
 * 
 */
int setVoltage(uint8_t channel, float voltage, float gainerror, float offset)
{
    uint16_t pwmval;
	uint8_t databuffer[3];
    float pwmov, zeerooffset;

    zeerooffset = -(VREFL+ (VREFT-VREFL)/2);
    voltage = voltage*gainerror + offset;

    if( (channel == HSADCOFFSET0) || (channel == HSADCOFFSET1) || (channel == LAOFFSET) )
	{
        pwmov = (-OFFSETRG/OFFSETRFB)*(zeerooffset+voltage-VREFL)+VREFL;
        pwmval = (uint16_t) round( PWMMAX-(PWMMAX/PWMVOLTAGE)*pwmov  );
	}
    else if(channel == LADVREF)
    {
        pwmval = (uint16_t) round( PWMMAX-(PWMMAX/PWMVOLTAGE)*voltage  );
    }
	else
	{
        pwmov = voltage/(1+VORFB/VORG);
        pwmval = (uint16_t) round( PWMMAX-(PWMMAX/PWMVOLTAGE)*pwmov  );
	}
	databuffer[0] = channel;
    databuffer[1] = 0x00ff & (pwmval >> 8);
    databuffer[2] = pwmval & 0x00ff;
	
    spiCommand( WRITE, addrDCIO, 3 );
	spiWrite( databuffer, 3 );
    printf( "written voltage: %f pwmvalue: %d \n", voltage, pwmval );
	
    usleep(20000);
	return 1;
	
}



float getVoltage(uint16_t config)
{
	uint16_t adcraw;
	float adcvalue;
	uint8_t databuffer[3];
    uint16_t gainDig;
    float gain, ref;
    config = config | 0x0002;
    databuffer[0] = 0x05;
    databuffer[1] = ((config >> 8)&0x00FF );
    databuffer[2] = (0x00FF&config);
    spiCommand(WRITE, addrSPI, 3 );
    spiWrite(databuffer, 3);
    usleep(15000);
    //databuffer[2] = 0x00FF&config;
    printf("config %x %x %x \n",config, databuffer[1], databuffer[2]);
    spiCommand(WRITE, addrSPI, 3 );
    spiWrite(databuffer, 3);
    usleep(15000);
    spiCommand(READ, addrSPI, 3 );
    spiRead(databuffer,3);



    gainDig = 0x0E00 & config;
    if (gainDig == LOGGERGAIN1 )
    {
        gain = 1.0;
        ref = 6.144;
    }
    else if (gainDig == LOGGERGAIN2 )
    {
        gain = 2.0;
        ref = 4.096;
    }
    else if (gainDig == LOGGERGAIN4 )
    {
        gain = 4.0;
        ref = 2.048;
    }
    else if (gainDig == LOGGERGAIN8 )
    {
        gain = 8.0;
        ref = 1.024;
    }
    else if (gainDig == LOGGERGAIN16 )
    {
        gain = 16.0;
        ref = 0.512;
    }
    else if (gainDig == LOGGERGAIN32 )
    {
        gain = 32.0;
        ref = 0.256;
    }
    adcraw =  ( (uint16_t)databuffer[1] << 8) | databuffer[2] ;
    if (config&LOGGERTEMP)
    {
        adcvalue = ((float)adcraw)/4 * 0.03125;

    }
    else
    {
        adcvalue = (ref/32768)*(float)((int16_t)adcraw);
    }
    printf("adcvalue raw  %x %x float %f\n", databuffer[0], adcraw, adcvalue);
    return adcvalue;
	
}

