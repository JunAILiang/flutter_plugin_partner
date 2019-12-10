package com.maogeteam.flutter_plugin_csj

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterPluginCsjPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      ADUtil.channel = MethodChannel(registrar.messenger(), "flutter_plugin_csj")
      ADUtil.channel.setMethodCallHandler(FlutterPluginCsjPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "init"){
      ADUtil.init(call.arguments as String)
    } else if(call.method == "loadVideo"){
      ADUtil.loadVideo(call.arguments as String)
    } else if(call.method == "showVideo"){
      ADUtil.showVideo()
    } else {
      result.notImplemented()
    }
  }
}
