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
    #include <board.h>
    #include <spicomm.h>
    #include <sys/time.h>
    #include <time.h>
    #include <unistd.h>
}

void labfriend::setInitialCalibration(void)
{
    ADCGainError[0] = 1;
    ADCOffsetError[0] = 0;
    ADCGainError[1] = 1;
    ADCOffsetError[1] = 0;
    LAVIOOffsetGainError = 1;
    LAVIOOffsetOffsetError = 0;
    EXVOOffsetGainError = 1;
    EXVOOffsetOffsetError = 0;
    LAVIrefOffsetGainError = 1.1834;
    LAVIrefOffsetOffsetError = 0;
    LAVIoffsetGainError = 1;
    LAVIoffsetOffsetError = 2;
    //Scope Offset
    vdiv5mvOffsetError[0] = 0;
    vdiv10mvOffsetError[0] = 0;
    vdiv20mvOffsetError[0] = 0;
    vdiv50mvOffsetError[0] = 0;
    vdiv100mvOffsetError[0] = 0;
    vdiv200mvOffsetError[0] = 0;
    vdiv500mvOffsetError[0] = 0;
    vdiv1vOffsetError[0] = 0;
    vdiv2vOffsetError[0] = 0;
    vdiv5mvOffsetError[1] = 0;
    vdiv10mvOffsetError[1] = 0;
    vdiv20mvOffsetError[1] = 0;
    vdiv50mvOffsetError[1] = 0;
    vdiv100mvOffsetError[1] = 0;
    vdiv200mvOffsetError[1] = 0;
    vdiv500mvOffsetError[1] = 0;
    vdiv1vOffsetError[1] = 0;
    vdiv2vOffsetError[1] = 0;
    vdiv5mvOffsetError[0] = 0;
    vdiv10mvGainError[0] = 1;
    vdiv20mvGainError[0] = 1;
    vdiv50mvGainError[0] = 1;
    vdiv100mvGainError[0] = 1;
    vdiv200mvGainError[0] = 1;
    vdiv500mvGainError[0] = 1;
    vdiv1vGainError[0] = 1;
    vdiv2vGainError[0] = 1;
    vdiv5mvGainError[1] = 1;
    vdiv10mvGainError[1] = 1;
    vdiv20mvGainError[1] = 1;
    vdiv50mvGainError[1] = 1;
    vdiv100mvGainError[1] = 1;
    vdiv200mvGainError[1] = 1;
    vdiv500mvGainError[1] = 1;
    vdiv1vGainError[1] = 1;
    vdiv2vGainError[1] = 1;

    open_CalibrationFile();
}

void labfriend::open_CalibrationFile(void)
{


     QFile file("./calibration.conf");
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
              if(i == 1)
              {
                  vdiv5mvOffsetError[0] = strtod (buf, &pEnd);
                  vdiv10mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv20mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv50mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv100mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv200mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv500mvOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv1vOffsetError[0] = strtod (pEnd, &pEnd);
                  vdiv2vOffsetError[0] =   strtod (pEnd, NULL);
              }
              if(i == 2)
              {
                  vdiv5mvOffsetError[1] = strtod (buf, &pEnd);
                  vdiv10mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv20mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv50mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv100mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv200mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv500mvOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv1vOffsetError[1] = strtod (pEnd, &pEnd);
                  vdiv2vOffsetError[1] = strtod (pEnd, NULL);
              }
              if(i == 4)
              {
                  vdiv5mvGainError[0] = strtod (buf, &pEnd);
                  vdiv10mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv20mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv50mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv100mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv200mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv500mvGainError[0] = strtod (pEnd, &pEnd);
                  vdiv1vGainError[0] = strtod (pEnd, &pEnd);
                  vdiv2vGainError[0] =   strtod (pEnd, NULL);
              }
              if(i == 5)
              {
                  vdiv5mvGainError[1] = strtod (buf, &pEnd);
                  vdiv10mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv20mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv50mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv100mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv200mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv500mvGainError[1] = strtod (pEnd, &pEnd);
                  vdiv1vGainError[1] = strtod (pEnd, &pEnd);
                  vdiv2vGainError[1] = strtod (pEnd, NULL);
              }
              if(i == 7)
              {
                  LAVIOOffsetOffsetError = strtod (buf, &pEnd);
                  EXVOOffsetOffsetError = strtod (pEnd, &pEnd);
                  LAVIrefOffsetOffsetError = strtod (pEnd, &pEnd);
                  LAVIoffsetOffsetError = strtod (pEnd, NULL);
              }
              if(i == 9)
              {
                  LAVIOOffsetGainError = strtod (buf, &pEnd);
                  EXVOOffsetGainError = strtod (pEnd, &pEnd);
                  LAVIrefOffsetGainError = strtod (pEnd, &pEnd);
                  LAVIoffsetGainError = strtod (pEnd, NULL);
              }
              i++;

            }

        }
        printf("i is %d \n", i);
        dosize = i;
    }

}
