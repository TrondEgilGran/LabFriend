


#define addrHSaqusition	1
#define addrSPI         2
#define addrAudioCodec	3
#define addr74595		4
#define addrdigitalOut  5
#define addrDCIO		0
#define noCommand		0xFF
#define READ			0x80
#define WRITE			0x00

int spiOpen( void );
int spiClose( void );
int spiCommand( uint8_t RW, uint8_t address, uint16_t nrOfBytes );
int spiRead( uint8_t * data, int nrOfBytes);
int spiWrite( uint8_t * data, int nrOfBytes);

