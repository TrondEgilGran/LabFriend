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

void labfriend::byte2FloatingBits(uint8_t *inputByte)
{
    uint32_t i;
    const double stepSize = 0.15625;
    const double channelOffset = 0.062500;

    digitalBit0data.resize(scopeBufferSize);
    digitalBit1data.resize(scopeBufferSize);
    digitalBit2data.resize(scopeBufferSize);
    digitalBit3data.resize(scopeBufferSize);
    digitalBit4data.resize(scopeBufferSize);
    digitalBit5data.resize(scopeBufferSize);
    digitalBit6data.resize(scopeBufferSize);
    digitalBit7data.resize(scopeBufferSize);

    for(i=0; i < 8; i++)
    {
        digitalBit0data[i] = 0;
        digitalBit1data[i] = 0;
        digitalBit2data[i] = 0;
        digitalBit3data[i] = 0;
        digitalBit4data[i] = 0;
        digitalBit5data[i] = 0;
        digitalBit6data[i] = 0;
        digitalBit7data[i] = 0;
    }
    for(i=8; i < scopeBufferSize; i++)
    {
        digitalBit0data[i] = (float(inputByte[i-8] & 0x01) * stepSize);
        digitalBit1data[i] = (float((inputByte[i-8] >> 1) & 0x01) * stepSize) + (channelOffset+stepSize)*1;
        digitalBit2data[i] = (float((inputByte[i-8] >> 2) & 0x01) * stepSize) + (channelOffset+stepSize)*2;
        digitalBit3data[i] = (float((inputByte[i-8] >> 3) & 0x01) * stepSize) + (channelOffset+stepSize)*3;
        digitalBit4data[i] = (float((inputByte[i-8] >> 4) & 0x01) * stepSize) + (channelOffset+stepSize)*4;
        digitalBit5data[i] = (float((inputByte[i-8] >> 5) & 0x01) * stepSize) + (channelOffset+stepSize)*5;
        digitalBit6data[i] = (float((inputByte[i-8] >> 6) & 0x01) * stepSize) + (channelOffset+stepSize)*6;
        digitalBit7data[i] = (float((inputByte[i-8] >> 7) & 0x01) * stepSize) + (channelOffset+stepSize)*7;
    }
}

