import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginCsj {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_csj');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    _channel.setMethodCallHandler(handler);
    return version;
  }

  static void init(String appId) async{
    await _channel.invokeMethod('init', appId);
  }
  static void loadVideo(String codeId) async{
    await _channel.invokeMethod('loadVideo', codeId);
  }
  static Function(MethodCall call) cf;
  static void showVideo(Function(MethodCall call) c) async{
    cf = c;
    await _channel.invokeMethod('showVideo', '938904444');
  }

  static Future<dynamic> handler(MethodCall methodCall) {
    if(cf!=null){
      cf(methodCall);
    }
    print('_handler-->'+methodCall.method);
    if ("onClose" == methodCall.method) {
      print('222222222222222');
    }
    return Future.value(true);
  }
}
