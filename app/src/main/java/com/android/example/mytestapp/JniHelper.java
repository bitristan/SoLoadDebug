package com.android.example.mytestapp;

import android.util.Log;

public class JniHelper {
    static {
        System.loadLibrary("mytest");
    }

    public static void init() {
        Log.d(TestApplication.TAG, "jni init." + sayHello());
    }

    public static native String sayHello();
}
