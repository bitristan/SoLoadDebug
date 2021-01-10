package com.android.example.mytestapp;

import android.app.Application;
import android.util.Log;

public class TestApplication extends Application {
    public static final String TAG = "TestApplication";

    @Override
    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "onCreate");
        JniHelper.init();
    }
}
