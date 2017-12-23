#-------------------------------------------------
#
# Project created by QtCreator 2017-12-16T23:24:09
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Quroboros
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

##----------------------------------------------------------------------
#openmpi support
MPI_BASE_DIR = /home/zhenyu/deps/openmpi-1.10.2
INCLUDEPATH +="$$MPI_BASE_DIR/include"
LIBS +=-L$$MPI_BASE_DIR/lib -lmpi_cxx -lmpi

#boost support
BOOST_ROOT=$HOME/deps/boost-1.64.0
INCLUDEPATH +="$$BOOST_ROOT/include"
#LIBS +=-L/usr/lib/x86_64-linux-gnu
LIBS +=-L$$BOOST_ROOT/lib
LIBS +=-lboost_filesystem -lboost_system

#dealii support
DEALII_ROOT=/home/zhenyu/deps/deal.II_8.5.1
INCLUDEPATH +="$$DEALII_ROOT/include"
LIBS +=-L$$DEALII_ROOT/lib -ldeal_II

#Trilinos support
TRILINOS_ROOT=/home/zhenyu/deps/trilinos
INCLUDEPATH +="$$TRILINOS_ROOT/include"
LIBS +=-L$$TRILINOS_ROOT/lib
LIBS +=-lepetra -laztecoo -lsacado -ltpetra -lteuchoscore

#p4est support
P4EST_ROOT=/home/zhenyu/deps/p4est/FAST
INCLUDEPATH +="$$P4EST_ROOT/include"
LIBS +=-L$$P4EST_ROOT/lib
LIBS +=-lp4est -lsc

#tbb support
INCLUDEPATH +="/usr/include/tbb"
LIBS +=-L/usr/lib/x86_64-linux-gnu
LIBS +=-ltbb

#gsl support
INCLUDEPATH +="/usr/include/gsl"
LIBS +=-L/usr/lib/x86_64-linux-gnu
LIBS +=-lgsl -lgslcblas

SOURCES += \
        qt/main.cpp \
        qt/widgets/mainwindow.cpp

HEADERS += \
        qt/widgets/mainwindow.h

FORMS += \
        qt/widgets/mainwindow.ui

#QMAKE_CXX = mpic++
QMAKE_CXX = mpicxx
QMAKE_CXX_RELEASE = $$QMAKE_CXX
QMAKE_CXX_DEBUG = $$QMAKE_CXX
QMAKE_LINK = $$QMAKE_CXX
QMAKE_CC = mpicc

QMAKE_CFLAGS = $$system(mpicc --showme:compile)
QMAKE_LFLAGS = $$system(mpicxx --showme:link)
QMAKE_CXXFLAGS = $$system(mpicxx --showme:compile) -DMPICH_IGNORE_CXX_SEEK -std=c++11
QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CXXFLAGS

QMAKE_CXXFLAGS += -std=c++11 -std=gnu++11 -std=c++0x
