

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





void labfriend::open_DO_file(void)
{
  
    uint8_t dobit0;
    uint8_t dobit1;
    uint8_t dobit2;
    uint8_t dobit3;
    uint8_t dobit4;
    uint8_t dobit5;
    uint8_t dobit6;
    uint8_t dobit7;

    QString fileName = QFileDialog::getOpenFileName(this);
    
     QFile file(fileName);
     if (file.open(QFile::ReadOnly)) 
     {

        char buf[1024];
        qint64 lineLength;
        char * pEnd;
        int i=0;


        printf("startfile \n");
        while( !file.atEnd() )
        {
            lineLength = file.readLine(buf, sizeof(buf));

            if (lineLength != -1)
            {
            // the line is available in buf
              dobit0 = strtod (buf, &pEnd);
              dobit1 = strtod (pEnd, &pEnd);
              dobit2 = strtod (pEnd, &pEnd);
              dobit3 = strtod (pEnd, &pEnd);
              dobit4 = strtod (pEnd, &pEnd);
              dobit5 = strtod (pEnd, &pEnd);
              dobit6 = strtod (pEnd, &pEnd);
              dobit7 = strtod (pEnd, NULL);
              dobit07[i] = dobit0 | (dobit1 << 1) | (dobit2 << 2) | (dobit3 << 3) | (dobit4 << 4) | (dobit5 << 5) | (dobit6 << 6) | (dobit7 << 7);
              printf("byte %d is %x\n", i, dobit07[i]);
              i++;

            }

        }
        printf("i is %d \n", i);
        dosize = i;
    }
	
}

void labfriend::open_AO_file(void)
{

   double temp_values;

    QString fileName = QFileDialog::getOpenFileName(this);

     QFile file(fileName);
     if (file.open(QFile::ReadOnly))
     {

        char buf[1024];
        qint64 lineLength;
        int i=0;


        printf("startfile \n");
        while( !file.atEnd() )
        {
            lineLength = file.readLine(buf, sizeof(buf));

            if (lineLength != -1)
            {
            // the line is available in buf
              temp_values = strtod (buf, NULL);
              aovalue[i] = (uint8_t)round(temp_values*RFDACMAX/RFDACREF);
              printf("byte %d is %f %d\n", i, temp_values, aovalue[i]);
              i++;

            }

        }
        printf("i is %d \n", i);
        aosize = i;
    }

}







void labfriend::ScopeRun(void)
{

   superplot.timerA->stop();
   {
        if(dataLoggerEnabled)
        {
            if( dataLoggerTimer < dataLoggerTimerMax )
            {
                dataLoggerTimer++;
            }
            else
            {
                getLoggerData();
                //Run data logger funcget
                dataLoggerTimer = 0;
            }
        }

        if(scopeEnabled)
        {
            if( scopeUpdateTimer < scopeUpdateTimerMax )
            {
                scopeUpdateTimer++;
            }
            else
            {
                scope_run_main();
                //run scope data
                scopeUpdateTimer = 0;
            }

        }

        if(audioEnabled)
        {
            if( audioUpdateTimer < audioUpdateTimerMax )
            {
                audioUpdateTimer++;
            }
            else
            {
                get_audio_data();
                audioUpdateTimer = 0;
            }
        }

        audio_generate();

    }
   superplot.timerA->start();
}


void labfriend::singleScopeRun(bool checked)
{
    scopeSingle = checked;
    printf("yes dude %d\n", checked);
}



void labfriend::setVoltDivADC1(QString qsSource)
{
    setVoltDiv(adc_channel_0, qsSource);
}

void labfriend::setVoltDivADC2(QString qsSource)
{
    setVoltDiv(adc_channel_1, qsSource);
}

void labfriend::setAcADC1(bool checked)
{
    if(checked)
    {
        set_ACDC(adc_channel_0, AC);
    }
    else
    {
        set_ACDC(adc_channel_0, DC);
    }
}

void labfriend::setAcADC2(bool checked)
{
    if(checked)
    {
        set_ACDC(adc_channel_1, AC);
    }
    else
    {
        set_ACDC(adc_channel_1, DC);
    }
}

