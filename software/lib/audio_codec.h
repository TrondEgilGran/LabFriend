
#define	I2SCONFIG	0x00 //00000000
#define I2SDACCOUNTER	0x40 //01000000
#define I2SADCCOUNTER	0x60 //01100000
#define I2SDACDATA	0x10 //00010000
#define I2SADCDATA	0x08 //00001000
#define I2SDACFIFOH	0x20 //00100000
#define I2SDACFIFOL	0x28 //00101000
#define I2SSYNC 0x48 //01001000

#define EnableADC	0x10 
#define EnableDAC	0x20
#define SampleRate96k	0x00
#define SampleRate48k   0x01
#define SampleRate32k   0x02
#define SampleRate24k	0x03
#define SampleRate19k	0x04
#define SampleRate16k	0x05
#define audioATT1	0x00
#define audioATT10	0x40
#define audioRef	0x80
#define audioGnd	0xC0

#define FifoBufferSize	4096

#define MAXINPUT_AMPLITUDE 1.5
#define MAXSIGNALRAW 8388607.0

#define FULL 0
#define FIFOLEVEL 1

#define I2SGROUPDELAY 69


int getADCdata(double * samples_R,  double * samples_L, float gainerror_L, float offseterror_L, float gainerror_R, float offseterror_R );
int setI2Sconfig( uint8_t config);
float getSampleRate(uint8_t config);
int sineGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples);
int setDACdata( float * samples_R,  float * samples_L, float gainerror_L, float offseterror_L, float gainerror_R, float offseterror_R, int samplecount);
int setDacSampleCount(int fifofill);
int squareGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples);
int diracGenerator( float * samples, float frequency, float amplitude, float samplerate, uint32_t nrOfSamples);
int audioSPI(uint8_t address, uint8_t data);
int setI2sync( void );
