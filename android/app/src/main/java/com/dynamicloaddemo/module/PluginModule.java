package com.dynamicloaddemo.module;

import android.content.Intent;
import android.util.Log;

import com.dynamicloaddemo.RNFuncActivity;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

/**
 * @author Hays
 * @date 29/03/2018
 */
public class PluginModule extends ReactContextBaseJavaModule {
    public PluginModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "PluginModule";
    }

    @ReactMethod
    public void openPlugin1() {
        Log.i("HaysLog", "test by Hays open plugin 1.");
        Intent intent = new Intent(getReactApplicationContext(), RNFuncActivity.class);
        intent.putExtra("bundleJS", "assets://plugin1.android.jsbundle");
        intent.putExtra("module", "plugin1");
        getReactApplicationContext().startActivity(intent);
    }

    @ReactMethod
    public void openPlugin2() {
        Log.i("HaysLog", "test by Hays open plugin 2.");
        Intent intent = new Intent(getReactApplicationContext(), RNFuncActivity.class);
        intent.putExtra("bundleJS", "assets://plugin2.android.jsbundle");
        intent.putExtra("module", "plugin2");
        getReactApplicationContext().startActivity(intent);
    }
}
