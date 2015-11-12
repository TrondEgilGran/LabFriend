// Main Form

#include <QApplication>
#include <QtGui>
#include "mainform.h"
#include <QTimer>


MainForm::MainForm(QMainWindow *parent) : QMainWindow(parent)
{
	ui.setupUi(this);


    timerA = new QTimer();

}

void MainForm::attachCurves()
{
    //Scope Display
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curve1 )->setPen(QPen(Qt::blue));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curve2 )->setPen(QPen(Qt::red));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD0 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD1 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD2 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD3 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD4 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD5 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD6 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->addGraph();
    ui.qcpScopeDisplay->graph( curveD7 )->setPen(QPen(Qt::green));
    ui.qcpScopeDisplay->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom );

    //Data Logger
    ui.qcpDataLog->addGraph();
    ui.qcpDataLog->graph(0)->setPen(QPen(Qt::blue));
    ui.qcpDataLog->addGraph();
    ui.qcpDataLog->graph(1)->setPen(QPen(Qt::red));

    //Audio Display
    ui.qcpAudioDisplay->addGraph();
    ui.qcpAudioDisplay->graph(0)->setPen(QPen(Qt::blue));
    ui.qcpAudioDisplay->addGraph();
    ui.qcpAudioDisplay->graph(1)->setPen(QPen(Qt::red));
    ui.qcpAudioDisplay->setInteractions(QCP::iRangeDrag | QCP::iRangeZoom );

}




void MainForm::InitOPtions()
{
    ui.cmbTraceSource1->addItem("ADC 1");
    ui.cmbTraceSource1->addItem("ADC 2");
    ui.cmbTraceSource1->addItem("Digital");
    ui.cmbTraceSource2->addItem("ADC 1");
    ui.cmbTraceSource2->addItem("ADC 2");
    ui.cmbTraceSource2->addItem("Digital");
    ui.cmbTraceSource3->addItem("Digital 0");
    ui.cmbTraceSource3->addItem("Digital 1");
    ui.cmbTraceSource3->addItem("Digital 2");
    ui.cmbTraceSource3->addItem("Digital 3");
    ui.cmbTraceSource3->addItem("Digital 4");
    ui.cmbTraceSource3->addItem("Digital 5");
    ui.cmbTraceSource3->addItem("Digital 6");
    ui.cmbTraceSource3->addItem("Digital 7");
    ui.cmbTraceSource4->addItem("Digital 0");
    ui.cmbTraceSource4->addItem("Digital 1");
    ui.cmbTraceSource4->addItem("Digital 2");
    ui.cmbTraceSource4->addItem("Digital 3");
    ui.cmbTraceSource4->addItem("Digital 4");
    ui.cmbTraceSource4->addItem("Digital 5");
    ui.cmbTraceSource4->addItem("Digital 6");
    ui.cmbTraceSource4->addItem("Digital 7");
    ui.cmbTriggerSource->addItem("Trace 1");
    ui.cmbTriggerSource->addItem("Trace 2");
    ui.cmbTriggerSource->addItem("Trace 3");
    ui.cmbTriggerSource->addItem("Trace 4");
    ui.cmbTrigType->addItem("Pos Edge");
    ui.cmbTrigType->addItem("Neg Edge");
    ui.cmbTrigType->addItem("Automatic");
    ui.cmbADC1->addItem("5mV/div");
    ui.cmbADC2->addItem("5mV/div");
    ui.cmbADC1->addItem("10mV/div");
    ui.cmbADC2->addItem("10mV/div");
    ui.cmbADC1->addItem("20mV/div");
    ui.cmbADC2->addItem("20mV/div");
    ui.cmbADC1->addItem("50mV/div");
    ui.cmbADC2->addItem("50mV/div");
    ui.cmbADC1->addItem("100mV/div");
    ui.cmbADC2->addItem("100mV/div");
    ui.cmbADC1->addItem("200mV/div");
    ui.cmbADC2->addItem("200mV/div");
    ui.cmbADC1->addItem("500mV/div");
    ui.cmbADC2->addItem("500mV/div");
    ui.cmbADC1->addItem("1V/div");
    ui.cmbADC2->addItem("1V/div");
    ui.cmbADC1->addItem("2V/div");
    ui.cmbADC2->addItem("2V/div");
    ui.pbRecord->setCheckable(true);
    ui.pbGenerateAudio->setCheckable(true);
    ui.pbTrigSingle->setCheckable(true);
    ui.cmbSampleRate->addItem("16k");
    ui.cmbSampleRate->addItem("19k");
    ui.cmbSampleRate->addItem("24k");
    ui.cmbSampleRate->addItem("32k");
    ui.cmbSampleRate->addItem("48k");
    ui.cmbSampleRate->addItem("96k");
    ui.cmbTimeDiv->addItem("300us");
    ui.cmbTimeDiv->addItem("600us");
    ui.cmbTimeDiv->addItem("1ms");
    ui.cmbTimeDiv->addItem("2ms");
    ui.cmbTimeDiv->addItem("5ms");
    ui.cmbTimeDiv->addItem("10ms");
    ui.cmbTimeDiv->addItem("20ms");
    ui.cmbTimeDiv->addItem("40ms");
    ui.cmbTimeDiv->addItem("80ms");
    ui.cmbTimeDiv->addItem("200ms");
    ui.cmbTimeDiv->addItem("400ms");
    ui.cmbTimeDiv->addItem("600ms");
    ui.cmbTimeDiv->addItem("1s");
    ui.smbSignalType->addItem("Sinus");
    ui.smbSignalType_2->addItem("Sinus");
    ui.smbSignalType->addItem("Square");
    ui.smbSignalType_2->addItem("Square");
    ui.smbSignalType->addItem("Dirac");
    ui.smbSignalType_2->addItem("Dirac");
    ui.cmbGAINCH1->addItem("X1");
    ui.cmbGAINCH1->addItem("X2");
    ui.cmbGAINCH1->addItem("X4");
    ui.cmbGAINCH1->addItem("X8");
    ui.cmbGAINCH2->addItem("X1");
    ui.cmbGAINCH2->addItem("X2");
    ui.cmbGAINCH2->addItem("X4");
    ui.cmbGAINCH2->addItem("X8");
    ui.cmbAudioInputConfig->addItem("NORMAL");
    ui.cmbAudioInputConfig->addItem("1/10");
    ui.cmbAudioInputConfig->addItem("VREF");
    ui.cmbAudioInputConfig->addItem("GND");
    ui.cmbAnalysis->addItem("Time");
    ui.cmbAnalysis->addItem("Frequency");

}





void MainForm::replotNewData(double xmin, double xmax, double ymin, double ymax)
{
	
    ui.qcpScopeDisplay->xAxis->setRange(xmin, xmax);
    ui.qcpScopeDisplay->yAxis->setRange(ymin, ymax);

    ui.qcpScopeDisplay->replot();
}

void MainForm::replotLoggerData()
{


    ui.qcpDataLog->replot();
}

void MainForm::replotAudioData(double xmin, double xmax, double ymin, double ymax)
{
    ui.qcpAudioDisplay->xAxis->setRange(xmin, xmax);
    ui.qcpAudioDisplay->yAxis->setRange(ymin, ymax);

    ui.qcpAudioDisplay->replot();
}