void labfriend::scope_run_main(void)
{
    uint32_t i;
    double xmax, xmin;

    if(firstScopeCapture == true)
    {
        if(scope_data_available())
        {
            //scope_read_trigger();
            struct timeval begin, end;
            double elapsedTime;
            int trigger_point;
            gettimeofday(&begin, NULL);

            trigger_point = scope_read_trigger(scopeBufferSize);
            uint32_t trigg_error = scopeOffsetValue-trigger_point;
            read_ram( trace_3_raw, trace_2_raw, trace_1_raw, scopeBufferSizeV ,3 );

            gettimeofday(&end, NULL);
                elapsedTime = (end.tv_sec - begin.tv_sec) * 1000.0;      // sec to ms
                elapsedTime += (end.tv_usec - begin.tv_usec) / 1000.0;
                printf("ReadRam TIme %f \n", elapsedTime);

                trace_1_data.resize(scopeBufferSize);
                trace_2_data.resize(scopeBufferSize);
                scopeXaxis.resize(scopeBufferSize);

            gettimeofday(&begin, NULL);


            byte2FloatingBits(trace_1_raw);

            for(i=26; i < scopeBufferSize; i++ )
            {
                  scopeXaxis[i] = i/scopeSampleRate;
                  trace_1_data[i] = ADCGainError[0]*((double)trace_3_raw[i-trigg_error]/32.0 - 4) +4;
                  trace_2_data[i] = ADCGainError[1]*((double)trace_2_raw[i-trigg_error]/32.0 - 4) +4;
            }

            gettimeofday(&end, NULL);
                elapsedTime = (end.tv_sec - begin.tv_sec) * 1000.0;      // sec to ms
                elapsedTime += (end.tv_usec - begin.tv_usec) / 1000.0;
                printf("copy time %f size  \n", elapsedTime);

                gettimeofday(&begin, NULL);

                superplot.ui.qcpScopeDisplay->graph( superplot.curve1 )->setData(scopeXaxis, trace_1_data);
                superplot.ui.qcpScopeDisplay->graph( superplot.curve2 )->setData(scopeXaxis, trace_2_data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD0)->setData(scopeXaxis, digitalBit0data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD1)->setData(scopeXaxis, digitalBit1data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD2)->setData(scopeXaxis, digitalBit2data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD3)->setData(scopeXaxis, digitalBit3data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD4)->setData(scopeXaxis, digitalBit4data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD5)->setData(scopeXaxis, digitalBit5data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD6)->setData(scopeXaxis, digitalBit6data);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD7)->setData(scopeXaxis, digitalBit7data);

                superplot.ui.qcpScopeDisplay->graph( superplot.curve2 )->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph( superplot.curve1 )->setVisible(true);


                superplot.ui.qcpScopeDisplay->graph(superplot.curveD0)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD1)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD2)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD3)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD4)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD5)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD6)->setVisible(true);
                superplot.ui.qcpScopeDisplay->graph(superplot.curveD7)->setVisible(true);


                gettimeofday(&end, NULL);
                    elapsedTime = (end.tv_sec - begin.tv_sec) * 1000.0;      // sec to ms
                    elapsedTime += (end.tv_usec - begin.tv_usec) / 1000.0;
                    printf("Setup plot time %f \n", elapsedTime);



            if (triggerType == trigger_automatic)
            {
                xmax = (double)24/scopeSampleRate+8*scopeActualDiv;
                xmin = (double)24/scopeSampleRate+scopeActualDiv;
            }
            else
            {
                xmax = (double)(scopeBufferSize - scopeOffsetValue)/scopeSampleRate+4*scopeActualDiv;
                xmin = (double)(scopeBufferSize - scopeOffsetValue)/scopeSampleRate-4*scopeActualDiv;
            }
            printf("Xmin %f, Xmax %f ScopeDiv %f, scopeOffsetValue %d \n",xmin, xmax, scopeActualDiv, scopeOffsetValue );
            printf("offsettrigg %d \n",scopeOffsetValue-trigger_point );
           // emit replotdatanow(0.0 ,xmax, 0.0, 255.0, scopeActualDiv, 32.0 );

            gettimeofday(&begin, NULL);

            static QCPCursor cursor3;

            ManageCursor(superplot.ui.qcpScopeDisplay, &cursor3,scopeOffsetValue/scopeSampleRate , 4, QPen(Qt::yellow));

            superplot.replotNewData(xmin ,xmax, 0.0, 8 );
            gettimeofday(&end, NULL);
                elapsedTime = (end.tv_sec - begin.tv_sec) * 1000.0;      // sec to ms
                elapsedTime += (end.tv_usec - begin.tv_usec) / 1000.0;
                printf("replot time %f \n", elapsedTime);
            printf("data replotted\n");


            if( scopeSingle == false)
            {
               scopeStart();
            }
            else
            {
                firstScopeCapture = false;
            }
        }

    }
}

void labfriend::scopeStart(void)
{

    uint32_t offsetval;
    uint16_t srdiv;
    scopeOffsetValue = round( (scopeBufferSize >> 1) + (scopeSampleRate)*(scopeOffsetTime/scopeTimeOffsetFormat));
    srdiv = MASATERCLKFREQ*4  / scopeSampleRate - 1;
    printf("ov, %d, srate %f, buffs %d, offsT %f, fmt %f \n", scopeOffsetValue, scopeSampleRate, scopeBufferSize, scopeOffsetTime, scopeTimeOffsetFormat );
    printf("sample rate div %d", srdiv);
    /*  set_scope_config(	triggerValue,  //trigger_value
                triggerSource | srateDiv,  //trigger_source
                triggerType,  //trigger_edge
                7,  //ram0_sel
                ram_digital_muxed,  //ram_digi_muxed
                powerup_adc,  //adc_powerdown
                adc_clock_normal | srateMult,  //adc_clock
                scopeOffsetValue, //trigger_ram_offset
                true); //start_capture*/


    if (triggerType == trigger_automatic)
    {
        offsetval =   scopeBufferSizeV/72 - 2;
        scopeOffsetValue = scopeBufferSize - 2;
    }

   offsetval =     scopeOffsetValue/24;


    set_scope_config( triggerValue,
                  triggerSource,
                  triggerType,
                  7,  //channel
                  0,
                  4, //freq 4 200MHZ 2 100MHZ 0 50 MHZ
                  3 , //3 to invert
                  offsetval,
                  1,
                  scopeBufferSizeV,
                  srdiv);

    firstScopeCapture = true;
    printf("ramsel0 -ramsel3, %x %x %x %x\n", trace1source, trace2source, trace3source, trace4source);
    printf("trigger type, source, value: %x %x %d\n", triggerType, triggerSource, triggerValue);
    printf("scopeOffsetValue %d \n", offsetval);

}
