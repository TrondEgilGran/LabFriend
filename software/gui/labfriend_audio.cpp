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
#include <mls.h>
extern "C"
{
    #include <audio_codec.h>
    #include <scope_control.h>
    #include <dcio.h>
    #include <board.h>
    #include <spicomm.h>
    #include <sys/time.h>
    #include <time.h>
    #include <unistd.h>
}

void labfriend::get_audio_data()
{
    double * dataset1;
    double * dataset2;
    int i;
    int fifolevel;

    struct timeval begin, end;

    double elapsedTime;

    int32_t groupdelay;


    dataset1 = (double *) malloc(FifoBufferSize*sizeof(double));
    if (dataset1==NULL) exit (1);
    dataset2 = (double *) malloc(FifoBufferSize*sizeof(double));
    if (dataset2==NULL) exit (1);




    if(audioRecFinished == true)
    {
        audioSamplerate = getSampleRate( audioConfig );
        nrAudioSamples = audioRecTime*audioSamplerate + I2SGROUPDELAY;

        AudioAxis.clear();
        audioData1.clear();
        audioData2.clear();

        AudioAxis.resize(nrAudioSamples);
        audioData1.resize(nrAudioSamples);
        audioData2.resize(nrAudioSamples);

        audioRemainingSamples = nrAudioSamples;
        audio_buffer_position = 0;
        audioRecFinished = false;
        //printf ("nrOf Audio %d  adioRecTime %f samplerate %f\n", nrAudioSamples, audioRecTime, samplerate);
        //Flush audio buffer
        setI2sync(1); //zeero output
        usleep(150000);
        setI2sync(0);
        usleep(2000); //make sure buffer is filled up to beyond the groupddelay on first run
    }



    fifolevel = getADCdata( dataset1, dataset2, 1, 0, 1, 0);
    audioRemainingSamples = audioRemainingSamples - fifolevel;



    if(audio_buffer_position == 0)
    {
        groupdelay = I2SGROUPDELAY;

    }
    else
    {
        groupdelay = 0;
    }

    for(i=0; i < (fifolevel-groupdelay); i++)
    {
        if( (i+ audio_buffer_position) < nrAudioSamples )
        {
            AudioAxis[i+audio_buffer_position] = ((double)i+(double)audio_buffer_position)/audioSamplerate;
            audioData1[i+audio_buffer_position] = dataset1[i+groupdelay];
            audioData2[i+audio_buffer_position] = dataset2[i+groupdelay];
        }
        else break;

    }

    if( audioRemainingSamples < 1 )
    {
        if( audioAnalysisType == audioAnalysisType_time)
        {
            audio_set_axis(0, -1, 1, -1, 1);
            audio_plot(AudioAxis,audioData1, audioData2, audioTrace0 | audioTrace1, axistypeLin, nrAudioSamples );
        }
        else if( audioAnalysisType == audioAnalysisType_frequency)
        {
            fftsize = audio_find_fft_size(nrAudioSamples);
            printf("ffts %d, nrau %d\n", fftsize, nrAudioSamples);
            audioDataFFTamplitude.resize(fftsize/2);
            audioDataFFTphase.resize(fftsize/2);
            AudioAxis.resize(fftsize/2);
            if(audioFFT_channel == 1)
            {
                fft_analysis(audioData1,audioDataFFTamplitude,audioDataFFTphase,AudioAxis,fftsize);
            }
            else if(audioFFT_channel == 2)
            {
               fft_analysis(audioData2,audioDataFFTamplitude,audioDataFFTphase,AudioAxis,fftsize);
            }
            audio_set_axis(audioSampleRate/fftsize, -155, 0, -180, 180);
            audio_plot(AudioAxis,audioDataFFTamplitude, audioDataFFTphase, audioTrace0 | audioTrace2, axistypeLog, fftsize/2 );
        }
        else if( audioAnalysisType == audioAnalysisType_mls)
        {
            audioDataMLS.resize(4096);
            AudioAxis.resize(4096);
            if(audioFFT_channel == 1)
            {
                mls_analysis(audioData1, audioDataMLS, 12);
            }
            else if(audioFFT_channel == 2)
            {
                mls_analysis(audioData2, audioDataMLS, 12);
            }
            audio_set_axis(0, -1, 1, -1, 1);
            audio_plot(AudioAxis,audioDataMLS, audioDataMLS, audioTrace0, axistypeLin, 4096 );
        }


        audioRecFinished = true;
      //  printf("audio Remaingin %d  %d %f\n", audioRemainingSamples, audio_buffer_position, AudioAxis[nrAudioSamples-1]);
      //  printf("i %d, nr-1 %d %f\n",(i+audio_buffer_position), nrAudioSamples-1, audioSamplerate);

    }
    else
    {
        audio_buffer_position = audio_buffer_position + (fifolevel-groupdelay);

    }
}

