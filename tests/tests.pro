include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG += thread

# gcov
QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
QMAKE_CFLAGS += -fprofile-arcs -ftest-coverage
LIBS += -lgcov

HEADERS +=  \
    test_checkWin.h \
    test_newGame.h \
    test_startGame.h \
    ../Pro/helper.h


SOURCES += main.cpp \
    ../Pro/helper.cpp
        
INCLUDEPATH += ../Pro
