#pragma once

#include <QObject>
#include <QJniObject>
#include <QQmlEngine>
#include <QAccelerometer>
#include <QAmbientLightSensor>
#include <QAmbientTemperatureSensor>
#include <QCompass>
#include <QGyroscope>
#include <QHumiditySensor>
#include <QLightSensor>
#include <QMagnetometer>
#include <QOrientationSensor>
#include <QPressureSensor>
#include <QProximitySensor>
#include <QRotationSensor>
#include <QTiltSensor>

class Sensor : public QObject
{
    Q_OBJECT
public:
    enum AxisType{ X, Y, Z }; Q_ENUM(AxisType);
    enum SensorType {
         AcceleroMeter,                                //!加速度传感器
         AmbientLightSensor,                     //!环境光亮传感器
         AmbientTemperatureSensor,       //!环境温度传感器
         Compass,                                         //!电子罗盘
         Gyroscope,                                      //!陀螺仪
         HumiditySensor,                            //!湿度传感器
         LightSensor,                                   //!光强传感器
         MagnetoMeter,                             //!电磁场传感器
         OrientationSensor,                       //!方向传感器
         PressureSensor,                            //!大气压强传感器
         ProximitySensor,                          //!近距离传感器
         RotationSensor,                             //!旋转传感器
         TiltSensor                                      //!倾斜传感器
    };Q_ENUM(SensorType)
};

class AndroidSystemSensor : public QObject
{
    Q_OBJECT
public:
    explicit AndroidSystemSensor(QObject *parent = nullptr);
    static QObject* qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_INVOKABLE void openAllTypeSensor();
    Q_INVOKABLE void openSensor(Sensor::SensorType);
    Q_INVOKABLE void closeAllTypeSensor();
    Q_INVOKABLE void closeSensor(Sensor::SensorType);
    Q_INVOKABLE QString getDescription(Sensor::SensorType);
    Q_INVOKABLE double getAccelero(Sensor::AxisType);
    Q_INVOKABLE double getAmbientTemperature();
    Q_INVOKABLE double getCompass();
    Q_INVOKABLE double getGyroscope(Sensor::AxisType);
    Q_INVOKABLE double getHumidity();
    Q_INVOKABLE double getLight();
    Q_INVOKABLE double getMagneto(Sensor::AxisType);
    Q_INVOKABLE double getRotation(Sensor::AxisType);
    Q_INVOKABLE double getPressure();
    Q_INVOKABLE int getProximity();
    Q_INVOKABLE int getBattery();
private:
     QAccelerometer *accelerMeter=nullptr;
     QAmbientLightSensor *ambientLightSensor =nullptr;
     QAmbientTemperatureSensor *ambientTemperatureSensor=nullptr;
     QCompass *compass=nullptr;
     QGyroscope *gyroscope=nullptr;
     QHumiditySensor *humiditySensor=nullptr;
     QLightSensor *lightSensor=nullptr;
     QMagnetometer *magnetoMeter=nullptr;
     QOrientationSensor *orientationSensor=nullptr;
     QPressureSensor *pressureSensor = nullptr;
     QProximitySensor *proximitySensor=nullptr;
     QRotationSensor *rotationSensor=nullptr;
     QTiltSensor *tiltSensor = nullptr;
};
