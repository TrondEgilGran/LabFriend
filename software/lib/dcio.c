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

float getVoltage(uint8_t config)
{
	uint16_t adcraw;
	float adcvalue;
	uint8_t databuffer[3];
    uint8_t gainDig;
    float gain;

	databuffer[0] = config;
/*
	spiCommand( WRITE, addrI2Cdac | i2cadcConfig, 1 );
	spiWrite( databuffer, 1 );
    usleep(30000);
	spiCommand( WRITE, addrI2Cdac | i2cdataread, 1 );
	spiWrite( databuffer, 1 );
    usleep(30000);
	spiCommand( READ, addrI2Cdac, 2);
    usleep(20000);
    spiRead(databuffer, 2);*/

    gainDig = 0x03 & config;
    if (gainDig == LOGGERGAIN1 )
    {
        gain = 1.0;
    }
    else if (gainDig == LOGGERGAIN2 )
    {
        gain = 2.0;
    }
    else if (gainDig == LOGGERGAIN4 )
    {
        gain = 4.0;
    }
    else if (gainDig == LOGGERGAIN8 )
    {
        gain = 8.0;
    }
	adcraw =  ( (uint16_t)databuffer[0] << 8) | databuffer[1] ;
	adcvalue = (2.048/32768)*(float)((int16_t)adcraw);
    printf("adcvalue raw %x float %f\n", adcraw, adcvalue);
    return adcvalue/gain;
	
}

