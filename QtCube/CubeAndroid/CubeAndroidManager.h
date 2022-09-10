#pragma once
#include <QQmlEngine>
#ifdef CUBE_NOTIFICATION
#include <CubeAndroid/AndroidNotification.h>
#endif
#ifdef CUBE_SYSTEMCONTROLLER
#include <CubeAndroid/AndroidSystemController.h>
#endif
#ifdef CUBE_SYSTEMSENSOR
#include <CubeAndroid/AndroidSystemSensor.h>
#endif

void initializeCubeAndroid(){
#ifdef CUBE_NOTIFICATION
    qmlRegisterType<AndroidNotification>("CubeAndroid.CoreX", 1, 0, "AndroidNotification");
#endif
#ifdef CUBE_SYSTEMCONTROLLER
    qmlRegisterSingletonType<AndroidSystemController>("CubeAndroid.CoreX",1,0,"AndroidSystemController",&AndroidSystemController::qmlInstance);
#endif
#ifdef CUBE_SYSTEMSENSOR
    qmlRegisterType<Sensor>("CubeAndroid.CoreX",1,0,"Sensor");
    qmlRegisterSingletonType<AndroidSystemSensor>("CubeAndroid.CoreX",1,0,"AndroidSystemSensor",&AndroidSystemSensor::qmlInstance);
#endif
}
