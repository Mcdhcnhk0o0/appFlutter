package com.example.base;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

public class NativeSpHelper {

    private static final String SP_NAME = "main_sp";

    private Context application;

    private static NativeSpHelper instance = new NativeSpHelper();

    public static NativeSpHelper with(Context application) {
        instance.application = application;
        return instance;
    }

    public SharedPreferences getSharedPreferences() {
        if (application == null) {
            throw new IllegalStateException("with application is required");
        }
        return application.getSharedPreferences(SP_NAME, Context.MODE_PRIVATE);
    }

    public String getToken() {
        return getSharedPreferences().getString("cached_user_token", "");
    }

    public String getUserId() {
        return getSharedPreferences().getString("cached_user_id", "");
    }

    public String getLocalIP() {
        return getSharedPreferences().getString("local_ip_key", "");
    }

    public String getRemoteIP() {
        return getSharedPreferences().getString("remote_ip_key", "");
    }

    public String getBaseUrlSetting() {
        return getSharedPreferences().getString("base_url_setting", "release");
    }

}
