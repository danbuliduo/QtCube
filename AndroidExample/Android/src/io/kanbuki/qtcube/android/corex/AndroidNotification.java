package io.kanbuki.qtcube.android.corex;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.BitmapFactory;
import android.os.Build;

public class AndroidNotification {
    private Notification.Builder m_NotificationBuilder;
    private NotificationManager m_NotificationManager;
    private final int INSTANCE_ID;
    private final String NOTIFICATION_CHANNEL_ID;
    private final Activity ActivityInstance;

    public AndroidNotification(Activity activity, int instanceID){
        ActivityInstance = activity;
        INSTANCE_ID = instanceID;
        NOTIFICATION_CHANNEL_ID = (activity.getClass().getName() + Integer.toString(instanceID));
        m_NotificationManager = (NotificationManager) activity.getSystemService(activity.NOTIFICATION_SERVICE);
        m_NotificationBuilder = new  Notification.Builder(activity, NOTIFICATION_CHANNEL_ID);
        PendingIntent pendingIntent = PendingIntent.getActivity(activity, instanceID,
                new Intent(activity, activity.getClass()), PendingIntent.FLAG_UPDATE_CURRENT);
        m_NotificationBuilder.setContentIntent(pendingIntent)
                             .setOnlyAlertOnce(true)
                             .setAutoCancel(true);
    }
    public void createNotificationChannel(String channelName){
        NotificationChannel channel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_DEFAULT);
        channel.enableVibration(true);
        m_NotificationManager.createNotificationChannel(channel);
    }
    public void deleteNotificationChannel(){
        m_NotificationManager.deleteNotificationChannel(NOTIFICATION_CHANNEL_ID);
    }
    public void setAutoCancel(boolean value){
        m_NotificationBuilder.setAutoCancel(value);
    }
    public void setContentTitle(String title){
        m_NotificationBuilder.setContentTitle(title);
    }
    public void setContentText(String text){
        m_NotificationBuilder.setContentText(text);
    }
    public void setSmallIcon(String smallIcon){
        String packageName = ActivityInstance.getPackageName();
        Resources resources = ActivityInstance.getResources();
        int smallIconResourceId = resources.getIdentifier(smallIcon,"drawable", packageName);
        m_NotificationBuilder.setSmallIcon(smallIconResourceId);
    }
    public void setLargeIcon(String largeIcon){
        String packageName = ActivityInstance.getPackageName();
        Resources resources = ActivityInstance.getResources();
        int largeIconResourceId = resources.getIdentifier(largeIcon,"drawable", packageName);
        Bitmap icon = BitmapFactory.decodeResource(resources, largeIconResourceId);
        m_NotificationBuilder.setLargeIcon(icon);
    }
    public void setLargeIcon(Bitmap largeIcon){
        m_NotificationBuilder.setLargeIcon(largeIcon);
    }
    public void setTicker(String text){
        m_NotificationBuilder.setTicker(text);
    }
    public void setWhen(boolean value){
        m_NotificationBuilder.setShowWhen(value);
        m_NotificationBuilder.setWhen(System.currentTimeMillis());
    }
    public void setProgress(int max, int value, boolean indeterminate){
        m_NotificationBuilder.setProgress(max, value, indeterminate);
    }
    public void setStyle(String text){
        m_NotificationBuilder.setStyle(new Notification.BigTextStyle().bigText(text));
    }
    public void startNotify(){
        m_NotificationBuilder.setDefaults(Notification.DEFAULT_ALL);
        m_NotificationBuilder.setPriority(Notification.PRIORITY_DEFAULT);
        m_NotificationManager.notify(INSTANCE_ID, m_NotificationBuilder.build());
    }
    public void cancelNotify(){
        m_NotificationManager.cancel(INSTANCE_ID);
    }
}