void labfriend::GenerateAudio(bool checked)
{
    GenerateAudioEnable = checked;
}



void labfriend::dataLoggerChekerbox(bool checked)
{
    dataLoggerEnabled = checked;
}

void labfriend::dataLoggerFileChekerbox(bool checked)
{
    dataLoggertoFile = checked;
}


void labfriend::setDigiOut0(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x01;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x01;
    }
}
void labfriend::setDigiOut1(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x02;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x02;
    }
}
void labfriend::setDigiOut2(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x04;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x04;
    }
}
void labfriend::setDigiOut3(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x08;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x08;
    }
}
void labfriend::setDigiOut4(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x10;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x10;
    }
}
void labfriend::setDigiOut5(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x20;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x20;
    }
}
void labfriend::setDigiOut6(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x40;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x40;
    }
}
void labfriend::setDigiOut7(bool checked)
{
    if(checked)
    {
        digitalOutputByte = digitalOutputByte | 0x80;
    }
    else
    {
        digitalOutputByte = digitalOutputByte & ~0x80;
    }
}

void labfriend::setFileDOenable(bool checked)
{
    doFileEnable = checked;
    dobyteCounter = 0;
}

void labfriend::setFileLoop(bool checked)
{
    doLoopFile = checked;
}


void labfriend::setTrigType(QString qsTrigType)
{
    if( !qsTrigType.compare("Pos Edge") )
    {
        triggerType = trigger_edge_pos;
    }
    else if( !qsTrigType.compare("Neg Edge") )
    {
        triggerType = trigger_edge_neg;
    }
    else if( !qsTrigType.compare("Automatic") )
    {
        triggerType = trigger_automatic;
    }
}

void labfriend::setLoggerGain1(QString qsTrigType)
{
    if( !qsTrigType.compare("X1") )
    {
        loggerGainCH1 = LOGGERGAIN1;
    }
    else if( !qsTrigType.compare("X2") )
    {
        loggerGainCH1 = LOGGERGAIN2;
    }
    else if( !qsTrigType.compare("X4") )
    {
        loggerGainCH1 = LOGGERGAIN4;
    }
    else if( !qsTrigType.compare("X8") )
    {
        loggerGainCH1 = LOGGERGAIN8;
    }

}

void labfriend::setLoggerGain2(QString qsTrigType)
{
    if( !qsTrigType.compare("X1") )
    {
        loggerGainCH2 = LOGGERGAIN1;
    }
    else if( !qsTrigType.compare("X2") )
    {
        loggerGainCH2 = LOGGERGAIN2;
    }
    else if( !qsTrigType.compare("X4") )
    {
        loggerGainCH2 = LOGGERGAIN4;
    }
    else if( !qsTrigType.compare("X8") )
    {
        loggerGainCH2 = LOGGERGAIN8;
    }

}

void labfriend::setLoggerGain3(QString qsTrigType)
{
    if( !qsTrigType.compare("X1") )
    {
        loggerGainCH3 = LOGGERGAIN1;
    }
    else if( !qsTrigType.compare("X2") )
    {
        loggerGainCH3 = LOGGERGAIN2;
    }
    else if( !qsTrigType.compare("X4") )
    {
        loggerGainCH3 = LOGGERGAIN4;
    }
    else if( !qsTrigType.compare("X8") )
    {
        loggerGainCH3 = LOGGERGAIN8;
    }

}

