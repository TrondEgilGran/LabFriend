//scope_control.h


#define initialOffset  -2.05

#define nrOfRamAddresses_fast 65536
#define nrOfRamAddresses 524288
#define bytesPerRamAddress 3

#define fastRamRead 0x10

#define nrOfChannels 2

#define gainMask 0xF0
#define DCMask 0x0C
#define AttMask 0x03
#define gainShift 4
#define DCShift 2
#define AttShift 0

#define AC 0x02
#define DC 0x01

#define ON 0x01
#define OFF 0x02
#define TRIS 0x00

#define GAINx1  0x00
#define GAINx2  0x0A
#define GAINx4  0x05
#define GAINx10 0x0E
#define GAINx20 0x01
#define GAINx40 0x02

#define attenuation_value 25.025 //961/40k resistances
#define ADCrange 1.6


#define cmd_read_trigger	0
#define cmd_read_ram 		1
#define cmd_configure 		2
#define cmd_read_status		3
#define cmd_configure2      5

#define command 			0
#define conf_ram_mux 			1
#define conf_clock_power 		2
#define conf_trigger 			3
#define conf_trigger_value 		4
#define conf_trigger_time_offset0 	5
#define conf_trigger_time_offset1 	6
#define conf_trigger_time_offset2 	7

/* RAM have four groups, two 8 bit groups and two
 * 1 bit groups. for the 8 bit groups its possible to select adc channel
 * 0 and 1 and all 8 digital inputs. for the 1 bit groups its possible to select
 * one any one of the 8 digital inputs.
 */
#define ram_group_0sel_mask 	0x03
#define ram_group_1sel_mask 	0x0C
#define ram_group_2sel_mask 	0x70
#define ram_group_3sel_mask 	0x07
#define ram_group_0sel_shift 	0
#define ram_group_1sel_shift 	2
#define ram_group_2sel_shift 	4
#define ram_group_3sel_shift 	0
#define ram_digital_muxed_shift	7

#define adc_channel_0 		0
#define adc_channel_1 		1
#define digital_channel_all 	2
#define digital_channel_0	0
#define digital_channel_1	1
#define digital_channel_2	2
#define digital_channel_3	3
#define digital_channel_4	4
#define digital_channel_5	5
#define digital_channel_6	6
#define digital_channel_7	7

#define ram_digital_muxed	1
#define ram_digital_interleaved	0

/* ADC config, can power up or down ADC and select clock polarity
 */

#define adc_powerdown_mask	0X20
#define adc_clock_pol_mask	0x18
#define adc_powerdown_shift	5
#define adc_clock_pol_shift	3

#define adc_clock_interleaved	0x02
#define adc_clock_normal	0x00

#define powerdown_adc 		1
#define powerup_adc		0

/* Trigger config. Trigger source can be on any ram group, so it's form 0 to 3
 */

#define trigger_source_mask	0x03
#define trigger_edge_mask	0x0C
#define trigger_source_shift	0
#define trigger_edge_shift	2

#define trigger_edge_pos	1
#define trigger_edge_neg	0
#define trigger_automatic	2

#define start_capture_shift	3

#define scope_status_ram_data_available	0x01
#define scope_status_ram_data_full	0x02
#define scope_status_triggered		0x04
#define scope_status_ram_read_finished	0x08
#define scope_status_read_ready		0x10

#define srateDiv1    0x00
#define srateDiv2    0x10
#define srateDiv4    0x20
#define srateDiv6    0x30
#define srateDiv8    0x40
#define srateDiv16   0x50
#define srateDiv32   0x60
#define srateDiv64   0x70
#define srateDiv128  0x80
#define srateDiv256  0x90
#define srateDiv512  0xA0
#define srateDiv1024 0xB0

#define srateMult1  0x00
#define srateMult2  0x08
#define srateMult4  0x18



int set_gain( uint8_t channel, uint8_t gain);
int set_ACDC( uint8_t channel, uint8_t acdc);
int set_Attenuation( uint8_t channel, uint8_t attenuation);
int set_probe_attenuation(uint8_t channel, float attenuation);
void init_scope_control(void);
uint8_t set_trigger_voltage( uint8_t channel, float trigger_voltage);
int set_scope_config(uint8_t trigger_value,
            uint8_t trigger_source,
                uint8_t trigger_edge,
            uint8_t ram0_sel,
                uint8_t ram_digi_muxed,
            uint8_t adc_powerdown,
                uint8_t adc_clock,
            uint32_t trigger_ram_offset,
            uint8_t start_capture, uint32_t scopedatasize);

int read_ram( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint32_t buffersize, uint8_t number_of_channels);
int read_ram_fast( uint8_t * ram_group_0, uint8_t * ram_group_1, uint8_t *ram_group_2, uint8_t *ram_group_3);
int scope_data_available(void);
int set_digital_out( uint8_t outputByte);
int new_read_ram(void);

int scope_read_trigger(void);



