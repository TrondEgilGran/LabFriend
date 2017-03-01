######################################################################
# Automatically generated by qmake (2.01a) Mon Jan 20 19:14:16 2014
######################################################################

QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport


TEMPLATE = app
TARGET = LabFriend
DEPENDPATH += .
INCLUDEPATH += .
QMAKE_CXXFLAGS += -std=c++0x
QMAKE_CXXFLAGS += -O3

LIBS += -lmpsse -lm

#Super Scope Lib
INCLUDEPATH += ../lib/


# Input
HEADERS +=  mainform.h \
            labfriend.h \
            ../lib/audio_codec.h \
            ../lib/board.h \
            ../lib/dcio.h \
            ../lib/scope_control.h \
            ../lib/spicomm.h \
    qcustomplot/qcustomplot.h \
    fft/Array.h \
    fft/Array.hpp \
    fft/def.h \
    fft/DynArray.h \
    fft/DynArray.hpp \
    fft/FFTReal.h \
    fft/FFTReal.hpp \
    fft/FFTRealFixLen.h \
    fft/FFTRealFixLen.hpp \
    fft/FFTRealFixLenParam.h \
    fft/FFTRealPassDirect.h \
    fft/FFTRealPassDirect.hpp \
    fft/FFTRealPassInverse.h \
    fft/FFTRealPassInverse.hpp \
    fft/FFTRealSelect.h \
    fft/FFTRealSelect.hpp \
    fft/FFTRealUseTrigo.h \
    fft/FFTRealUseTrigo.hpp \
    fft/OscSinCos.h \
    fft/OscSinCos.hpp \
    ui_mainwindow.h
SOURCES += mainform.cpp \
           labfriend.cpp \
           ../lib/audio_codec.c \
           ../lib/dcio.c \
           ../lib/scope_control.c \
           ../lib/spicomm.c \
    qcustomplot/qcustomplot.cpp \
    labfriend_calibration.cpp

FORMS += mainwindow.ui
OTHER_FILES += \
    calibration.conf