void labfriend::getLoggerData( void )
{
    QFile file("datalogger.txt");
    loggerChannel1.resize(loggersample+1);
    loggerChannel2.resize(loggersample+1);
    loggerChannel3.resize(loggersample+1);
    loggerExvo.resize(loggersample+1);
    loggerTemp.resize(loggersample+1);
    printf("lgain %x %x %x", loggerGainCH1, loggerGainCH2, loggerGainCH3);
    loggerChannel1[loggersample]  = getVoltage(LOGGERADC0 | SINGLECONVERSION | LOGGERSPS15 | loggerGainCH1);
    loggerChannel2[loggersample]  = getVoltage(LOGGERADC1 | SINGLECONVERSION | LOGGERSPS15 | loggerGainCH2);
    loggerChannel3[loggersample]  = getVoltage(LOGGERADC2 | SINGLECONVERSION | LOGGERSPS15 | loggerGainCH3);
    loggerExvo[loggersample]      = getVoltage(LOGGERADC3 | SINGLECONVERSION | LOGGERSPS15 | LOGGERGAIN1);
    loggerTemp[loggersample]      = getVoltage(LOGGERTEMP | SINGLECONVERSION | LOGGERSPS15 | LOGGERGAIN1);
    Logxaxis.resize(loggersample + 1);
    Logxaxis[loggersample] = loggersample;
    superplot.ui.qcpDataLog->graph(0)->setData(Logxaxis, loggerChannel1);
    superplot.ui.qcpDataLog->graph(1)->setData(Logxaxis, loggerChannel2);
    superplot.ui.qcpDataLog->graph(2)->setData(Logxaxis, loggerChannel3);
    superplot.ui.qcpDataLog->graph(3)->setData(Logxaxis, loggerTemp);

    superplot.ui.lcdCh1->display(loggerChannel1[loggersample] * 1000);
    superplot.ui.lcdCh2->display(loggerChannel2[loggersample] * 1000);
    superplot.ui.lcdCh3->display(loggerChannel3[loggersample] * 1000);
    superplot.ui.lcdEXVO->display(loggerExvo[loggersample] * 1000 );
    superplot.ui.lcdTemp->display(loggerTemp[loggersample] );

    superplot.ui.qcpDataLog->xAxis->setRange(0, loggersample);
    emit replotTriggerDataNow();

    if( dataLoggertoFile == true)
    {
        file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append);
        QTextStream out(&file);
        out << QDateTime::currentMSecsSinceEpoch() << " " << loggerChannel1[loggersample] << " " << loggerChannel2[loggersample] << " "
            << loggerChannel3[loggersample] << " " << loggerExvo[loggersample] << " " << loggerTemp[loggersample] << endl;
        file.close();
    }

    if( loggersample < LOGGERMAXSIZE)
    {
        loggersample++;
    }
    else
    {
        loggersample = 0;
    }

}



void labfriend::setTrigSource(QString qsSource)
{
    if( !qsSource.compare("Trace 1") )
    {
        triggerSource = 0;
    }
    else if( !qsSource.compare("Trace 2") )
    {
        triggerSource = 1;
    }
    else if( !qsSource.compare("Trace 3") )
    {
        triggerSource = 2;
    }
    else if( !qsSource.compare("Trace 4") )
    {
        triggerSource = 3;
    }
    triggerValue = set_trigger_voltage(triggerSource, superplot.ui.dbsTriggerLevel->value()/1000);
}



void labfriend::setOffsetADC1(double offsetVoltage)
{
    double attenuator = 1;
    if (scopeVdiv[0] > 201e-3)
    {
        attenuator = 10;
    }
    scopeOffset[0] = offsetVoltage;
    setVoltage(HSADCOFFSET0, scopeOffset[0]/(attenuator*1000.0), ScopeOffsetGainError[0], ADCOffsetError[0]/1000.0);
}

void labfriend::setOffsetADC2(double offsetVoltage)
{
    double attenuator  = 1;
    if (scopeVdiv[1] > 201e-3)
    {
        attenuator = 10;
    }
    scopeOffset[1] = offsetVoltage;
    setVoltage(HSADCOFFSET1, scopeOffset[1]/(attenuator*1000.0), ScopeOffsetGainError[1], ADCOffsetError[1]/1000.0);
}

void labfriend::setOffsetTime(double offsetTime)
{

    scopeOffsetTime = offsetTime;
}

void labfriend::setEXvoltage(double tempvalue)
{
    EXvoltage = tempvalue;
}

void labfriend::setIOvoltage(double tempvalue)
{
    digitalIOvoltage = tempvalue;
}

void labfriend::setdIrefVoltage(double tempvalue)
{
    digitalIrefVoltage = tempvalue;
}

