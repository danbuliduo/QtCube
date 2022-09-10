android{
    QT += quick

# Additional import path used to resolve QML modules in Qt Creator's code model
    QML_IMPORT_PATH = $$PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
    QML_DESIGNER_IMPORT_PATH =
    SOURCES += Main.cpp
    RESOURCES += Application.qrc

    DISTFILES += \
            Android/AndroidManifest.xml \
            Android/build.gradle \
            Android/res/drawable/splashscreen.xml \
            Android/res/values/splashscreentheme.xml \
            Android/src/org/qtproject/example/*.java \

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/Android

    DEFINES += CUBE_ANDROID
    DEFINES += CUBE_NOTIFICATION
    DEFINES += CUBE_SYSTEMCONTROLLER
    DEFINES += CUBE_SYSTEMSENSOR
    include(../QtCube/CubeAndroid.pri)
    include(../QtCube/CubeQuick.pri)
}

