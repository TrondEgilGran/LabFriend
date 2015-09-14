//scope_control.c
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include "spicomm.h"
#include "scope_control.h"

static uint8_t global_channel_config[nrOfChannels];
static uint8_t global_attenuationEnabled[nrOfChannels];
static uint8_t global_AC_Enabled[nrOfChannels];
static float global_probe_attenuation[nrOfChannels];


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
		//set_ACDC(i, DC);
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

int set_digital_out( uint8_t outputByte)
{
    uint8_t databuffer[3];
    databuffer[0] = outputByte;
    spiCommand( WRITE, addrdigitalOut, 1 );
    spiWrite( databuffer, 1 );
    return 1;
}

int set_ACDC( uint8_t channel, uint8_t acdc)
{
	uint8_t databuffer[3];
	
	global_AC_Enabled[channel] = acdc;
	
	global_channel_config[channel] = (global_channel_config[channel] & ~DCMask) | acdc << DCShift;

	databuffer[0] = global_channel_config[0];
	databuffer[1] = global_channel_config[1];
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );
    printf( "Pre written channel %d, config %x\n", channel,  global_channel_config[channel] );
	
	//Wait for dealy for relay to settle
	sleep(1);
	

	global_channel_config[channel] = (global_channel_config[channel] & ~DCMask) | TRIS << DCShift;
	
	databuffer[0] = global_channel_config[0];
	databuffer[1] = global_channel_config[1];
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );
    printf( "Post written channel %d, config %x \n", channel,  global_channel_config[channel]);
	
	global_channel_config[channel] = (global_channel_config[channel] & ~DCMask) | acdc << DCShift;
	return 1;
}

int set_Attenuation( uint8_t channel, uint8_t attenuation)
{
	uint8_t databuffer[3];
	
	global_attenuationEnabled[channel] = attenuation;
	
	global_channel_config[channel] = (global_channel_config[channel] & ~AttMask) | attenuation << AttShift;
		
	databuffer[0] = global_channel_config[0];
	databuffer[1] = global_channel_config[1];
	
	spiCommand( WRITE, addr74595, 2 );
	spiWrite( databuffer, 2 );
    printf( "Pre written channel %d, config %x \n", channel,  global_channel_config[channel]);
	
	//Wait for dealy for relay to settle
	sleep(1);
	

	global_channel_config[channel] = (global_channel_config[channel] & ~AttMask) | TRIS << AttShift;

	databuffer[0] = global_channel_config[0];
	databuffer[1] = global_channel_config[1];
	
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

    if( (scope_status_ram_data_full & databuffer[0]) ==  scope_status_ram_data_full )
    {
        returnvalue = 1;
    }

    return returnvalue;
}

int set_scope_config( 	uint8_t trigger_value, 
			uint8_t trigger_source,
		        uint8_t trigger_edge,
			uint8_t ram0_sel, 
			uint8_t ram1_sel,
		        uint8_t ram2_sel,
		        uint8_t ram3_sel,
		        uint8_t ram_digi_muxed,
			uint8_t adc_powerdown, 
		        uint8_t adc_clock,
			uint32_t trigger_ram_offset,
			uint8_t start_capture)
{
	uint8_t databuffer[8];
	
	databuffer[command] 		= cmd_configure;
	databuffer[conf_ram_mux]	= 	(ram0_sel << ram_group_0sel_shift) | 
						(ram1_sel << ram_group_1sel_shift) |
						(ram2_sel << ram_group_2sel_shift) |
						(ram_digi_muxed << ram_digital_muxed_shift);
	databuffer[conf_clock_power]	=	(ram3_sel << ram_group_3sel_shift) |
						(adc_powerdown << adc_powerdown_shift) |
						(adc_clock << adc_clock_pol_shift);
    databuffer[conf_trigger]	=	((trigger_source << trigger_source_shift)& trigger_source_mask) |
                        ((trigger_edge << trigger_edge_shift)& trigger_edge_mask) |
                        (trigger_source) ;
						printf("trigger Conf %x\n", databuffer[conf_trigger]);
	databuffer[conf_trigger_value]	= 	trigger_value;
	databuffer[conf_trigger_time_offset0] = 0x000000FF & trigger_ram_offset;
	databuffer[conf_trigger_time_offset1] = 0x000000FF & (trigger_ram_offset >> 8);
	databuffer[conf_trigger_time_offset2] = (0x00000007 & (trigger_ram_offset >> 16)) |
						(start_capture << start_capture_shift);
	
	spiCommand( WRITE, addrHSaqusition, 8 );
	spiWrite( databuffer, 8 );
	printf( "Scope config started\n");
	if( start_capture == 1 ) printf("data capture started\n");
	
	return 1;
}

#define temp_buffersize 49152

int read_ram( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint8_t *ram_group_3)
{
    uint8_t *databuffer;
	int ramadress=0;
	int i, ia;

    databuffer = (uint8_t *) malloc(temp_buffersize+5);
    if (databuffer==NULL) exit (1);

	databuffer[command] = cmd_read_ram;
	spiCommand( WRITE, addrHSaqusition, 1 );
	spiWrite( databuffer, 1 );
	
	
	ramadress=0;
    for(i = 0; i < (nrOfRamAddresses*bytesPerRamAddress)/temp_buffersize; i ++ )
	{	
        spiCommand( READ, addrHSaqusition, temp_buffersize );
        spiRead( databuffer, temp_buffersize );
		//printf("Read address %d to %d, ramaddr %d\n", i*bytesPerRamAddress, i*bytesPerRamAddress +192, ramadress);
        for( ia = 0; ia < temp_buffersize; ia=ia+3)
		{
			*(ram_group_0 + ramadress) = databuffer[0+ia];
			*(ram_group_1 + ramadress) = databuffer[1+ia];
			*(ram_group_2 + ramadress) = databuffer[2+ia] & 0x1;
			*(ram_group_3 + ramadress) = (databuffer[2+ia] >> 1) &0x01;
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


int read_ram_fast( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint8_t *ram_group_3)
{
    uint8_t *databuffer;
    int ramadress=0;
    int i, ia;

    databuffer = (uint8_t *) malloc(temp_buffersize+5);
    if (databuffer==NULL) exit (1);

    databuffer[command] = cmd_read_ram;
    spiCommand( WRITE, addrHSaqusition | fastRamRead, 1 );
    spiWrite( databuffer, 1 );


    ramadress=0;
    for(i = 0; i < (nrOfRamAddresses_fast*bytesPerRamAddress)/temp_buffersize; i ++ )
    {
        spiCommand( READ, addrHSaqusition | fastRamRead, temp_buffersize );
        spiRead( databuffer, temp_buffersize );
        //printf("Read address %d to %d, ramaddr %d\n", i*bytesPerRamAddress, i*bytesPerRamAddress +192, ramadress);
        for( ia = 0; ia < temp_buffersize; ia=ia+3)
        {
            *(ram_group_0 + ramadress) = databuffer[0+ia];
            *(ram_group_1 + ramadress) = databuffer[1+ia];
            *(ram_group_2 + ramadress) = databuffer[2+ia] & 0x1;
            *(ram_group_3 + ramadress) = (databuffer[2+ia] >> 1) &0x01;
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


