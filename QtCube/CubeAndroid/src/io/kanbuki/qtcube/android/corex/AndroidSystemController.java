package io.kanbuki.qtcube.android.corex;

import android.app.Activity;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraManager;
import android.os.Vibrator;
import android.os.BatteryManager;
import android.provider.Settings;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;

public class AndroidSystemController {
    public static void setFlashlight(Activity activity, boolean flag){
        CameraManager manager = (CameraManager) activity.getSystemService(Activity.CAMERA_SERVICE);
        try {
            manager.setTorchMode("0", flag);
        } catch(CameraAccessException e){
           e.printStackTrace();
        }
    }
     public static void setVibrator(Activity activity, int value){
        Vibrator vibrator = (Vibrator) activity.getSystemService(Activity.VIBRATOR_SERVICE);
        vibrator.vibrate(value);
    }
    public static void setVibrator(Activity activity, long[] pattern, int repeat){
        Vibrator vibrator = (Vibrator) activity.getSystemService(Activity.VIBRATOR_SERVICE);
        vibrator.vibrate(pattern, repeat);
    }
    public static void cancelVibrator(Activity activity){
        Vibrator vibrator = (Vibrator) activity.getSystemService(Activity.VIBRATOR_SERVICE);
        vibrator.cancel();
    }
    public static void setWindowBrightness(Activity activity, float brightness) {
        WindowManager.LayoutParams lp = activity.getWindow().getAttributes();
        lp.screenBrightness = brightness/255f;
        activity.getWindow().setAttributes(lp);
    }
    public static int getSystemBrightness(Activity activity){
        try {
            return Settings.System.getInt(activity.getContentResolver(), Settings.System.SCREEN_BRIGHTNESS);
        } catch (Settings.SettingNotFoundException e) {
            e.printStackTrace();
            return -1;
        }
    }
}
