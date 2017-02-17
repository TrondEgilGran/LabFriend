

//#include <QObject>
#include <QGuiApplication>
//#include <QtGui/QMainWindow>
#include <QDir>
#include "mainform.h"
#include <cstdint>
#include "fft/FFTReal.h"

#define LOGGERMAXSIZE 1024
#define MAXDOFILESIZE 100000

class labfriend : public QMainWindow
{
	Q_OBJECT

public:
    MainForm superplot;
    uint8_t audioConfig;
    bool dataLoggerEnabled;
    bool scopeEnabled;
    bool audioEnabled;
    bool doEnabled;
    void initScopeRun(void);
    void scopeConnections(void);
    void setInitialCalibration(void);
    uint8_t *trace_1_raw;
    uint8_t *trace_2_raw;
    uint8_t *trace_3_raw;
    uint8_t *trace_4_raw;
    QVector<double> xaxis;
    QVector<double> trace_1_data;
    QVector<double> trace_2_data;
    QVector<double> trace_3_data;
    QVector<double> trace_4_data;
    QVector<double> digitalBit0data;
    QVector<double> digitalBit1data;
    QVector<double> digitalBit2data;
    QVector<double> digitalBit3data;
    QVector<double> digitalBit4data;
    QVector<double> digitalBit5data;
    QVector<double> digitalBit6data;
    QVector<double> digitalBit7data;
    QVector<double> Logxaxis;
    QVector<double> AudioAxis;
    QVector<double> audioData1;
    QVector<double> audioData2;
    uint8_t *dobit07;
    uint32_t dosize;
    uint8_t *aovalue;
    uint32_t aosize;
    float *audioLeftBuffer;
    float *audioRigthBuffer;
    void open_CalibrationFile(void);
    void byte2FloatingBits(uint8_t *inputByte);
    //Cursors
    typedef struct {
        QCPItemLine *hLine;
        QCPItemLine *vLine;
    } QCPCursor;

    bool cursorEnabled=true;
    void ManageCursor(QCustomPlot *customPlot, QCPCursor *cursor, double x, double y, QPen pen);

public slots:
	
    void mouseRelease(QMouseEvent* event);
    void mouseReleaseAudio(QMouseEvent* event);
    void get_audio_data(void);
    void ScopeRun(void);
    void singleScopeRun(bool checked);
    void scopeStart(void);
    void audioToggleReact(bool checked);
    void setTraceSource1(QString qsSource);
    void setTraceSource2(QString qsSource);
    void setTraceSource3(QString qsSource);
    void setTraceSource4(QString qsSource);
    void setVoltDivADC1(QString qsSource);
    void setVoltDivADC2(QString qsSource);
    void setAcADC1(bool checked);
    void setAcADC2(bool checked);
    void setTrigType(QString qsTrigType);
    void setTrigSource(QString qsSource);
    void setOffsetADC1(double offsetVoltage);
    void setOffsetADC2(double offsetVoltage);
    void setOffsetTime(double offsetTime);
    void setTriggerValue(double dbTrigger);
    void setTimeDiv(QString qsSource);
    void setLoggerGain1(QString qsTrigType);
    void setLoggerGain2(QString qsTrigType);
    void getLoggerData( void );
    void dataLoggerChekerbox(bool checked);
    void setLoggerRate(double loggerSampleRate);
    void setEXvoltage(double tempvalue);
    void setIOvoltage(double tempvalue);
    void EXvoltageButton( void );
    void IOvoltageButton( void );
    void DinVrefVoltageButton( void );
    void DinOffsetVoltageButton( void );
    void setdIrefVoltage(double tempvalue);
    void setdIoffsetVoltage(double tempvalue);
    void dataLoggerFileChekerbox(bool checked);
    void setDigiOut0(bool checked);
    void setDigiOut1(bool checked);
    void setDigiOut2(bool checked);
    void setDigiOut3(bool checked);
    void setDigiOut4(bool checked);
    void setDigiOut5(bool checked);
    void setDigiOut6(bool checked);
    void setDigiOut7(bool checked);
    void setDOrate(double doSampleRate);
    void setFileDOenable(bool checked);
    void setFileLoop(bool checked);
    void setAudioConfig(QString qsSource);
    void setAudioGenerateFrequency1(double frequency);
    void setAudioGenerateFrequency2(double frequency);
    void setAudioGenerateAmplitude1(double frequency);
    void setAudioGenerateAmplitude2(double frequency);
    void setAudioSampleRate(QString qsSource);
    void GenerateAudio(bool checked);
    void setFastRead(bool checked);
    void setAudioGenerateType2(QString qsSource);
    void setAudioGenerateType1(QString qsSource);
    void setAudioRecTime(double time);
    void setAudioRecRepeate(bool checked);
    void setAudioAnalysis(QString qsSource);
    void scopeBufferSizeF(QString qsSource);
    //AWG and DWG functions
    void setDWGrate(int dwgrate);
    void setAWGrate(int awgrate);
    void dwgRunButton( void );
    void awgRunButton( void );
    void awgLoopFun(bool lopstat);
    void dwgLoopFun( bool lopstat);
    void open_AO_file(void);
    void open_DO_file(void);

signals:
	void replotdatanow();
    void replotaudiodatanow();
    void replotTriggerDataNow();

	

private:

