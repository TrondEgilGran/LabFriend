

#include <stdio.h>
#include <stdlib.h>
#include <QApplication>
#include <time.h>
#include <stdint.h>
#define _ISOC9X_SOURCE  1
#define _ISOC99_SOURCE  1
#include  <math.h>




#include <QFileDialog>
#include <QString>
#include <QTimer>
#include <QTextStream>
#include <QDateTime>


#include "labfriend.h"
extern "C"
{
    #include <audio_codec.h>
    #include <scope_control.h>
    #include <dcio.h>
    #include <spicomm.h>
    #include <sys/time.h>
    #include <time.h>
    #include <unistd.h>
}

void labfriend::setTraceSource1(QString qsSource)
{
    if( !qsSource.compare("ADC 1") )
    {
        trace1source = adc_channel_0;
    }
    else if( !qsSource.compare("ADC 2") )
    {
        trace1source = adc_channel_1;
    }
    else if( !qsSource.compare("Digital")  )
    {
        trace1source = digital_channel_all;
    }
}
void labfriend::setTraceSource2(QString qsSource)
{
    if( !qsSource.compare("ADC 1") )
    {
        trace2source = adc_channel_0;
    }
    else if( !qsSource.compare("ADC 2") )
    {
        trace2source = adc_channel_1;
    }
    else if( !qsSource.compare("Digital")  )
    {
        trace2source = digital_channel_all;
    }
}

void labfriend::setTraceSource3(QString qsSource)
{
    if( !qsSource.compare("Digital 0") )
    {
        trace3source = digital_channel_0;
    }
    else if( !qsSource.compare("Digital 1") )
    {
        trace3source = digital_channel_1;
    }
    else if( !qsSource.compare("Digital 2")  )
    {
        trace3source = digital_channel_2;
    }
    else if( !qsSource.compare("Digital 3")  )
    {
        trace3source = digital_channel_3;
    }
    else if( !qsSource.compare("Digital 4")  )
    {
        trace3source = digital_channel_4;
    }
    else if( !qsSource.compare("Digital 5")  )
    {
        trace3source = digital_channel_5;
    }
    else if( !qsSource.compare("Digital 6")  )
    {
        trace3source = digital_channel_6;
    }
    else if( !qsSource.compare("Digital 7")  )
    {
        trace3source = digital_channel_7;
    }
}

void labfriend::setTraceSource4(QString qsSource)
{
    if( !qsSource.compare("Digital 0") )
    {
        trace4source = digital_channel_0;
    }
    else if( !qsSource.compare("Digital 1") )
    {
        trace4source = digital_channel_1;
    }
    else if( !qsSource.compare("Digital 2")  )
    {
        trace4source = digital_channel_2;
    }
    else if( !qsSource.compare("Digital 3")  )
    {
        trace4source = digital_channel_3;
    }
    else if( !qsSource.compare("Digital 4")  )
    {
        trace4source = digital_channel_4;
    }
    else if( !qsSource.compare("Digital 5")  )
    {
        trace4source = digital_channel_5;
    }
    else if( !qsSource.compare("Digital 6")  )
    {
        trace4source = digital_channel_6;
    }
    else if( !qsSource.compare("Digital 7")  )
    {
        trace4source = digital_channel_7;
    }
}

void labfriend::scopeBufferSizeF(QString qsSource)
{
    if( !qsSource.compare("18k") )
    {
        scopeBufferSizeV = 18432;
    }
    else if( !qsSource.compare("73k") )
    {
        scopeBufferSizeV = 73728;
    }
    else if( !qsSource.compare("147k") )
    {
        scopeBufferSizeV = 147456;
    }
    else if( !qsSource.compare("294k") )
    {
        scopeBufferSizeV = 294912;
    }
    else if( !qsSource.compare("589k") )
    {
        scopeBufferSizeV = 589824;
    }
    else if( !qsSource.compare("1.1M") )
    {
        scopeBufferSizeV = 1179648;
    }
    else if( !qsSource.compare("2.3M") )
    {
        scopeBufferSizeV = 2359296;
    }
    else if( !qsSource.compare("4.7M") )
    {
        scopeBufferSizeV = 4718592;
    }
    else if( !qsSource.compare("9.4M") )
    {
        scopeBufferSizeV = 9437184;
    }
    scopeBufferSize = scopeBufferSizeV/3;
}