void labfriend::setdIoffsetVoltage(double tempvalue)
{
    digitalIoffsetVoltage = tempvalue;
}


void labfriend::IOvoltageButton( void )
{
    setVoltage( LAVIO , digitalIOvoltage, LAVIOOffsetGainError, LAVIOOffsetOffsetError);
}


void labfriend::DinVrefVoltageButton( void )
{
    setVoltage( LADVREF , digitalIrefVoltage, LAVIrefOffsetGainError, LAVIrefOffsetOffsetError);
}


void labfriend::DinOffsetVoltageButton( void )
{
    setVoltage( LAOFFSET , digitalIoffsetVoltage, LAVIoffsetGainError, LAVIoffsetOffsetError);
}

void labfriend::EXvoltageButton( void )
{
    setVoltage( EXVO , EXvoltage, EXVOOffsetGainError, EXVOOffsetOffsetError);
}


void labfriend::setTriggerValue(double dbTrigger)
{
    triggerValue = set_trigger_voltage(triggerSource, dbTrigger/1000);
}

void labfriend::setAudioGenerateFrequency1(double frequency)
{
    audioGenFrequency1 = frequency;
}

void labfriend::setAudioGenerateFrequency2(double frequency)
{
    audioGenFrequency2 = frequency;
}

void labfriend::setAudioGenerateAmplitude1(double amplitude)
{
    audioGenAmplitude1 = amplitude;
}

void labfriend::setAudioGenerateAmplitude2(double amplitude)
{
    audioGenAmplitude2 = amplitude;
}

void labfriend::setAudioGenerateType1(QString qsSource)
{
    audioGenerateType1 = qsSource;
}

void labfriend::setAudioGenerateType2(QString qsSource)
{
    audioGenerateType2 = qsSource;
}

void labfriend::setAudioAnalysis(QString qsSource)
{
    if( !qsSource.compare("Time") )
    {
        audioAnalysisType = audioAnalysisType_time;
    }
    else if( !qsSource.compare("Frequency") )
    {
        audioAnalysisType = audioAnalysisType_frequency;
    }

}



void labfriend::ManageCursor(QCustomPlot *customPlot, QCPCursor *cursor, double x, double y, QPen pen)
{
    if(cursorEnabled)
    {
        if(cursor->hLine) customPlot->removeItem(cursor->hLine);
        cursor->hLine = new QCPItemLine(customPlot);
       // customPlot->addItem(cursor->hLine);
        cursor->hLine->setPen(pen);
        cursor->hLine->start->setCoords(QCPRange::minRange, y);
        cursor->hLine->end->setCoords(QCPRange::maxRange, y);

        if(cursor->vLine) customPlot->removeItem(cursor->vLine);
        cursor->vLine = new QCPItemLine(customPlot);
        //customPlot->addItem(cursor->vLine);
        cursor->vLine->setPen(pen);
        cursor->vLine->start->setCoords( x, -QCPRange::maxRange);
        cursor->vLine->end->setCoords( x, QCPRange::maxRange);
    }
}

