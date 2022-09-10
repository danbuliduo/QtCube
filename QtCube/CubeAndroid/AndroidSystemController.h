#pragma once

#include <QObject>
#include <QJniObject>
#include <QQmlEngine>

class AndroidSystemController : public QObject
{
    Q_OBJECT
public:
    explicit AndroidSystemController(QObject *parent = nullptr);
    static QObject* qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
    Q_INVOKABLE void setFlashlight(const bool &flag);
    Q_INVOKABLE void setVibrator(int value = 200 );
    Q_INVOKABLE void setVibrator(QVariantList pattern , int repeat =-1);
    Q_INVOKABLE void cancelVibrator();
    Q_INVOKABLE void setWindowBrightness(const float &value);
    Q_INVOKABLE int getSystemBrightness();
private:
        QJniEnvironment env;
};
