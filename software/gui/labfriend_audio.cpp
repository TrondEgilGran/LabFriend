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
    mls_measure mls_au;
    const long N = 12;
    const long P = (1 << N) - 1;
    bool *mls = new bool[P];
    long *tagL = new long[P];
    long *tagS = new long[P];
    double *signal = new double[P];
     double *signal_in = new double[P];
    double *perm = new double[P + 1];
    double *resp = new double[P + 1];
    double *respo = new double[P + 1];
    struct timeval begin, end;
    double elapsedTime;
    int groupdelay;

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

        setI2sync();
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
            superplot.ui.qcpAudioDisplay->graph(0)->setData(AudioAxis,audioData1);
            superplot.ui.qcpAudioDisplay->graph(1)->setData(AudioAxis,audioData2);
            superplot.ui.qcpAudioDisplay->xAxis->setScaleType(QCPAxis::stLinear);
            superplot.replotAudioData(0.0, AudioAxis[nrAudioSamples-1], -1, 1);
            audioRecFinished = true;
        }
        else if( audioAnalysisType == audioAnalysisType_frequency)
        {
            int fftsize, nrbit;
            int startpoint;
            double sample_temp, sample_temp2, sample_temp3;
            nrbit = nrAudioSamples;
            fftsize = 0;
            while(nrbit >>= 1)
            {
                fftsize++;
            }
            fftsize = exp2(fftsize-1);
            printf("fftsize %x %d %x \n", fftsize, fftsize, nrAudioSamples);
            ffft::FFTReal <float> fft_object (fftsize);

            float *fftinput;
            float *fftputput;
            fftinput = (float *) malloc(fftsize*sizeof(float));
            if (fftinput==NULL) exit (1);
            fftputput = (float *) malloc(fftsize*sizeof(float));
            if (fftputput==NULL) exit (1);

           // FILE *fptr;
           // fptr=fopen("program.txt","w");

            for(i=0; i < fftsize; i++)
            {
                if(audioFFT_channel == 1)
                {
                    signal_in[i] = audioData1[i];
                }
                else if (audioFFT_channel == 2)
                {
                    signal_in[i] = audioData2[i];
                }
            //    fprintf(fptr, "%f \n", fftinput[i]);
            }

            mls_au.GenerateMls(mls, P, N); // Generate the Maximum length sequence
            mls_au.GeneratetagL(mls, tagL, P, N); // Generate tagL for the L matrix
            mls_au.GeneratetagS(mls, tagS, P, N);
            mls_au.PermuteSignal(signal_in, perm, tagS, P);
            mls_au.FastHadamard(perm,P+1,N);
            mls_au.PermuteResponse(perm,resp,tagL,P);
            mls_au.RotateResponse(resp,respo,P);


            for(i=0; i < fftsize; i++)
            {
                double multiplier = 0.5*(1-cos(2*M_PI*i/fftsize));
                if(audioFFT_channel == 1)
                {
                    fftinput[i] = multiplier * respo[i];
                }
                else if (audioFFT_channel == 2)
                {
                    fftinput[i] = multiplier * respo[i];
                }
            //    fprintf(fptr, "%f \n", fftinput[i]);
            }

            AudioAxis.resize(fftsize/2);
            audioDataFFT.resize(fftsize/2);
            audioDataFilteredFFT.resize(fftsize/2);
            fft_object.do_fft(fftputput, fftinput);
            fft_object.do_ifft(fftputput, fftinput);
            startpoint = audioSampleRate/nrAudioSamples;
            for(i=0; i < fftsize/2; i++)
            {
                audioDataFFT[i] = 20*log10(sqrt(pow(fftputput[i], 2) + pow(fftputput[i+fftsize/2],2))/((float)fftsize/2));
                AudioAxis[i] = i*((audioSamplerate/2)/(fftsize/2));
            }
            /*for(i=0; i < fftsize/2; i++)
            {
                if(audioFFTAVGcounter == 0)
                {
                    audioDataFilteredFFT[i] =  audioDataFFT[i]/(96);
                    audioDataFFT[i] = 0.0;
                }
                sample_temp = 20*log10(sqrt(pow(fftputput[i], 2) + pow(fftputput[i+fftsize/2],2))/((float)fftsize/2));
                audioDataFFT[i] = (audioDataFFT[i] + sample_temp);
                AudioAxis[i] = i*((audioSamplerate/2)/(fftsize/2));
                if(i==100) sample_temp2 = sample_temp;
            }*/
/*
            for(i = 0; i < P; i++)
            {
                audioDataFilteredFFT[i] = respo[i];
                AudioAxis[i] = i/audioSampleRate;
            }

            if(audioFFTAVGcounter == 95)
            {
                audioFFTAVGcounter = 0;
            }
            else
            {
                audioFFTAVGcounter++;
            }*/
            //printf("hmmmd %f %f %f %f\n", audioDataFFT[100], sample_temp2, audioDataFilteredFFT[100], sample_temp3 );
           // printf("StartPointFFT %d %f, %d %f %f\n", startpoint, audioSampleRate, nrAudioSamples, audioData1[fftsize/2-1], AudioAxis[fftsize/2-1]);
           // superplot.ui.qcpAudioDisplay->graph(0)->setData();


            superplot.ui.qcpAudioDisplay->graph(0)->setData(AudioAxis,audioDataFFT, 1);
            superplot.ui.qcpAudioDisplay->graph(1)->setVisible(0);

            QSharedPointer<QCPAxisTickerLog> logTicker(new QCPAxisTickerLog);
            logTicker->setLogBase(10);
            superplot.ui.qcpAudioDisplay->xAxis->setTicker(logTicker);
            superplot.ui.qcpAudioDisplay->xAxis->setScaleType(QCPAxis::stLogarithmic);
           // superplot.ui.qcpAudioDisplay->graph(1)[i](AudioAxis,audioData1);
           // superplot.replotAudioData(audioSampleRate/nrAudioSamples, AudioAxis[(fftsize/2-1)],-1, 1);
            superplot.replotAudioData(10, AudioAxis[(fftsize/2-1)],-155, 1);
            free(fftinput);
            free(fftputput);
            audioRecFinished = true;

            //fclose(fptr);
        }

      //  printf("audio Remaingin %d  %d %f\n", audioRemainingSamples, audio_buffer_position, AudioAxis[nrAudioSamples-1]);
      //  printf("i %d, nr-1 %d %f\n",(i+audio_buffer_position), nrAudioSamples-1, audioSamplerate);

    }
    else
    {
        audio_buffer_position = audio_buffer_position + (fifolevel-groupdelay);

    }
/*
    delete []mls;
    delete []tagL;
    delete []tagS;
    delete []signal;
    delete []perm;
    delete []resp;
    delete []signal_in;*/
}

void labfriend::audio_generate(void)
{
    double currentSamplerate;
    double divisionratio;
    mls_measure mls_af;
    const long N = 12;
    const long P = (1 << N) - 1;
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
            mls_af.GenerateSignal(mls, signal, P, 0.5);
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
            mls_af.GenerateSignal(mls, signal, P, 0.5);
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

void labfriend::audioToggleReact(bool checked)
{
    audioEnabled = checked;
    audioFFTAVGcounter = 0;

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
    QObject::connect( superplot.ui.pbRecord , SIGNAL(toggled(bool)), this, SLOT( audioToggleReact(bool) ) );
}