void labfriend::mouseRelease(QMouseEvent* event)
{
    static QCPCursor cursor1, cursor2;
    double x=superplot.ui.qcpScopeDisplay->xAxis->pixelToCoord(event->pos().x());
    double y=superplot.ui.qcpScopeDisplay->yAxis->pixelToCoord(event->pos().y());
    double cursorXdiff, cursorYdiff, frequ;
    if(event->button() == Qt::LeftButton)
    {
        ManageCursor(superplot.ui.qcpScopeDisplay, &cursor1, x, y, QPen(Qt::black));
        superplot.ui.lbXcursor1->setText(QString::number(x, 'e', 3) + QString("s") ) ;
        superplot.ui.lbYcursor1->setNum(y);
        xCursor1Point = x;
        yCursor1Point = y;
    }
    else if(event->button() == Qt::RightButton)
    {
        ManageCursor(superplot.ui.qcpScopeDisplay, &cursor2, x, y, QPen(Qt::gray));
        superplot.ui.lbXcursor2->setText(QString::number(x, 'e', 3) + QString("s") );
        superplot.ui.lbYcursor2->setNum(y);
        xCursor2Point = x;
        yCursor2Point = y;
    }
    else if(event->button() == Qt::MiddleButton)
    {
        if(zoomYaxis == true)
        {
            zoomYaxis = false;
            superplot.ui.qcpScopeDisplay->axisRect()->setRangeZoom(Qt::Vertical);
        }
        else
        {
            zoomYaxis = true;
            superplot.ui.qcpScopeDisplay->axisRect()->setRangeZoom(Qt::Horizontal);
        }

    }
    cursorXdiff = xCursor2Point - xCursor1Point;
    cursorYdiff = yCursor2Point - yCursor1Point;
    frequ = 1.0/cursorXdiff;
    superplot.ui.lbTimeDiff->setText(QString::number(cursorXdiff, 'e', 3) + QString("s") );
    superplot.ui.lbFrequency_2->setText(QString::number(frequ, 'e', 3) + QString("Hz") );
    superplot.ui.lbVoltageDiffCh1->setText(QString::number(cursorYdiff*scopeVdiv[0], 'e', 3) + QString("V") );
    superplot.ui.lbVoltageDiffCh2->setText(QString::number(cursorYdiff*scopeVdiv[1], 'e', 3) + QString("V") );
    superplot.ui.qcpScopeDisplay->replot();
    cursorEnabled=true;
}

void labfriend::mouseReleaseAudio(QMouseEvent* event)
{
    static QCPCursor cursor1, cursor2;
    double x=superplot.ui.qcpAudioDisplay->xAxis->pixelToCoord(event->pos().x());
    double y=superplot.ui.qcpAudioDisplay->yAxis->pixelToCoord(event->pos().y());
    double cursorXdiff, cursorYdiff, frequ;
    if(event->button() == Qt::LeftButton)
    {
        ManageCursor(superplot.ui.qcpAudioDisplay, &cursor1, x, y, QPen(Qt::black));
        superplot.ui.lbAudioCursorX1->setText(QString::number(x, 'e', 3) + QString("s") ) ;
        superplot.ui.lbAudioCursorY1->setNum(y);
        xCursor1Point = x;
        yCursor1Point = y;
    }
    else if(event->button() == Qt::RightButton)
    {
        ManageCursor(superplot.ui.qcpAudioDisplay, &cursor2, x, y, QPen(Qt::gray));
        superplot.ui.lbAudioCursorX2->setText(QString::number(x, 'e', 3) + QString("s") );
        superplot.ui.lbAudioCursorY2->setNum(y);
        xCursor2Point = x;
        yCursor2Point = y;
    }
    else if(event->button() == Qt::MiddleButton)
    {
        if(zoomYaxisAudio == true)
        {
            zoomYaxisAudio = false;
            superplot.ui.qcpAudioDisplay->axisRect()->setRangeZoom(Qt::Vertical);
        }
        else
        {
            zoomYaxisAudio   = true;
            superplot.ui.qcpAudioDisplay->axisRect()->setRangeZoom(Qt::Horizontal);
        }

    }
    cursorXdiff = xCursor2Point - xCursor1Point;
    cursorYdiff = yCursor2Point - yCursor1Point;
    frequ = 1.0/cursorXdiff;
    superplot.ui.lbAudioCursorDiffTime->setText(QString::number(cursorXdiff, 'e', 3) + QString("s") );
    superplot.ui.lbAudioCursorDiffFreq->setText(QString::number(frequ, 'e', 3) + QString("Hz") );
    superplot.ui.lbAudioCursorYDiffVoltage->setText(QString::number(cursorYdiff*scopeVdiv[0], 'e', 3) + QString("V") );
    superplot.ui.qcpAudioDisplay->replot();
    cursorEnabled=true;
}



void labfriend::setLoggerRate(double loggerSampleRate)
{
    dataLoggerRate = loggerSampleRate;
    dataLoggerTimerMax = round(dataLoggerRate/systemTimerRate);
    dataLoggerTimer = 0;
}

