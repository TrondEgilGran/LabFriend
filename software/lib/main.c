//MAIN


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include "spicomm.h"
#include "scope_control.h"
#include "audio_codec.h"

int main(void)
{
	uint8_t databuffer[24];
	spiOpen();
	init_scope_control();
	set_Attenuation( 0, ON );
	//set_gain( 0, GAINx2);
	
	spiCommand( READ, 5, 2);
	spiRead(databuffer, 2);
	printf("Number 5 is %x and %x \n", databuffer[0], databuffer[1]);

	spiCommand( READ, 7, 2);
	spiRead(databuffer, 2);
	printf("Number 7 is %x and %x \n", databuffer[0], databuffer[1]);
	
	spiClose();
}