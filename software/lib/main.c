//MAIN


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include "spicomm.h"
#include "scope_control.h"
#include "audio_codec.h"
#include "dcio.h"

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
	//set_Attenuation( 0, ON );
	//set_gain( 0, GAINx2);
	setVoltage(EXVO, 3.5, 0, 0);
        sleep(1);
	//00001101
	databuffer[0] = 0x05;
	//11110001
	databuffer[1] = 0xF1;
	//10000011
	databuffer[2] = 0x83;
	
        spiCommand( WRITE, 2, 3);
	spiWrite(databuffer, 3);
	sleep(1);
	spiCommand( WRITE, 2, 3);
	spiWrite(databuffer, 3);
	sleep(1);
	spiCommand( READ, 2, 3);
	spiRead(databuffer, 3);
	
	printf("databuffer %x %x %x \n", databuffer[0], databuffer[1], databuffer[2]);
	
	databuffer[0] = 0x01;
	databuffer[1] = 0x0f;
	databuffer[2] = 0x00;
	databuffer[3] = 0x00;

	databuffer[4] = 0;
	databuffer[5] = 5;
	databuffer[6] = 10;
	databuffer[7] = 12;
	databuffer[8] = 15;
	databuffer[9] = 25;
	databuffer[10] = 35;
	databuffer[11] = 55;
	databuffer[12] = 75;
	databuffer[13] = 60;
	databuffer[14] = 40;
	databuffer[15] = 30;
	databuffer[16] = 25;
	databuffer[17] = 20;
	databuffer[18] = 15;
	databuffer[19] = 7;
	
	
	spiCommand( WRITE, 8, 20);
        spiWrite(databuffer, 20);


        setVoltage(HSADCOFFSET0, 0, 0, 0);

        setVoltage(HSADCOFFSET1, 0, 0, 0);

	sleep(1);
	set_scope_config( 2,
			  0,
			  2,
			  7,  //channel
			  0,
                          4, //freq 4 200MHZ 2 100MHZ 0 50 MHZ
		          0,
                          255,
		          1,
			  18432
			);
	sleep(10);
	
	new_read_ram( );
			
//	setVoltage(HSADCOFFSET0, -2.1, 0, 0);
	
//	setVoltage(HSADCOFFSET1, -1.9, 0, 0);
	
	setVoltage(LAOFFSET, 0.0, 0, 0);
	
	setVoltage(EXVO, 4.1, 0, 0);
	
	setVoltage(LADVREF, 0.5, 0, 0);
	
	setVoltage(LAVIO, 3.3, 0, 0);

	
	spiClose();
}
