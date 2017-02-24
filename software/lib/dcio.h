//I2CDAC

#define HSADCOFFSET0	0x03
#define HSADCOFFSET1	0x04
#define LAVIO		0x00
#define LADVREF     0x05
#define LAOFFSET    0x01
#define EXVO		0x02


#define SINGLECONVERSION 0x8000
#define LOGGERADC0      0x4000
#define LOGGERADC1      0x5000
#define LOGGERADC2      0x6000
#define LOGGERADC3      0x7000
#define LOGGERSPS15     0x0080  //128
#define LOGGERGAIN1     0x0000
#define LOGGERGAIN2     0x0400
#define LOGGERGAIN4     0x0400
#define LOGGERGAIN8     0x0600
#define LOGGERGAIN16    0x0800
#define LOGGERGAIN32    0x0A00
#define LOGGERTEMP      0x0010


int setVoltage(uint8_t channel, float voltage, float gainerror, float offset);

float getVoltage(uint16_t config);
