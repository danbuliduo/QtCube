#添加包含路径与QML导入路径
INCLUDEPATH += $$PWD
QML_IMPORT_PATH = $$PWD
#添加QT模块
QT += core-private
LIBS += -ljnigraphics

COPYFILEPATH_COREX = $$PWD/CubeAndroid/src/io/kanbuki/qtcube/android/corex
PACKAGEPATH_COREX = $$ANDROID_PACKAGE_SOURCE_DIR/src/io/kanbuki/qtcube/android/corex

contains(DEFINES, CUBE_ANDROID) {
    equals(QMAKE_HOST.os , Windows) {
        make_src_dir.commands += $(CHK_DIR_EXISTS) $$shell_path($$PACKAGEPATH_COREX) $(MKDIR) $$shell_path($$PACKAGEPATH_COREX)
        PRE_TARGETDEPS += make_src_dir
        QMAKE_EXTRA_TARGETS += make_src_dir
    }else {
        make_src_dir.commands = $(MKDIR) $$shell_path($$PACKAGEPATH_COREX)
    }
    HEADERS += $$PWD/CubeAndroid/CubeAndroidManager.h
    HEADERS += $$PWD/CubeAndroid/CubeAndroidTools.h
    contains(DEFINES, CUBE_NOTIFICATION) {
         HEADERS += $$PWD/CubeAndroid/AndroidNotification.h
         SOURCES += $$PWD/CubeAndroid/AndroidNotification.cpp
         DISTFILES += $$COPYFILEPATH_COREX/AndroidNotification.java
         android_notification.commands = $(COPY_FILE) $$shell_path($$COPYFILEPATH_COREX/AndroidNotification.java) $$shell_path($$PACKAGEPATH_COREX)
         PRE_TARGETDEPS += android_notification
         QMAKE_EXTRA_TARGETS += android_notification
    }
    contains(DEFINES, CUBE_SYSTEMCONTROLLER){
        HEADERS += $$PWD/CubeAndroid/AndroidSystemController.h
        SOURCES += $$PWD/CubeAndroid/AndroidSystemController.cpp
        DISTFILES += $$COPYFILEPATH_COREX/AndroidSystemController.java
        android_systemcontroller.commands = $(COPY_FILE) $$shell_path($$COPYFILEPATH_COREX/AndroidSystemController.java) $$shell_path($$PACKAGEPATH_COREX)
        PRE_TARGETDEPS += android_systemcontroller
        QMAKE_EXTRA_TARGETS += android_systemcontroller
    }
    contains(DEFINES, CUBE_SYSTEMSENSOR) {
        QT += sensors
        HEADERS += $$PWD/CubeAndroid/AndroidSystemSensor.h
        SOURCES += $$PWD/CubeAndroid/AndroidSystemSensor.cpp
        DISTFILES += $$COPYFILEPATH_COREX/AndroidSystemSensor.java
        android_systemsensor.commands = $(COPY_FILE) $$shell_path($$COPYFILEPATH_COREX/AndroidSystemSensor.java) $$shell_path($$PACKAGEPATH_COREX)
        PRE_TARGETDEPS += android_systemsensor
        QMAKE_EXTRA_TARGETS += android_systemsensor
    }
}



