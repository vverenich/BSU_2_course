#-------------------------------------------------
#
# Project created by QtCreator 2018-11-14T20:44:15
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QTCPClient
TEMPLATE = app

CONFIG+=sdk_no_version_check

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++14

SOURCES += \
        QLoginDialog.cpp \
        RSA.cpp \
        main.cpp \
        mainwindow.cpp

HEADERS += \
        QLoginDialog.h \
        RSA.h \
        mainwindow.h

FORMS += \
        mainwindow.ui

LIBS +=  -lcryptopp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
