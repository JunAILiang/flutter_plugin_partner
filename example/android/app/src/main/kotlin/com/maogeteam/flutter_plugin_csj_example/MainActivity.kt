package com.maogeteam.flutter_plugin_csj_example

import android.os.Bundle
import com.maogeteam.flutter_plugin_csj.ADUtil

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    ADUtil.setContext(this)
    GeneratedPluginRegistrant.registerWith(this)
  }
}
