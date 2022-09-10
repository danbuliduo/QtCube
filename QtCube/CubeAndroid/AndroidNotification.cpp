#include "AndroidNotification.h"
#include <CubeAndroid/CubeAndroidTools.h>
#include <QtCore/private/qandroidextras_p.h>

static int instancesCount = 0;

AndroidNotification::AndroidNotification(QObject *parent) :
 QObject{parent}, instanceID(instancesCount++){
    jni_Notification=QJniObject(
                "io/kanbuki/qtcube/android/corex/AndroidNotification",
                "(Landroid/app/Activity;I)V",
                QtAndroidPrivate::activity(),
                instanceID);
}
void AndroidNotification::startNotify(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("startNotify","()V");
    }
}
void AndroidNotification::cancelNotify(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("cancelNotify","()V");
    }
}
void AndroidNotification::deleteChannel(){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("deleteNotificationChannel","()V");
    }
}
const int & AndroidNotification::getInstanceID() const {
    return instanceID;
}
const bool & AndroidNotification::getAutoCancel() const {
    return flagAutoCancel;
}
void AndroidNotification::setAutoCancel(const bool &value) {
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("setAutoCancel","(Z)V",value);
        flagAutoCancel = value;
    }
}
const bool & AndroidNotification::getWhen() const{
    return flagWhen;
}
void AndroidNotification::setWhen(const bool &value){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>("setWhen","(Z)V",value);
        flagWhen = value;
    }
}
const QString& AndroidNotification::getChannelName() const {
    return channelName;
}
void AndroidNotification::setChannelName(const QString &channelname){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "createNotificationChannel",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(channelname).object<jstring>());
        channelName = channelname;
    }
}
const QString& AndroidNotification::getContentTitle() const {
    return contentTitle;
}
void AndroidNotification::setContentTitle(const QString &contenttitle){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setContentTitle",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(contenttitle).object<jstring>());
        contentTitle = contenttitle;
    }
}
const QString& AndroidNotification::getContentText() const {
    return contentText;
}
void AndroidNotification::setContentText(const QString &contenttext){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setContentText",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(contenttext).object<jstring>());
        contentText = contenttext;
    }
}
const QString& AndroidNotification::getSmallIconR() const {
    return smallIconR;
}
void AndroidNotification::setSmallIconR(const QString &smallIcon){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setSmallIcon",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(smallIcon).object<jstring>());
        smallIconR = smallIcon;
    }
}
const QString& AndroidNotification::getLargeIconR() const {
    return largeIconR;
}
void AndroidNotification::setLargeIconR(const QString &largeIcon){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setLargeIcon",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(largeIcon).object<jstring>());
        largeIconR = largeIcon;
    }
}
const QString& AndroidNotification::getLargeIconP() const{
    return largeIconP;
}
void AndroidNotification::setLargeIconP(const QString &largeIcon){
    if(jni_Notification.isValid()){
        const QImage Image((largeIcon.length() > 5 && largeIcon.left(5) == "qrc:/")
                           ? largeIcon.right(largeIcon.length() - 3) : largeIcon);
        const QJniObject androidBitmap = imageToAndroidBitmap(Image);
        jni_Notification.callMethod<void>(
                    "setLargeIcon",
                     "(Landroid/graphics/Bitmap;)V",
                      androidBitmap.object());
        largeIconP = largeIcon;
    }
}
const QString& AndroidNotification::getTicker() const {
    return ticker;
}
void AndroidNotification::setTicker(const QString &tickertext ){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setTicker",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(tickertext).object<jstring>());
        ticker = tickertext;
    }
}
const QString& AndroidNotification::getBigTextStyle() const {
    return bigText;
}
void AndroidNotification::setBigTextStyle(const QString &bigtext ){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setStyle",
                    "(Ljava/lang/String;)V",
                    QJniObject::fromString(bigtext).object<jstring>());
        bigText = bigtext;
    }
}
const NotificationProgressBar& AndroidNotification::getProgress(){
    return progressBar;
}
void AndroidNotification::setProgress(const NotificationProgressBar &progressbar){
    if(jni_Notification.isValid()){
        jni_Notification.callMethod<void>(
                    "setProgress",
                    "(IIZ)V",
                    progressbar.max,
                    progressbar.value,
                    progressbar.indeterminate);
        progressBar = progressbar;
    }
}
