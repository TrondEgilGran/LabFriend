//MAIN


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include "spicomm.h"
#include "scope_control.h"
#include "audio_codec.h"

void ddrStatus(void)
{
	uint8_t databuffer[24];
	spiCommand( READ, 2, 8);
	spiRead(databuffer, 8);
	printf("------------------------------------------------\n \n \n");
	printf("signature %x, calib done %x \n", databuffer[0], databuffer[3]&0x80);
	printf("Write count %x\n", databuffer[1]&0x7f);
	printf("WR Full %x, WR Empty %x, WR Underrrun %x, WR Error %x\n",  
	       databuffer[1]&0x80, databuffer[2]&0x01, databuffer[2]&0x02, databuffer[2]&0x04);
	printf("RD Full %x, RD Empty %x, RD Overflow %x, RD Error %x, RD EN %x \n", 
	       databuffer[2]&0x10, databuffer[2]&0x08, databuffer[2]&0x40, databuffer[2]&0x20, databuffer[2]&0x80);
	printf("Read count %x \n", databuffer[3]&0x7f);
	printf("cmd_bl %x, cmd_instr %x, cmd_addr0 %x, cmd_addr1 %x \n", databuffer[4], databuffer[5], databuffer[6], databuffer[7]);
	printf("-------------------------------------------------\n \n \n");
	
}

int main(void)
{
	uint8_t databuffer[24];
	spiOpen();
	init_scope_control();
	set_Attenuation( 0, ON );
	set_gain( 0, GAINx2);

	set_digital_out(0x55);
	sleep(1);
	set_scope_config( 2,
			  0,
			  2,
			  7,  //channel
			  0,
			  0, //freq 4 200MHZ 2 100MHZ 0 50 MHZ
		          0,
		          260000,
		          1);
	sleep(1);
	new_read_ram( );
			
	
	
	spiClose();
}