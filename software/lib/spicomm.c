#include <stdio.h>
#include <stdlib.h>
#include <mpsse.h>
#include <time.h>
#include "spicomm.h"

static struct mpsse_context *spiP;


int spiOpen( void )
{
	
	int retval = EXIT_FAILURE;
    if((spiP = MPSSE(SPI0,THIRTY_MHZ , MSB)) != NULL && spiP->open)
	{
		printf("%s initialized atO %dHz (SPI mode 0)\n", GetDescription(spiP), GetClock(spiP));
		
		retval = EXIT_SUCCESS;
	}
	else
	{
		
		printf("Failed to initialize MPSSE: %s\n", ErrorString(spiP));
	}
	
	return retval;
}

int spiClose( void )
{
	Close(spiP);
    return 1;
}


int spiCommand( uint8_t RW, uint8_t address, uint16_t nrOfBytes )
{
	uint8_t command[3];
	command[0] = RW | address;
	command[1] = (nrOfBytes >> 8) & 0x00FF;
	command[2] = 0x00FF & nrOfBytes;
	Start(spiP);
    Write(spiP, command, 3 );
	Stop(spiP);

	return 1;
}

int spiRead( uint8_t * data, int nrOfBytes)
{
	uint8_t *dptr;
	int i;
	Start(spiP);
	dptr = Read(spiP, nrOfBytes);
	Stop(spiP);

	for(i=0; i < nrOfBytes; i++)
	{
		data[i] = dptr[i];
	}
	return 1;
	
}

int spiWrite( uint8_t * data, int nrOfBytes)
{
	Start(spiP);
	Write(spiP, data, nrOfBytes );
	Stop(spiP);
	return 1;
}
/*
int main(void)
{
	uint8_t databuffer[6];
	spiOpen();
	
	databuffer[0] = 0x16;
	databuffer[1] = 0x10;
	databuffer[2] = 0x2a;
	spiCommand( WRITE, addrI2Cdac, 3 );
	spiWrite( databuffer, 3);
	
	databuffer[0] = 0x14;
	databuffer[1] = 0x10;
	databuffer[2] = 0x00;
	spiCommand( WRITE, addrI2Cdac, 3 );
	spiWrite( databuffer, 3);
	
	databuffer[0] = 0x12;
	databuffer[1] = 0xff;
	databuffer[2] = 0x00;
	spiCommand( WRITE, addrI2Cdac, 3 );
	spiWrite( databuffer, 3);
	
	databuffer[0] = 0x10;
	databuffer[1] = 0xff;
	databuffer[2] = 0x00;
	spiCommand( WRITE, addrI2Cdac, 3 );
	spiWrite( databuffer, 3);
	
	spiClose();
}*/
