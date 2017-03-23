                                                                                // Main Form
#include <ui_mainwindow.h>


#include <QList>

class MainForm : public QMainWindow
{
	Q_OBJECT

public:
	MainForm(QMainWindow *parent = 0);
	void attachCurves();
    //curves
    const int curve1 = 0;
    const int curve2 = 1;
    const int curveD0 = 2;
    const int curveD1 = 3;
    const int curveD2 = 4;
    const int curveD3 = 5;
    const int curveD4 = 6;
    const int curveD5 = 7;
    const int curveD6 = 8;
    const int curveD7 = 9;

    QList<double> *majorTicks;
    void replotNewData(double xmin, double xmax, double ymin, double ymax);
    void InitOPtions();
    QTimer *timerA;
    bool audioEnableButtonValue;
    Ui::MainWindow ui;
    void replotAudioData(double xmin, double xmax, double ymin, double ymax, double ymin2, double ymax2);


public slots:
		
    void replotLoggerData();


signals:
	
private:

};
