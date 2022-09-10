package io.kanbuki.qtcube.android.corex;

import android.content.Context;
import android.os.BatteryManager;

public class AndroidSystemSensor{
    public static int getBattery(Context context){
        BatteryManager manager = (BatteryManager) context.getSystemService(Context.BATTERY_SERVICE);
        return manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    }
}
