#pragma once

#include <QObject>
#include <QJniObject>
#include <android/bitmap.h>

struct NotificationProgressBar{
    Q_GADGET
    Q_PROPERTY(int max MEMBER max)
    Q_PROPERTY(int value MEMBER value)
    Q_PROPERTY(bool indeterminate MEMBER indeterminate)
public:
    int max = 100;
    int value = 0;
    bool indeterminate = false;
};Q_DECLARE_METATYPE(NotificationProgressBar)

struct NotificationChannel{
    Q_GADGET
public:
    QString name;

};Q_DECLARE_METATYPE(NotificationChannel)

class AndroidNotification : public QObject
{
    Q_PROPERTY(int instanceID READ getInstanceID)
    Q_PROPERTY(bool flagAutoCancel READ getAutoCancel WRITE setAutoCancel)
    Q_PROPERTY(bool flagWhen READ getWhen WRITE setWhen)
    Q_PROPERTY(QString channelName READ getChannelName WRITE setChannelName)
    Q_PROPERTY(QString contentTitle READ getContentTitle WRITE setContentTitle)
    Q_PROPERTY(QString contentText READ getContentText WRITE setContentText)
    Q_PROPERTY(QString smallIconR READ getSmallIconR WRITE setSmallIconR)
    Q_PROPERTY(QString largeIconR READ getLargeIconR WRITE setLargeIconR)
    Q_PROPERTY(QString largeIconP READ getLargeIconP WRITE setLargeIconP)
    Q_PROPERTY(QString ticker READ getTicker WRITE setTicker)
    Q_PROPERTY(QString bigText READ getBigTextStyle WRITE setBigTextStyle)
    Q_PROPERTY(NotificationProgressBar progressBar READ getProgress WRITE setProgress)
    Q_OBJECT
public:
    explicit AndroidNotification(QObject *parent = nullptr);

    const int& getInstanceID() const;
    const bool& getAutoCancel() const;
    void setAutoCancel(const bool&value);
    const bool& getWhen() const;
    void setWhen(const bool &value);
    const QString& getChannelName() const;
    void setChannelName(const QString &channelname);
    const QString& getContentTitle() const;
    void setContentTitle(const QString &contenttitle);
    const QString& getContentText() const;
    void setContentText(const QString &contenttext);
    const QString& getSmallIconR() const;
    void setSmallIconR(const QString &smallIcon);
    const QString& getLargeIconR() const;
    void setLargeIconR(const QString &largeIcon);
    const QString& getLargeIconP() const;
    void setLargeIconP(const QString &largeIcon);
    const QString& getTicker() const;
    void setTicker(const QString &tickertext);
    const QString& getBigTextStyle() const;
    void setBigTextStyle(const QString &bigtext);
    const NotificationProgressBar& getProgress();
    void setProgress(const NotificationProgressBar &progressBar);

    Q_INVOKABLE void startNotify();
    Q_INVOKABLE void cancelNotify();
    Q_INVOKABLE void deleteChannel();
private:
    const int instanceID;
    bool flagAutoCancel;
    bool flagWhen;
    QString channelName;
    QString contentTitle;
    QString contentText;
    QString smallIconR;
    QString largeIconR;
    QString largeIconP;
    QString ticker;
    QString bigText;
    NotificationProgressBar progressBar;
    QJniObject jni_Notification;
};