void labfriend::setDOrate(double doSampleRate)
{
    doUpdateRate = doSampleRate;
    doUpdateTimerMax = round(doUpdateRate/systemTimerRate);
    doUpdateTimer = 0;
}

void labfriend::setAudioRecTime(double time)
{
    audioRecTime = time;
}

void labfriend::setAudioRecRepeate(bool checked)
{
    audioRepeat = checked;
}


//AWG and DWG functions----------------------------

void labfriend::setDWGrate(int dwgrate)
{
    dwgSampleRate = dwgrate;
    double realSrate=1/((double)dwgrate*(1/MASATERCLKFREQ)+(1/MASATERCLKFREQ));
    superplot.ui.tlDWGrate->setNum(realSrate);
}

void labfriend::setAWGrate(int awgrate)
{
    awgSampleRate = awgrate;
    double realSrate=1/(((double)awgrate*(1/MASATERCLKFREQ)+(1/MASATERCLKFREQ))*8);
    superplot.ui.tlAWGrate->setNum(realSrate);
}

void labfriend::dwgRunButton( void )
{
    uint8_t config;
    if(dwgSingle) config=DWG_CONFIG_SINGLE; else config = DWG_CONFIG_LOOP;
    if(dosize == 0)
    {
        printf("NO DATA !!!!!\n");
        return;
    }
    run_dwg(config, dwgSampleRate, dosize, dobit07 );
}

void labfriend::awgRunButton( void )
{
    uint8_t config;
    if(awgSingle) config=DWG_CONFIG_SINGLE; else config = DWG_CONFIG_LOOP;
    if(aosize == 0)
    {
        printf("NO DATA !!!!!\n");
        return;
    }
    run_awg(config, awgSampleRate, aosize, aovalue );
}

void labfriend::awgLoopFun( bool lopstat)
{
    awgSingle = !lopstat;
    printf("toggled ? %x %x\n", awgSingle, lopstat);
}

void labfriend::dwgLoopFun(bool lopstat)
{
    dwgSingle = !lopstat;
    printf("toggled ? %x %x\n", dwgSingle, lopstat);
}


