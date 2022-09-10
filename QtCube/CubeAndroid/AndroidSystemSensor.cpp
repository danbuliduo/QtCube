#include "AndroidSystemSensor.h"
#include <QtCore/private/qandroidextras_p.h>


AndroidSystemSensor::AndroidSystemSensor(QObject *parent)
    : QObject{parent} {
}

QObject* AndroidSystemSensor::qmlInstance(QQmlEngine *QEngine, QJSEngine *JEngine){
    Q_UNUSED(QEngine);
    Q_UNUSED(JEngine);
    AndroidSystemSensor *staticCube = new AndroidSystemSensor();
    return staticCube;
}

void AndroidSystemSensor::openAllTypeSensor(){
    if(accelerMeter == nullptr ) {
        accelerMeter = new QAccelerometer();
        accelerMeter->start();
    }
    if(ambientLightSensor == nullptr) {
        ambientLightSensor = new QAmbientLightSensor();
        ambientLightSensor->start();
    }
    if(ambientTemperatureSensor == nullptr) {
        ambientTemperatureSensor = new QAmbientTemperatureSensor();
        ambientTemperatureSensor->start();
    }
    if(compass == nullptr) {
        compass = new QCompass();
        compass->start();
    }
    if(gyroscope == nullptr) {
        gyroscope = new QGyroscope();
        gyroscope->start();
    }
    if(orientationSensor == nullptr) {
        orientationSensor = new QOrientationSensor();
        orientationSensor->start();
    }
    if(humiditySensor == nullptr) {
        humiditySensor = new QHumiditySensor();
        humiditySensor->start();
    }
    if(lightSensor == nullptr) {
        lightSensor = new QLightSensor();
        lightSensor->start();
    }
    if(magnetoMeter == nullptr) {
        magnetoMeter = new QMagnetometer();
        magnetoMeter->start();
    }
    if(pressureSensor == nullptr) {
        pressureSensor = new QPressureSensor();
        pressureSensor->start();
    }
    if(proximitySensor == nullptr) {
        proximitySensor = new QProximitySensor();
        proximitySensor->start();
    }
    if(rotationSensor == nullptr) {
        rotationSensor = new QRotationSensor();
        rotationSensor->start();
    }
    if(tiltSensor == nullptr) {
        tiltSensor = new QTiltSensor();
        tiltSensor->start();
    }
}

void AndroidSystemSensor::openSensor(Sensor::SensorType type){
    switch (type) {
    case Sensor::AcceleroMeter: {
        if(accelerMeter == nullptr ) {
            accelerMeter = new QAccelerometer();
            accelerMeter->start(); }
    } return;
    case Sensor::AmbientLightSensor: {
        if(ambientLightSensor == nullptr) {
            ambientLightSensor = new QAmbientLightSensor();
            ambientLightSensor->start();
        }
    } return;
    case Sensor::AmbientTemperatureSensor: {
        if(ambientTemperatureSensor == nullptr) {
            ambientTemperatureSensor = new QAmbientTemperatureSensor();
            ambientTemperatureSensor->start();
        }
    } return;
    case Sensor::Compass: {
        if(compass == nullptr) {
            compass = new QCompass();
            compass->start();
        }
    } return;
    case Sensor::Gyroscope: {
        if(gyroscope == nullptr) {
            gyroscope = new QGyroscope();
            gyroscope->start();
        }
    }return;
    case Sensor::OrientationSensor: {
        if(orientationSensor == nullptr) {
            orientationSensor = new QOrientationSensor();
            orientationSensor->start();
        }
    } return;
    case Sensor::HumiditySensor: {
        if(humiditySensor == nullptr) {
            humiditySensor = new QHumiditySensor();
            humiditySensor->start();
        }
    }return;
    case Sensor::LightSensor: {
       if(lightSensor == nullptr) {
           lightSensor = new QLightSensor();
           lightSensor->start();
       }
    }return;
    case Sensor::MagnetoMeter: {
         if(magnetoMeter == nullptr) {
             magnetoMeter = new QMagnetometer();
             magnetoMeter->start();
         }
    }return;
    case Sensor::PressureSensor: {
        if(pressureSensor == nullptr) {
            pressureSensor = new QPressureSensor();
            pressureSensor->start();
        }
    }return;
    case Sensor::ProximitySensor: {
        if(proximitySensor == nullptr) {
            proximitySensor = new QProximitySensor();
            proximitySensor->start();
        }
    }return;
    case Sensor::RotationSensor: {
        if(rotationSensor == nullptr) {
            rotationSensor = new QRotationSensor();
            rotationSensor->start();
        }
    }return;
    case Sensor::TiltSensor: {
        if(tiltSensor == nullptr) {
            tiltSensor = new QTiltSensor();
            tiltSensor->start();
        }
    } return;
    }
}

