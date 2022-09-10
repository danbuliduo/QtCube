#include "AndroidSystemController.h"
#include <QtCore/private/qandroidextras_p.h>

AndroidSystemController::AndroidSystemController(QObject *parent)
    : QObject{parent} {}

QObject* AndroidSystemController::qmlInstance(QQmlEngine *QEngine, QJSEngine *JEngine){
    Q_UNUSED(QEngine);
    Q_UNUSED(JEngine);
    AndroidSystemController *staticCube = new AndroidSystemController();
    return staticCube;
}

void AndroidSystemController::setWindowBrightness(const float &value){
    QNativeInterface::QAndroidApplication::runOnAndroidMainThread([=]{
        QJniObject::callStaticMethod<void>(
                    "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                    "setWindowBrightness",
                    "(Landroid/app/Activity;F)V",
                     QtAndroidPrivate::activity(),
                     value);
    });
}
int AndroidSystemController::getSystemBrightness(){
    return QJniObject::callStaticMethod<int>(
                "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                "getSystemBrightness",
                "(Landroid/app/Activity;)I",
                 QtAndroidPrivate::activity());
}
void AndroidSystemController::setFlashlight(const bool &flag){
    QNativeInterface::QAndroidApplication::runOnAndroidMainThread([=]{
        QJniObject::callStaticMethod<void>(
                    "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                    "setFlashlight",
                    "(Landroid/app/Activity;Z)V",
                     QtAndroidPrivate::activity(),
                     flag);
    });
}
void AndroidSystemController::setVibrator(int value){
    QJniObject::callStaticMethod<void>(
                "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                "setVibrator",
                "(Landroid/app/Activity;I)V",
                 QtAndroidPrivate::activity(),
                 value);
}

void AndroidSystemController::setVibrator(QVariantList varlist, int repeat){
    int len =varlist.length();
    jlong b[len];
    for(int i=0;i<len;i++) b[i] = varlist.at(0).toInt();
    jlongArray pattern = env->NewLongArray(len);
    env->SetLongArrayRegion(pattern, 0, len, b);
    QJniObject::callStaticMethod<void>(
                "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                "setVibrator",
                "(Landroid/app/Activity;[JI)V",
                 QtAndroidPrivate::activity(),
                 pattern, repeat);
    env->DeleteLocalRef(pattern);
}

void AndroidSystemController::cancelVibrator(){
    QJniObject::callStaticMethod<void>(
                "io/kanbuki/qtcube/android/corex/AndroidSystemController",
                "cancelVibrator",
                "(Landroid/app/Activity;)V",
                 QtAndroidPrivate::activity());
}