uint32_t labfriend::audio_find_fft_size(uint32_t input)
{
    uint32_t i;

    i=0;

    while(input >>= 1)
    {
        i++;
    }

    return exp2(i);
}

void labfriend::audio_generate(void)
{
    double currentSamplerate;
    double divisionratio;
    mls_measure mls_af;
    const int32_t N = 12;
    const int32_t P = (1 << N) - 1;
    bool *mls = new bool[P];
    double *signal = new double[P+1];
    int i, repeat;

    if( (GenerateAudioEnable == true) and (GenerateAudioLast == false) )
    {
        currentSamplerate = getSampleRate(audioConfig);
        divisionratio = round((FifoBufferSize*audioGenFrequency1)/currentSamplerate);
        actualGeneratedFrequency1 = divisionratio*currentSamplerate/FifoBufferSize;
        divisionratio = round((FifoBufferSize*audioGenFrequency2)/currentSamplerate);
        actualGeneratedFrequency2 = divisionratio*currentSamplerate/FifoBufferSize;

        enableAudioDAC = EnableDAC;
        audioConfig = audioConfig | enableAudioDAC;
        setI2Sconfig(audioConfig);

        if( !audioGenerateType1.compare("Sinus"))
        {
            sineGenerator(audioLeftBuffer, actualGeneratedFrequency1, audioGenAmplitude1, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType1.compare("Square"))
        {
            squareGenerator(audioLeftBuffer, actualGeneratedFrequency1, audioGenAmplitude1, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType1.compare("Dirac"))
        {
            diracGenerator(audioLeftBuffer, actualGeneratedFrequency1, audioGenAmplitude1, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType1.compare("MLS"))
        {
            mls_af.GenerateMls(mls, P, N);
            mls_af.GenerateSignal(mls, signal, P, audioGenAmplitude1);
            for(i=0; i < (P+1); i++) audioLeftBuffer[i] = signal[i];
            //for(i=0; i < (P+1); i++) audioLeftBuffer[i+P+1] = signal[i];

        }

        if( !audioGenerateType2.compare("Sinus"))
        {
            sineGenerator(audioRigthBuffer, actualGeneratedFrequency2, audioGenAmplitude2, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType2.compare("Square"))
        {
            squareGenerator(audioRigthBuffer, actualGeneratedFrequency2, audioGenAmplitude2, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType2.compare("Dirac"))
        {
            diracGenerator(audioRigthBuffer, actualGeneratedFrequency2, audioGenAmplitude2, currentSamplerate, FifoBufferSize);
        }
        else if ( !audioGenerateType1.compare("MLS"))
        {
            mls_af.GenerateMls(mls, P, N);
            mls_af.GenerateSignal(mls, signal, P, audioGenAmplitude2);
            for(i=0; i < (P+1); i++) audioRigthBuffer[i] = signal[i];
        }

        setDACdata(audioLeftBuffer , audioRigthBuffer, 1, 0, 1, 0, FULL);
        startAudioGenerate = false;
        printf("freq1 %f, freq2: %f, divrat: %f  srate: %f \n",actualGeneratedFrequency1, actualGeneratedFrequency2, divisionratio, currentSamplerate );
    }
    else if( (GenerateAudioEnable == false) and (GenerateAudioLast == true) )
    {
        enableAudioDAC = 0;
        audioConfig = audioInputConfig | audioSampleRateConfig | enableAudioADC | enableAudioDAC;
        setI2Sconfig(audioConfig);
    }

     GenerateAudioLast = GenerateAudioEnable;


     delete []mls;
     delete []signal;
}

void labfriend::fft_analysis(QVector<double> &indata, QVector<double> &out_amplitude, QVector<double> &out_phase, QVector<double> &axis, int32_t fftsize)
{
    int i;

    ffft::FFTReal <double> fft_object (fftsize);
    double real, imag;
    double *fftinput = new double[fftsize];
    double *fftputput = new double[fftsize];

    double multiplier;
    for(i=0; i < fftsize; i++) // add window do data before FFT
    {
        multiplier = 0.5*(1-cos(2*M_PI*i/fftsize));
        fftinput[i] = multiplier * indata[i];
    }

    fft_object.do_fft(fftputput, fftinput);
    fft_object.do_ifft(fftputput, fftinput);

    for(i=0; i < fftsize/2; i++)
    {
        real = fftputput[i];
        imag = fftputput[i+fftsize/2];
        out_amplitude[i] = 20*log10(sqrt(pow(real, 2) + pow(imag,2))/((float)fftsize/2));
        if(abs(real) < 0.5e-6 )  real=0; //avoid calculating phase for noise
        if(abs(imag) < 0.5e-6 )  imag=0;
        out_phase[i] = atan2(real, imag) * 180/M_PI;
        axis[i] = i*((audioSamplerate/2)/(fftsize/2));
    }

    delete []fftinput;
    delete []fftputput;
}

void labfriend::mls_analysis(QVector<double> &indata, QVector<double> &outdata, int32_t order)
{
    mls_measure mls_au;
    int32_t N = order;
    int32_t P = (1 << N) - 1;
    bool *mls = new bool[P];
    int32_t *tagL = new int32_t[P];
    int32_t *tagS = new int32_t[P];
    double *perm = new double[P + 1];
    double *resp = new double[P + 1];

    mls_au.GenerateMls(mls, P, N); // Generate the Maximum length sequence
    mls_au.GeneratetagL(mls, tagL, P, N); // Generate tagL for the L matrix
    mls_au.GeneratetagS(mls, tagS, P, N);
    mls_au.PermuteSignal(indata.data(), perm, tagS, P);
    mls_au.FastHadamard(perm,P+1,N);
    mls_au.PermuteResponse(perm,resp,tagL,P);
    mls_au.RotateResponse(resp,outdata.data(),P);

    delete []mls;
    delete []tagL;
    delete []tagS;
    delete []perm;
    delete []resp;
}

void labfriend::audio_plot(QVector<double> &axis, QVector<double> &trace0, QVector<double> &trace1, uint8_t visible_trace, int axistype, uint32_t datasize)
{
    superplot.ui.qcpAudioDisplay->graph(0)->setVisible(0);
    superplot.ui.qcpAudioDisplay->graph(1)->setVisible(0);
    superplot.ui.qcpAudioDisplay->graph(2)->setVisible(0);
    superplot.ui.qcpAudioDisplay->yAxis2->setVisible(0);

    if( visible_trace & audioTrace0 )
    {
        superplot.ui.qcpAudioDisplay->graph(0)->setData(axis,trace0);
        superplot.ui.qcpAudioDisplay->graph(0)->setVisible(1);
    }
    if( visible_trace & audioTrace1 )
    {
        superplot.ui.qcpAudioDisplay->graph(1)->setData(axis,trace1);
        superplot.ui.qcpAudioDisplay->graph(1)->setVisible(1);
    }
    if( visible_trace & audioTrace2 ) //Use this for alternate Y axis
    {
        superplot.ui.qcpAudioDisplay->graph(2)->setData(axis,trace1);
        superplot.ui.qcpAudioDisplay->graph(2)->setVisible(1);
        superplot.ui.qcpAudioDisplay->yAxis2->setVisible(1);
    }

    if(axistype == axistypeLin)
    {
        superplot.ui.qcpAudioDisplay->xAxis->setScaleType(QCPAxis::stLinear);
        QSharedPointer<QCPAxisTicker> linTicker(new QCPAxisTicker);
        superplot.ui.qcpAudioDisplay->xAxis->setTicker(linTicker);

    }
    else
    {
        superplot.ui.qcpAudioDisplay->xAxis->setScaleType(QCPAxis::stLogarithmic);
        QSharedPointer<QCPAxisTickerLog> logTicker(new QCPAxisTickerLog);
        logTicker->setLogBase(10);
        superplot.ui.qcpAudioDisplay->xAxis->setTicker(logTicker);
    }

    superplot.replotAudioData( audioXaxisStart, axis[datasize-1], audioYaxisMin, audioYaxisMax, audioYaxis2min, audioYaxis2Max);
}

void labfriend::audioToggleReact()
{
    audioFFTAVGcounter = 0;
    audio_single_trig = 1;
    audioFFTmode = false;

}

void labfriend::audio_set_axis(double xstart, double ymin, double ymax, double y2min, double y2max)
{
    audioXaxisStart = xstart;
    audioYaxisMin = ymin;
    audioYaxisMax = ymax;
    audioYaxis2min = y2min;
    audioYaxis2Max = y2max;
}

void labfriend::setAudioConfig(QString qsSource)
{
    if( !qsSource.compare("NORMAL") )
    {
        audioInputConfig = audioATT1;
    }
    else if( !qsSource.compare("1/10") )
    {
        audioInputConfig = audioATT10;
    }
    else if( !qsSource.compare("VREF")  )
    {
        audioInputConfig = audioRef;
    }
    else if( !qsSource.compare("GND")  )
    {
        audioInputConfig = audioGnd;
    }

    audioConfig = audioInputConfig | audioSampleRateConfig | enableAudioADC | enableAudioDAC;
    setI2Sconfig(audioConfig);

}

void labfriend::setAudioFFTchannel(QString qsSource)
{
    if( !qsSource.compare("1") )
    {
        audioFFT_channel = 1;
    }
    else if( !qsSource.compare("2") )
    {
        audioFFT_channel = 2;
    }

}

void labfriend::setAudioSampleRate(QString qsSource)
{
    float multiplyer;
    if( !qsSource.compare("16k") )
    {
        audioSampleRateConfig = SampleRate16k;
        multiplyer = 3000;
    }
    else if( !qsSource.compare("19k") )
    {
        audioSampleRateConfig = SampleRate19k;
        multiplyer = 2500;
    }
    else if( !qsSource.compare("24k")  )
    {
        audioSampleRateConfig = SampleRate24k;
        multiplyer = 2000;
    }
    else if( !qsSource.compare("32k")  )
    {
        audioSampleRateConfig = SampleRate32k;
        multiplyer = 1500;
    }
    else if( !qsSource.compare("48k")  )
    {
        audioSampleRateConfig = SampleRate48k;
        multiplyer = 1000;
    }
    else if( !qsSource.compare("96k")  )
    {
        audioSampleRateConfig = SampleRate96k;
        multiplyer = 1;
    }
    audioConfig = audioInputConfig | audioSampleRateConfig | enableAudioADC | enableAudioDAC;
    setI2Sconfig(audioConfig);
    audioSampleRate = getSampleRate(audioConfig);
    audioUpdateTimerMax = round(multiplyer*(1/audioSampleRate)/systemTimerRate);
    printf("atum: %d %f mp %f \n", audioUpdateTimerMax, systemTimerRate, multiplyer );

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
    else if( !qsSource.compare("MLS") )
    {
        audioAnalysisType = audioAnalysisType_mls;
    }

}

void labfriend::audioSetMicPower(void)
{
    uint8_t config;
    uint8_t data[4];
    setVoltage( LAVIO , 5.0, LAVIOOffsetGainError, LAVIOOffsetOffsetError);
    setVoltage( EXVO , 5.0, EXVOOffsetGainError, EXVOOffsetOffsetError);
    config = DWG_CONFIG_LOOP;
    data[0] = 0x55;
    data[1] = 0xAA;
    data[2] = 0x55;
    data[3] = 0xAA;
    run_dwg(config, 30, 4, data );
    data[0] = (uint8_t)round(2.5*RFDACMAX/RFDACREF);
    data[1] = (uint8_t)round(2.5*RFDACMAX/RFDACREF);
    data[2] = (uint8_t)round(2.5*RFDACMAX/RFDACREF);
    data[3] = (uint8_t)round(2.5*RFDACMAX/RFDACREF);
    run_awg(config, 30, 4, data );
    printf("mic should have power now\n");
}

void labfriend::audioFFTCW(void)
{
    if(audioFFTmode == false)
    {
        audioFFTmode = true;

        if(audioAnalysisType == audioAnalysisType_mls)
        {
            fftsize = 4096;
        }
        else
        {
            fftsize = audio_find_fft_size(nrAudioSamples);
        }
        audioDataFFTamplitude.resize(fftsize/2);
        audioDataFFTphase.resize(fftsize/2);
        AudioAxisFFT.resize(fftsize/2);

        if(audioAnalysisType == audioAnalysisType_mls)
        {
            fft_analysis(audioDataMLS,audioDataFFTamplitude,audioDataFFTphase,AudioAxisFFT,fftsize);
        }
        else if((audioFFT_channel == 1) && audioAnalysisType == audioAnalysisType_time )
        {
            fft_analysis(audioData1,audioDataFFTamplitude,audioDataFFTphase,AudioAxisFFT,fftsize);
        }
        else if((audioFFT_channel == 2) && audioAnalysisType == audioAnalysisType_time )
        {
           fft_analysis(audioData2,audioDataFFTamplitude,audioDataFFTphase,AudioAxisFFT,fftsize);
        }
        audio_set_axis(audioSampleRate/fftsize, -155, 0, -180, 180);
        audio_plot(AudioAxisFFT,audioDataFFTamplitude, audioDataFFTphase, audioTrace0 | audioTrace2, axistypeLog, fftsize/2 );
    }
    else
    {
        audioFFTmode = false;
        if(audioAnalysisType == audioAnalysisType_mls)
        {
            audio_set_axis(0, -1, 1, -1, 1);
            audio_plot(AudioAxis,audioDataMLS, audioDataMLS, audioTrace0, axistypeLin, 4096 );
        }
        else if( audioAnalysisType == audioAnalysisType_time )
        {
            audio_set_axis(0, -1, 1, -1, 1);
            audio_plot(AudioAxis,audioData1, audioData2, audioTrace0 | audioTrace1, axistypeLin, nrAudioSamples );
        }
    }
}

void labfriend::audio_init(void)
{
    audioLeftBuffer = new float[FifoBufferSize+1];
    audioRigthBuffer = new float[FifoBufferSize+1];
    superplot.ui.dsbTimeAudioRec->setDecimals(3);

    superplot.ui.dsbTimeAudioRec->setRange(0.001, 10.0);
    superplot.ui.dsbTimeAudioRec->setValue(0.1);
    superplot.ui.cmbAnalysis->setCurrentIndex(1);
    superplot.ui.cmbAnalysis->setCurrentIndex(0);
    superplot.ui.cbRepeatAudioRec->setCheckState(Qt::Checked);
    superplot.ui.cbRepeatAudioRec->setCheckState(Qt::Unchecked);

    superplot.ui.smbSignalType->setCurrentIndex(1);
    superplot.ui.smbSignalType->setCurrentIndex(0);
    superplot.ui.smbSignalType_2->setCurrentIndex(1);
    superplot.ui.smbSignalType_2->setCurrentIndex(0);

    superplot.ui.cmbSampleRate->setCurrentIndex(0);  //48khz defalt samplerate

    startAudioGenerate = false;
    audio_gen_delay = 0;
    audioInputConfig = audioATT1;
    enableAudioADC = EnableADC;
    enableAudioDAC = 0;

    superplot.ui.dbsAmplitude1->setDecimals(3);
    superplot.ui.dbsAmplitude1->setRange(0.0, 1.0);
    superplot.ui.dbsAmplitude1->setValue(0.5);
    superplot.ui.dbsAmplitude2->setDecimals(3);
    superplot.ui.dbsAmplitude2->setRange(0.0, 1.0);
    superplot.ui.dbsAmplitude2->setValue(0.5);
    superplot.ui.dbsFrequency1->setDecimals(1);
    superplot.ui.dbsFrequency1->setRange(1,40000);
    superplot.ui.dbsFrequency1->setValue(100);
    superplot.ui.dbsFrequency2->setDecimals(1);
    superplot.ui.dbsFrequency2->setRange(1,40000);
    superplot.ui.dbsFrequency2->setValue(1000);
    GenerateAudioEnable = false;
    GenerateAudioLast = false;
    //Initialize Audio Codec

    audioUpdateTimer = 0;
    zoomYaxisAudio = false;
    audioRecFinished = true;
    superplot.ui.qcpAudioDisplay->axisRect()->setRangeZoom(Qt::Horizontal);
    superplot.ui.smbFFTchannel->setCurrentIndex(1);
    superplot.ui.smbFFTchannel->setCurrentIndex(0);

    superplot.ui.cmbSampleRate->setCurrentIndex(4);  //48khz defalt samplerate

    audio_single_trig = 0;
    audioEnabled = true;
    audioFFTmode = false;
}

void labfriend::audio_connect(void)
{
    QObject::connect( superplot.ui.cmbAudioInputConfig, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioConfig(QString)));
    QObject::connect( superplot.ui.cmbSampleRate, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioSampleRate(QString)));
    QObject::connect( superplot.ui.dbsFrequency1 , SIGNAL( valueChanged(double) ), this, SLOT(setAudioGenerateFrequency1(double)));
    QObject::connect( superplot.ui.dbsFrequency2 , SIGNAL( valueChanged(double) ), this, SLOT(setAudioGenerateFrequency2(double)));
    QObject::connect( superplot.ui.dbsAmplitude1 , SIGNAL( valueChanged(double) ), this, SLOT(setAudioGenerateAmplitude1(double)));
    QObject::connect( superplot.ui.dbsAmplitude2 , SIGNAL( valueChanged(double) ), this, SLOT(setAudioGenerateAmplitude2(double)));
    QObject::connect( superplot.ui.pbGenerateAudio , SIGNAL(toggled(bool)), this, SLOT( GenerateAudio(bool) ) );
    QObject::connect( superplot.ui.cbRepeatAudioRec , SIGNAL(toggled(bool)), this, SLOT( setAudioRecRepeate(bool)) );
    QObject::connect( superplot.ui.dsbTimeAudioRec , SIGNAL( valueChanged(double) ), this, SLOT(setAudioRecTime(double)));
    QObject::connect( superplot.ui.cmbAnalysis, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioAnalysis(QString)));
    QObject::connect( superplot.ui.smbSignalType, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioGenerateType1(QString)));
    QObject::connect( superplot.ui.smbSignalType_2, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioGenerateType2(QString)));
    QObject::connect( superplot.ui.qcpAudioDisplay, SIGNAL(mouseRelease(QMouseEvent*)), this, SLOT(mouseReleaseAudio(QMouseEvent*)));
    QObject::connect( superplot.ui.smbFFTchannel, SIGNAL( currentIndexChanged(QString)), this, SLOT(setAudioFFTchannel(QString)));
    QObject::connect( superplot.ui.pbRecord , SIGNAL(clicked()), this, SLOT( audioToggleReact() ) );
    QObject::connect( superplot.ui.pbFFTCW , SIGNAL(clicked()), this, SLOT( audioFFTCW() ) );
    QObject::connect( superplot.ui.actionSet_Mic_Power, SIGNAL(triggered()), this, SLOT(audioSetMicPower()));
}