void labfriend::scopeConnections(void)
{

    scope_controls_connect();
    audio_connect();
    //datalogger an dc measurement
    QObject::connect( superplot.ui.cmbGAINCH1, SIGNAL( currentIndexChanged(QString)), this, SLOT(setLoggerGain1(QString)));
    QObject::connect( superplot.ui.cmbGAINCH2, SIGNAL( currentIndexChanged(QString)), this, SLOT(setLoggerGain2(QString)));
    QObject::connect( superplot.ui.cmbGAINCH3, SIGNAL( currentIndexChanged(QString)), this, SLOT(setLoggerGain3(QString)));
    QObject::connect( this, SIGNAL(replotTriggerDataNow()), &superplot, SLOT(replotLoggerData()));
    QObject::connect( superplot.ui.cbContinous , SIGNAL(toggled(bool)), this, SLOT( dataLoggerChekerbox(bool) ) );
    QObject::connect( superplot.ui.pbMeasure , SIGNAL( clicked() ), this, SLOT(getLoggerData()));
    QObject::connect( superplot.ui.dbsSampleRate , SIGNAL( valueChanged(double) ), this, SLOT(setLoggerRate(double)));

    //Connections of DC control values used by PWM system in FPGA---------------------------------------------------------------
    QObject::connect( superplot.ui.dbsExDC , SIGNAL( valueChanged(double) ), this, SLOT(setEXvoltage(double)));
    QObject::connect( superplot.ui.dbsDIOVoltage , SIGNAL( valueChanged(double) ), this, SLOT(setIOvoltage(double)));
    QObject::connect( superplot.ui.dbsExDiginRef , SIGNAL( valueChanged(double) ), this, SLOT(setdIrefVoltage(double)));
    QObject::connect( superplot.ui.dbsExDiginOffset , SIGNAL( valueChanged(double) ), this, SLOT(setdIoffsetVoltage(double)));
    QObject::connect( superplot.ui.pbExDcV , SIGNAL( clicked() ), this, SLOT(EXvoltageButton()));
    QObject::connect( superplot.ui.pbDIOvoltage , SIGNAL( clicked() ), this, SLOT(IOvoltageButton()));
    QObject::connect( superplot.ui.pbExDCDref , SIGNAL( clicked() ), this, SLOT(DinVrefVoltageButton()));
    QObject::connect( superplot.ui.pbExDCDoffset , SIGNAL( clicked() ), this, SLOT(DinOffsetVoltageButton()));
    //------------------------------------------------------------------------------------------------------------------------
    QObject::connect( superplot.ui.cbLoggerToFile , SIGNAL(toggled(bool)), this, SLOT( dataLoggerFileChekerbox(bool) ) );

    QObject::connect( superplot.ui.cbDOloopfile , SIGNAL(toggled(bool)), this, SLOT( setFileLoop(bool)));


    QObject::connect( superplot.ui.qcpScopeDisplay, SIGNAL(mouseRelease(QMouseEvent*)), this, SLOT(mouseRelease(QMouseEvent*)));

    QObject::connect( superplot.ui.cmbBufferSize, SIGNAL( currentIndexChanged(QString)), this, SLOT(scopeBufferSizeF(QString)));

    //Connections for AWG and DWG
    QObject::connect( superplot.ui.sbDOrate , SIGNAL( valueChanged(int) ), this, SLOT(setDWGrate(int)));
    QObject::connect( superplot.ui.sbAOrate , SIGNAL( valueChanged(int) ), this, SLOT(setAWGrate(int)));
    QObject::connect( superplot.ui.pbDOrun , SIGNAL( clicked() ), this, SLOT(dwgRunButton() ));
    QObject::connect( superplot.ui.pbAOrun , SIGNAL( clicked() ), this, SLOT(awgRunButton()) );
    QObject::connect( superplot.ui.cbDOloopfile , SIGNAL( toggled(bool) ), this, SLOT(dwgLoopFun(bool)) );
    QObject::connect( superplot.ui.cbAOloopFile, SIGNAL( toggled(bool) ), this, SLOT(awgLoopFun(bool)) );
    QObject::connect( superplot.ui.action_Open_Digital_Out, SIGNAL(triggered()), this, SLOT(open_DO_file()));
    QObject::connect( superplot.ui.actionOpenAnalogOutput, SIGNAL(triggered()), this, SLOT(open_AO_file()));
}