void labfriend::setVoltDiv(uint8_t channel, QString qsSource)
{
    if( !qsSource.compare("5mV/div") )
    {
        set_gain(channel, GAINx40 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv5mvOffsetError[channel];
        ADCGainError[channel] = vdiv5mvGainError[channel];
        scopeVdiv[channel] = 5e-3;
    }
    else if( !qsSource.compare("10mV/div") )
    {
        set_gain(channel, GAINx20 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv10mvOffsetError[channel];
        ADCGainError[channel] = vdiv10mvGainError[channel];
        scopeVdiv[channel] = 10e-3;
    }
    else if( !qsSource.compare("20mV/div")  )
    {
        set_gain(channel, GAINx10 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv20mvOffsetError[channel];
        ADCGainError[channel] = vdiv20mvGainError[channel];
        scopeVdiv[channel] = 20e-3;
    }
    else if( !qsSource.compare("50mV/div")  )
    {
        set_gain(channel, GAINx4 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv50mvOffsetError[channel];
        ADCGainError[channel] = vdiv50mvGainError[channel];
        scopeVdiv[channel] = 50e-3;
    }
    else if( !qsSource.compare("100mV/div")  )
    {
        set_gain(channel, GAINx2 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv100mvOffsetError[channel];
        ADCGainError[channel] = vdiv100mvGainError[channel];
        scopeVdiv[channel] = 100e-3;
    }
    else if( !qsSource.compare("200mV/div")  )
    {
        set_gain(channel, GAINx1 );
        set_Attenuation(channel, OFF);
        ADCOffsetError[channel] = vdiv200mvOffsetError[channel];
        ADCGainError[channel] = vdiv200mvGainError[channel];
        scopeVdiv[channel] = 200e-3;
    }
    else if( !qsSource.compare("500mV/div")  )
    {
        set_gain(channel, GAINx4 );
        set_Attenuation(channel, ON);
        ADCOffsetError[channel] = vdiv500mvOffsetError[channel];
        ADCGainError[channel] = vdiv500mvGainError[channel];
        scopeVdiv[channel] = 500e-3;
    }
    else if( !qsSource.compare("1V/div")  )
    {
        set_gain(channel, GAINx2 );
        set_Attenuation(channel, ON);
        ADCOffsetError[channel] = vdiv1vOffsetError[channel];
        ADCGainError[channel] = vdiv1vGainError[channel];
        scopeVdiv[channel] = 1.0;
    }
    else if( !qsSource.compare("2V/div")  )
    {
        set_gain(channel, GAINx1 );
        set_Attenuation(channel, ON);
        ADCOffsetError[channel] = vdiv2vOffsetError[channel];
        ADCGainError[channel] = vdiv2vGainError[channel];
        scopeVdiv[channel] = 2.0;
    }

    printf("Calib Offset VOltage, %f Gain %f \n", ADCOffsetError[channel], ADCGainError[channel]);
    if(channel == 0)
    {
        setOffsetADC1(scopeOffset[channel]);
    }
    else if(channel == 1)
    {
        setOffsetADC2(scopeOffset[channel]);
    }
}

void labfriend::setTimeDiv(QString qsSource)
{
    if( !qsSource.compare("100ns/div") )
    {
        scopeActualDiv = 100e-9;
    }
    else if( !qsSource.compare("200ns/div") )
    {
        scopeActualDiv = 200e-9;
    }
    else if( !qsSource.compare("500ns/div") )
    {
        scopeActualDiv = 500e-9;
    }
    else if( !qsSource.compare("1us/div") )
    {
        scopeActualDiv = 1e-6;
    }
    else if( !qsSource.compare("2us/div") )
    {
        scopeActualDiv = 2e-6;
    }
    else if( !qsSource.compare("5us/div") )
    {
        scopeActualDiv = 5e-6;
    }
    else if( !qsSource.compare("10us/div") )
    {
        scopeActualDiv = 10e-6;
    }
    else if( !qsSource.compare("20us/div") )
    {
        scopeActualDiv = 20e-6;
    }
    else if( !qsSource.compare("50us/div") )
    {
        scopeActualDiv = 50e-6;
    }
    else if( !qsSource.compare("100us/div") )
    {
        scopeActualDiv = 100e-6;
    }
    else if( !qsSource.compare("200us/div") )
    {
        scopeActualDiv = 200e-6;
    }
    else if( !qsSource.compare("500us/div") )
    {
        scopeActualDiv = 500e-6;
    }
    else if( !qsSource.compare("1ms/div") )
    {
        scopeActualDiv = 1e-3;
    }
    else if( !qsSource.compare("2ms/div") )
    {
        scopeActualDiv = 2e-3;
    }
    else if( !qsSource.compare("5ms/div") )
    {
        scopeActualDiv = 5e-3;
    }
    else if( !qsSource.compare("10ms/div") )
    {
        scopeActualDiv = 10e-3;
    }
    else if( !qsSource.compare("20ms/div") )
    {
        scopeActualDiv = 20e-3;
    }
    else if( !qsSource.compare("50ms/div") )
    {
        scopeActualDiv = 50e-3;
    }
    else if( !qsSource.compare("100ms/div") )
    {
        scopeActualDiv = 100e-3;
    }
    else if( !qsSource.compare("200ms/div") )
    {
        scopeActualDiv = 200e-3;
    }
    else if( !qsSource.compare("500ms/div") )
    {
        scopeActualDiv = 500e-3;
    }
    else if( !qsSource.compare("1s/div") )
    {
        scopeActualDiv = 1.0;
    }

}

void labfriend::setScopeSampleRate(QString qsSource)
{
    if( !qsSource.compare("200 MSps") )
    {
        srateDiv = srateDiv1;
        srateMult = srateMult4;
        scopeSampleRate =  MASATERCLKFREQ*4;
    }
    else if( !qsSource.compare("100 MSps") )
    {
        srateDiv = srateDiv1;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ*2;
    }
    else if( !qsSource.compare("50 MSps") )
    {
        srateDiv = srateDiv2;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ;
    }
    else if( !qsSource.compare("25 MSps") )
    {
        srateDiv = srateDiv4;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/2;
    }
    else if( !qsSource.compare("12.5 MSps") )
    {
        srateDiv = srateDiv8;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/4;
    }
    else if( !qsSource.compare("6.25 MSps") )
    {
        srateDiv = srateDiv16;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/8;
    }
    else if( !qsSource.compare("3.125 MSps") )
    {
        srateDiv = srateDiv32;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/16;
    }
    else if( !qsSource.compare("1.56 MSps") )
    {
        srateDiv = srateDiv64;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/32;
    }
    else if( !qsSource.compare("781 kSps") )
    {
        srateDiv = srateDiv128;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/64;
    }
    else if( !qsSource.compare("390 kSps") )
    {
        srateDiv = srateDiv256;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/128;
    }
    else if( !qsSource.compare("195 kSps") )
    {
        srateDiv = srateDiv512;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/256;
    }
    else if( !qsSource.compare("97.6 kSps") )
    {
        srateDiv = srateDiv1024;
        srateMult = srateMult2;
        scopeSampleRate =  MASATERCLKFREQ/512;
    }
    else if( !qsSource.compare("48.8 kSps") )
    {
        srateDiv = srateDiv1024;
        srateMult = srateMult1;
        scopeSampleRate =  MASATERCLKFREQ/1024;
    }
    timeOffsetFormat();

}

void labfriend::timeOffsetFormat()
{
    double offsetRange;

    if(scopeSampleRate > MASATERCLKFREQ*2 )
    {
        scopeTimeOffsetFormat = 1000000.0;
        superplot.ui.dbsTimeOffset->setSuffix("us");
    }
    else
    {
         scopeTimeOffsetFormat = 1000.0;
         superplot.ui.dbsTimeOffset->setSuffix("ms");
    }
    offsetRange = scopeTimeOffsetFormat* ((1/scopeSampleRate) * scopeBufferSize)/2;
    superplot.ui.dbsTimeOffset->setRange(-offsetRange, offsetRange);
}

void labfriend::scope_controls_init( void )
{
    superplot.ui.cmbTraceSource1->setCurrentIndex(1);
    superplot.ui.cmbTraceSource1->setCurrentIndex(0);
    superplot.ui.cmbTraceSource2->setCurrentIndex(1);
    superplot.ui.cmbTraceSource3->setCurrentIndex(1);
    superplot.ui.cmbTraceSource3->setCurrentIndex(0);
    superplot.ui.cmbTraceSource4->setCurrentIndex(1);
    superplot.ui.cmbTimeDiv->setCurrentIndex(2);
    superplot.ui.cmbADC1->setCurrentIndex(7);
    superplot.ui.cmbADC2->setCurrentIndex(7);
    superplot.ui.cbACADC1->setCheckState(Qt::Unchecked);
    superplot.ui.cbACADC1->setCheckState(Qt::Unchecked);
    superplot.ui.dbsOffset1->setSuffix("mV");
    superplot.ui.dbsOffset1->setDecimals(1);
    superplot.ui.dbsOffset1->setRange(-500.0, 500.0);
    superplot.ui.dbsOffset1->setValue(0.1);
    superplot.ui.dbsOffset1->setValue(0.0);
    superplot.ui.dbsOffset2->setSuffix("mV");
    superplot.ui.dbsOffset2->setDecimals(1);
    superplot.ui.dbsOffset2->setRange(-500.0, 500.0);
    superplot.ui.dbsOffset2->setValue(0.1);
    superplot.ui.dbsOffset2->setValue(0.0);
    superplot.ui.dbsTimeOffset->setDecimals(2);
    superplot.ui.dbsTimeOffset->setRange(-5.0, 5.0);
    superplot.ui.dbsTimeOffset->setSuffix("ms");
    superplot.ui.dbsTimeOffset->setValue(0.01);
    superplot.ui.dbsTimeOffset->setValue(0.00);
    superplot.ui.pbTrigSingle->setChecked(true);
    superplot.ui.dbsTriggerLevel->setDecimals(1);
    superplot.ui.dbsTriggerLevel->setRange(-8000, 8000);
    superplot.ui.dbsTriggerLevel->setSuffix("mV");
    superplot.ui.dbsTriggerLevel->setValue(1.0);
    superplot.ui.dbsTriggerLevel->setValue(0.0);
    superplot.ui.cmbScopeSampleRate->setCurrentIndex(1);
 //   superplot.ui.cmbTriggerSource->setCurrentIndex(2);
}

void labfriend::scope_controls_connect(void)
{
    QObject::connect( superplot.ui.pbTrigSingle , SIGNAL(toggled(bool)), this, SLOT(singleScopeRun(bool)));
    QObject::connect( superplot.ui.pbStartStop , SIGNAL( clicked() ), this, SLOT(scopeStart()));
    QObject::connect( superplot.timerA, SIGNAL(timeout()), this, SLOT(ScopeRun()));
    QObject::connect( superplot.ui.cmbTraceSource1, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTraceSource1(QString)));
    QObject::connect( superplot.ui.cmbTraceSource2, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTraceSource2(QString)));
    QObject::connect( superplot.ui.cmbTraceSource3, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTraceSource3(QString)));
    QObject::connect( superplot.ui.cmbTraceSource4, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTraceSource4(QString)));
    QObject::connect( superplot.ui.cmbADC1, SIGNAL( currentIndexChanged(QString)), this, SLOT(setVoltDivADC1(QString)));
    QObject::connect( superplot.ui.cmbADC2, SIGNAL( currentIndexChanged(QString)), this, SLOT(setVoltDivADC2(QString)));
    QObject::connect( superplot.ui.cbACADC1, SIGNAL(toggled(bool)), this, SLOT(setAcADC1(bool)));
    QObject::connect( superplot.ui.cbACADC2, SIGNAL(toggled(bool)), this, SLOT(setAcADC2(bool)));
    QObject::connect( superplot.ui.cmbTrigType, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTrigType(QString)));
    QObject::connect( superplot.ui.cmbTimeDiv, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTimeDiv(QString)));
    QObject::connect( superplot.ui.cmbScopeSampleRate, SIGNAL( currentIndexChanged(QString)), this, SLOT(setScopeSampleRate(QString)));
    QObject::connect( superplot.ui.cmbTriggerSource, SIGNAL( currentIndexChanged(QString)), this, SLOT(setTrigSource(QString)));
    QObject::connect( superplot.ui.dbsOffset2 , SIGNAL( valueChanged(double) ), this, SLOT(setOffsetADC2(double)));
    QObject::connect( superplot.ui.dbsOffset1 , SIGNAL( valueChanged(double) ), this, SLOT(setOffsetADC1(double)));
    QObject::connect( superplot.ui.dbsTimeOffset , SIGNAL( valueChanged(double) ), this, SLOT(setOffsetTime(double)));
    QObject::connect( superplot.ui.dbsTriggerLevel , SIGNAL( valueChanged(double) ), this, SLOT(setTriggerValue(double)));
}

