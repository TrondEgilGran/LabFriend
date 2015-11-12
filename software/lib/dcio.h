//I2CDAC

#define HSADCOFFSET0	0x10
#define HSADCOFFSET1	0x12
#define LAVIO		0x14
#define EXVO		0x16
#define i2cadcConfig	0x08
#define i2cdataread	0x10

#define SINGLECONVERSION 0x90
#define LOGGERADC0      0x00
#define LOGGERADC1      0x20
#define LOGGERSPS15     0x0C
#define LOGGERGAIN1     0x00
#define LOGGERGAIN2     0x01
#define LOGGERGAIN4     0x02
#define LOGGERGAIN8     0x03

int setVoltage(uint8_t channel, float voltage, float gainerror, float offset);

float getVoltage(uint8_t config);
