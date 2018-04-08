package com.dynamicloaddemo;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.github.lzyzsd.jsbridge.BridgeHandler;
import com.github.lzyzsd.jsbridge.BridgeWebView;
import com.github.lzyzsd.jsbridge.CallBackFunction;

public class WebViewActivity extends AppCompatActivity implements View.OnClickListener {

    BridgeWebView webView;

    Button button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web_view);
        webView = (BridgeWebView) findViewById(R.id.webView);

        button = (Button) findViewById(R.id.button);

        button.setOnClickListener(this);

        webView.loadUrl("file:///android_asset/index.html");

        webView.registerHandler("testObjcCallback", new BridgeHandler() {

            @Override
            public void handler(String data, CallBackFunction function) {
                Log.i("HaysLog", "testObjcCallback called: " + data);
                function.onCallBack("Response from testObjcCallback");
            }

        });

        webView.callHandler("testJavascriptHandler", "{\"foo\": \"before ready!!\"}", new CallBackFunction() {
            @Override
            public void onCallBack(String data) {

            }
        });
    }

    @Override
    protected void onPause() {
        super.onPause();
        webView.onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        webView.onResume();
    }

    @Override
    public void onClick(View v) {
        if (button.equals(v)) {

            webView.callHandler("testJavascriptHandler", "{ \"greetingFromObjC\": \"Hi there, JS!\" }", new CallBackFunction() {
                @Override
                public void onCallBack(String data) {
                    Log.i("HaysLog", "testJavascriptHandler responded: " + data);
                }

            });
        }

    }
}