    void timeOffsetFormat();

    double dataLoggerRate;
    double systemTimerRate;
    uint32_t dataLoggerTimer;
    uint32_t dataLoggerTimerMax;
    double scopeUpdateRate;
    uint32_t scopeUpdateTimer;
    uint32_t scopeUpdateTimerMax;
    double audioUpdateRate;
    uint32_t audioUpdateTimer;
    uint32_t audioUpdateTimerMax;
    double audioSampleRate;
    double scopeTimeOffsetFormat;
    double scopeOffsetCh1;
    double scopeOffsetCh2;
    bool zoomYaxis;
    bool zoomYaxisAudio;

    double doUpdateRate;
    uint32_t doUpdateTimer;
    uint32_t doUpdateTimerMax;

    bool scopeSingle;
    bool firstScopeCapture;
    uint8_t trace1source;
    uint8_t trace2source;
    uint8_t trace3source;
    uint8_t trace4source;
    void setVoltDiv(uint8_t channel, QString qsSource);
    uint8_t triggerType;
    uint8_t triggerSource;
    uint8_t srateDiv;
    uint8_t srateMult;
    double ADC1OffsetGainError;
    double ADC1OffsetOffsetError;
    double ADC2OffsetGainError;
    double ADC2OffsetOffsetError;
    double vdiv5mvOffsetErrorCH1;
    double vdiv10mvOffsetErrorCH1;
    double vdiv20mvOffsetErrorCH1;
    double vdiv50mvOffsetErrorCH1;
    double vdiv100mvOffsetErrorCH1;
    double vdiv200mvOffsetErrorCH1;
    double vdiv5mvOffsetErrorCH2;
    double vdiv10mvOffsetErrorCH2;
    double vdiv20mvOffsetErrorCH2;
    double vdiv50mvOffsetErrorCH2;
    double vdiv100mvOffsetErrorCH2;
    double vdiv200mvOffsetErrorCH2;
    double LAVIOOffsetGainError;
    double LAVIOOffsetOffsetError;
    double EXVOOffsetGainError;
    double EXVOOffsetOffsetError;
    double LAVIrefOffsetGainError;
    double LAVIrefOffsetOffsetError;
    double LAVIoffsetGainError;
    double LAVIoffsetOffsetError;
    double scopeVdiv[2];
    uint32_t scopeOffsetValue;
    double scopeSampleRate;
    double scopeOffsetTime;
    uint8_t triggerValue;
    QVector<double> loggerChannel1;
    QVector<double> loggerChannel2;
    int loggersample;
    uint8_t loggerGainCH1;
    uint8_t loggerGainCH2;
    double EXvoltage;
    double digitalIOvoltage;
    double digitalIrefVoltage;
    double digitalIoffsetVoltage;
    bool dataLoggertoFile;
    uint8_t digitalOutputByte;
    uint8_t digitalOutputByte_last;
    uint32_t dobyteCounter;
    bool doFileEnable;
    bool doLoopFile;
    uint8_t audioInputConfig;
    uint8_t audioSampleRateConfig;
    double audioGenAmplitude1;
    double audioGenAmplitude2;
    double audioGenFrequency1;
    double audioGenFrequency2;
    QString audioGenerateType1;
    QString audioGenerateType2;
    bool GenerateAudioEnable;
    bool GenerateAudioLast;
    bool startAudioGenerate;
    uint16_t numberOfSamples;
    double actualGeneratedFrequency1;
    double actualGeneratedFrequency2;
    bool ScopeFastRead;
    uint32_t scopeBufferSize;
    double scopeActualDiv;
    double xCursor1Point;
    double xCursor2Point;
    double yCursor1Point;
    double yCursor2Point;
    uint8_t enableAudioADC;
    uint8_t enableAudioDAC;
    int audio_gen_delay;
    double audioRecTime;
    bool audioRepeat;
    bool audioRecFinished;
    int audioRemainingSamples;
    int audio_buffer_position;
    int nrAudioSamples;
    double audioSamplerate;
    int audioAnalysisType;
    const int audioAnalysisType_time=0;
    const int audioAnalysisType_frequency=1;
    uint32_t scopeBufferSizeV=18432;

    //AWG and DWG signals
    uint16_t awgSampleRate;
    uint16_t dwgSampleRate;
    bool awgSingle;
    bool dwgSingle;


};

