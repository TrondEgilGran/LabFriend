//I2CDAC

#define HSADCOFFSET0	0x03
#define HSADCOFFSET1	0x04
#define LAVIO		0x00
#define LADVREF     0x05
#define LAOFFSET    0x01
#define EXVO		0x02


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
