//I2CDAC

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include "spicomm.h"
#include "i2cdac.h"



/*
 * 2.85 Ref Voltage 16 bit
 *  VOUT=INTIN*2.85/0xffff
 * multiplier:
 * 
 *  VOUT=-1.25+51/22(1.25-VIN)
 * 
 * VOUT =-1.25*51/22(1.25-INTIN*2.85/0xFFFF)
 * VOUT/2.8977 = 1.25-INTIN*2.85/0xffff
 * (vout/2.8977-1.25)/(2.85/0xFFFF)=INITIN
 * 
 * VOUT = -1.25+2.8977-INITIN*1.0081e-04
 * INITIN = (1.6477 - VOUT)/1.0081e-4
 * 
 */
int setVoltage(uint8_t channel, float voltage, float gainerror, float offset)
{
	uint16_t dacvalue;
	uint8_t databuffer[3];

	if( (channel == HSADCOFFSET0) || (channel == HSADCOFFSET1))
	{
		dacvalue = (uint16_t) round( (65535/2.85+gainerror)*(1.25-(22.0/51.0)*(voltage-1.25)) +offset );
	}
	else
	{
		dacvalue = (uint16_t) round( offset + (voltage*( 1.2865e+04 + gainerror ) ) );
	}
	databuffer[0] = channel;
	databuffer[1] = 0x00ff & (dacvalue >> 8);
	databuffer[2] = dacvalue & 0x00ff;
	
	spiCommand( WRITE, addrI2Cdac, 3 );
	spiWrite( databuffer, 3 );
	printf( "written voltage: %f dacvalue: %d \n", voltage, dacvalue );
	
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
	
	spiCommand( WRITE, addrI2Cdac | i2cadcConfig, 1 );
	spiWrite( databuffer, 1 );
    usleep(30000);
	spiCommand( WRITE, addrI2Cdac | i2cdataread, 1 );
	spiWrite( databuffer, 1 );
    usleep(30000);
	spiCommand( READ, addrI2Cdac, 2);
    usleep(20000);
	spiRead(databuffer, 2);

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