void AndroidSystemSensor::closeAllTypeSensor(){
    if(accelerMeter != nullptr) {
        accelerMeter->deleteLater();
        accelerMeter= nullptr;
    }
    if(ambientLightSensor != nullptr) {
        ambientLightSensor->deleteLater();
        ambientLightSensor = nullptr;
    }
    if(ambientTemperatureSensor != nullptr) {
        ambientTemperatureSensor->deleteLater();
        ambientTemperatureSensor = nullptr;
    }
    if(compass != nullptr) {
        compass->deleteLater();
        compass= nullptr;
    }
    if(gyroscope != nullptr) {
        gyroscope->deleteLater();
        gyroscope= nullptr;
    }
    if(orientationSensor != nullptr) {
        orientationSensor->deleteLater();
        orientationSensor=nullptr;
    }
    if(humiditySensor != nullptr) {
        humiditySensor->deleteLater();
        humiditySensor = nullptr;
    }
    if(lightSensor != nullptr) {
        lightSensor->deleteLater();
        lightSensor= nullptr;
    }
    if(magnetoMeter != nullptr) {
        magnetoMeter->deleteLater();
        magnetoMeter= nullptr;
    }
    if(pressureSensor != nullptr) {
        pressureSensor->deleteLater();
        pressureSensor = nullptr;
    }
    if(proximitySensor != nullptr) {
        proximitySensor->deleteLater();
        proximitySensor= nullptr;
    }
    if(rotationSensor != nullptr) {
        rotationSensor->deleteLater();
        rotationSensor= nullptr;
    }
    if(tiltSensor!=nullptr) {
        tiltSensor->deleteLater();
        tiltSensor=nullptr;
    }
}
void AndroidSystemSensor::closeSensor(Sensor::SensorType type){
    switch (type) {
    case Sensor::AcceleroMeter: {
        if(accelerMeter != nullptr) {
            accelerMeter->deleteLater();
            accelerMeter= nullptr;
        }
    } return;
    case Sensor::AmbientLightSensor: {
        if(ambientLightSensor != nullptr) {
            ambientLightSensor->deleteLater();
            ambientLightSensor = nullptr;
        }
    } return;
    case Sensor::AmbientTemperatureSensor: {
        if(ambientTemperatureSensor != nullptr) {
            ambientTemperatureSensor->deleteLater();
            ambientTemperatureSensor = nullptr;
        }
    } return;
    case Sensor::Compass: {
        if(compass != nullptr) {
            compass->deleteLater();
            compass= nullptr;
        }
    } return;
    case Sensor::Gyroscope: {
       if(gyroscope != nullptr) {
           gyroscope->deleteLater();
           gyroscope= nullptr;
       }
    }return;
    case Sensor::OrientationSensor: {
        if(orientationSensor != nullptr) {
            orientationSensor->deleteLater();
            orientationSensor=nullptr;
        }
    } return;
    case Sensor::HumiditySensor: {
        if(humiditySensor != nullptr) {
            humiditySensor->deleteLater();
            humiditySensor = nullptr;
        }
    }return;
    case Sensor::LightSensor: {
        if(lightSensor != nullptr) {
            lightSensor->deleteLater();
            lightSensor= nullptr;
        }
    }return;
    case Sensor::MagnetoMeter: {
         if(magnetoMeter != nullptr) {
             magnetoMeter->deleteLater();
             magnetoMeter= nullptr;
         }
    }return;
    case Sensor::PressureSensor: {
        if(pressureSensor == nullptr) {
            pressureSensor = new QPressureSensor();
            pressureSensor->start();
        }
    }return;
    case Sensor::ProximitySensor: {
        if(proximitySensor != nullptr) {
            proximitySensor->deleteLater();
            proximitySensor= nullptr;
        }
    }return;
    case Sensor::RotationSensor: {
        if(rotationSensor != nullptr) {
            rotationSensor->deleteLater();
            rotationSensor= nullptr;
        }
    }return;
    case Sensor::TiltSensor: {
        if(tiltSensor!=nullptr) {
            tiltSensor->deleteLater();
            tiltSensor=nullptr;
        }
    } return;
    }
}
QString AndroidSystemSensor::getDescription(Sensor::SensorType type){
    try {
        switch (type) {
        case Sensor::AcceleroMeter: return accelerMeter->description();
        case Sensor::AmbientLightSensor: return ambientLightSensor->description();
        case Sensor::AmbientTemperatureSensor: return ambientTemperatureSensor->description();
        case Sensor::Compass: return compass->description();
        case Sensor::Gyroscope: return gyroscope->description();
        case Sensor::OrientationSensor: return orientationSensor->description();
        case Sensor::HumiditySensor: return humiditySensor->description();
        case Sensor::LightSensor: return lightSensor->description();
        case Sensor::MagnetoMeter: return magnetoMeter->description();
        case Sensor::PressureSensor: return pressureSensor->description();
        case Sensor::ProximitySensor: return proximitySensor->description();
        case Sensor::RotationSensor:  return rotationSensor->description();
        case Sensor::TiltSensor: return tiltSensor->description();
        }
    } catch(...) {
         return "GetError";
    }
    return "UnknownError";
}
double AndroidSystemSensor::getAccelero(Sensor::AxisType type){
     if(accelerMeter== nullptr) return -1;
     QAccelerometerReading *reader = accelerMeter->reading();
     switch (type) {
     case Sensor::X: return reader->x();
     case Sensor::Y: return reader->y();
     case Sensor::Z: return reader->z();
     }
}
double AndroidSystemSensor::getGyroscope(Sensor::AxisType type){
    if(gyroscope == nullptr) return -1;
    QGyroscopeReading * reader = gyroscope->reading();
    switch (type) {
    case Sensor::X: return reader->x();
    case Sensor::Y: return reader->y();
    case Sensor::Z: return reader->z();
    }
}
double AndroidSystemSensor::getMagneto(Sensor::AxisType type){
    if(magnetoMeter == nullptr) return -1;
    QMagnetometerReading *reader = magnetoMeter->reading();
    switch (type) {
    case Sensor::X: return reader->x();
    case Sensor::Y: return reader->y();
    case Sensor::Z: return reader->z();
    }
}
double AndroidSystemSensor::getRotation(Sensor::AxisType type){
    if(rotationSensor == nullptr) return -1;
    QRotationReading *reader = rotationSensor->reading();
    switch (type) {
    case Sensor::X: return reader->x();
    case Sensor::Y: return reader->y();
    case Sensor::Z: return reader->z();
    }
}
double AndroidSystemSensor::getAmbientTemperature(){
    if(ambientTemperatureSensor == nullptr) return -1;
    QAmbientTemperatureReading *reader = ambientTemperatureSensor->reading();
    return reader->temperature();
}
double AndroidSystemSensor::getCompass(){
    if(compass == nullptr) return -1;
    QCompassReading *reading = compass->reading();
    return reading->azimuth();
}
double AndroidSystemSensor::getHumidity(){
    if(humiditySensor == nullptr) return -1;
    QHumidityReading *reader = humiditySensor->reading();
    return reader->relativeHumidity();
}
double AndroidSystemSensor::getLight(){
    if(lightSensor == nullptr) return-1;
    QLightReading *reader = lightSensor->reading();
    return reader->lux();
}
double AndroidSystemSensor::getPressure(){
    if(pressureSensor == nullptr) return-1;
    QPressureReading *reader = pressureSensor->reading();
    return reader->pressure();
}
int AndroidSystemSensor::getProximity(){
    if(proximitySensor == nullptr) return -1;
    QProximityReading *reader = proximitySensor->reading();
    return reader->close() ? 0 : 1;
}
int AndroidSystemSensor::getBattery(){
    return QJniObject::callStaticMethod<jint>(
                        "io/kanbuki/qtcube/android/corex/AndroidSystemSensor",
                        "getBattery",
                         "(Landroid/content/Context;)I",
                         QtAndroidPrivate::context());
}