void labfriend::initScopeRun(void)
{
    trace_1_raw = new uint8_t[nrOfRamAddresses];
    trace_2_raw = new uint8_t[nrOfRamAddresses];
    trace_3_raw = new uint8_t[nrOfRamAddresses];
    trace_4_raw = new uint8_t[nrOfRamAddresses];
    trace_1_data.reserve(nrOfRamAddresses);
    trace_2_data.reserve(nrOfRamAddresses);
    digitalBit0data.reserve(nrOfRamAddresses);
    digitalBit1data.reserve(nrOfRamAddresses);
    digitalBit2data.reserve(nrOfRamAddresses);
    digitalBit3data.reserve(nrOfRamAddresses);
    digitalBit4data.reserve(nrOfRamAddresses);
    digitalBit5data.reserve(nrOfRamAddresses);
    digitalBit6data.reserve(nrOfRamAddresses);
    digitalBit7data.reserve(nrOfRamAddresses);
    scopeXaxis.reserve(nrOfRamAddresses);
    loggerChannel1.reserve(LOGGERMAXSIZE);
    loggerChannel2.reserve(LOGGERMAXSIZE);
    loggerChannel3.reserve(LOGGERMAXSIZE);
    loggerExvo.reserve(LOGGERMAXSIZE);
    loggerTemp.reserve(LOGGERMAXSIZE);
    Logxaxis.reserve(LOGGERMAXSIZE);
    dobit07 = new uint8_t[MAXDOFILESIZE];
    aovalue = new uint8_t[MAXDOFILESIZE];

    aosize = 0;
    dosize = 0;

    loggersample = 0;
    //Set Master Timer for the system
    systemTimerRate = 0.020;
    //Initialize Scope update
    scopeUpdateRate = 0.12;
    scopeUpdateTimerMax = round(scopeUpdateRate/systemTimerRate);
    scopeUpdateTimer = 0;


    doUpdateRate = 0.5;
    doUpdateTimerMax = round(doUpdateRate/systemTimerRate);
    doUpdateTimer = 0;
    doEnabled = true;

    firstScopeCapture = false;

    superplot.timerA->setInterval(systemTimerRate*1000);

    scope_controls_init();

    superplot.ui.dbsSampleRate->setSuffix("s");
    superplot.ui.dbsSampleRate->setRange(0.3, 60);
    superplot.ui.dbsSampleRate->setDecimals(2);
    superplot.ui.dbsSampleRate->setValue(1.0);
    superplot.ui.lcdCh1->setMode(QLCDNumber::Dec);
    superplot.ui.lcdCh2->setMode(QLCDNumber::Dec);
    superplot.ui.cbContinous->setCheckState(Qt::Checked);
    superplot.ui.cbContinous->setCheckState(Qt::Checked);
    superplot.ui.cbContinous->setCheckState(Qt::Unchecked);
    superplot.ui.cbContinous->setCheckState(Qt::Unchecked);

    superplot.ui.dbsDIOVoltage->setDecimals(2);
    superplot.ui.dbsExDC->setDecimals(2);
    superplot.ui.dbsDIOVoltage->setRange(0.9, 5.0);
    superplot.ui.dbsExDC->setRange(0.0, 5.0);
    superplot.ui.dbsDIOVoltage->setValue(1.8);
    superplot.ui.dbsExDC->setValue(1.0);





    superplot.ui.cbLoggerToFile->setCheckState(Qt::Checked);
    superplot.ui.cbLoggerToFile->setCheckState(Qt::Unchecked);
    digitalOutputByte = 0x00;
    digitalOutputByte_last = 0xff;
    dobyteCounter = 0;
    doFileEnable = false;
    doLoopFile = false;


    superplot.ui.qcpScopeDisplay->axisRect()->setRangeZoom(Qt::Horizontal);

    zoomYaxis = false;

    scopeBufferSize = scopeBufferSizeV/3;

    superplot.ui.sbAOrate->setValue(0);
    superplot.ui.sbDOrate->setValue(0);
    superplot.ui.cbAOloopFile->setCheckState(Qt::Checked);
    superplot.ui.cbDOloopfile->setCheckState(Qt::Checked);

    loggerGainCH1 = LOGGERGAIN1;
    loggerGainCH2 = LOGGERGAIN1;
    loggerGainCH3 = LOGGERGAIN1;

    audio_init();

}


int main(int argc, char *argv[])
{

    int appreturn;
	QApplication app(argc, argv);
	labfriend a;
    float * DACsamleft;
    float * DACsamrigth;
    uint8_t databuffer[3];

    //--------OpenSPI----------
    spiOpen();
    //-------------------------

    spiCommand( READ, 0x02, 3);
    spiRead(databuffer, 3);
    printf("databuffer %x %x %x \n", databuffer[0], databuffer[1], databuffer[2]);


    set_probe_attenuation(0, 1.0);
    set_probe_attenuation(1, 1.0);

    a.setInitialCalibration();


    a.dataLoggerEnabled = true;
    a.scopeEnabled = true;
    a.audioEnabled = false;

    DACsamleft = (float *) malloc( 4096 * sizeof(float) );
    if (DACsamleft==NULL) exit (1);
    DACsamrigth = (float *) malloc( 4096 * sizeof(float) );
    if (DACsamrigth==NULL) exit (1);

	
    //Set up Timer for plot updates
    a.superplot.attachCurves();
    a.superplot.InitOPtions();


    a.scopeConnections();
    a.initScopeRun();

    a.superplot.timerA->start();


    a.superplot.show();
	
	//close_port(a.fd);

    appreturn = app.exec();

    delete a.trace_1_raw;
    delete a.trace_2_raw;
    delete a.trace_3_raw;
    delete a.trace_4_raw;

    //--------Close SPI----------------
    spiClose();
    //---------------------------------
    return appreturn;
}
