import 'package:flutter/services.dart';
import 'package:flutter_plugin_csj/csj_event_handler.dart';
export 'package:flutter_plugin_csj/csj_event_handler.dart';

class FlutterPluginCsj extends CSJEventHandler {
  static const MethodChannel _channel =
  const MethodChannel('flutter_plugin_csj');


  final void Function(CSJEvents, Map<String, dynamic>) listener;

  FlutterPluginCsj({
    this.listener
  }): super(listener) {
    if (listener != null) {
      _channel.setMethodCallHandler(handleEvent);
    }
  }

  static void init(String appId) async{
    await _channel.invokeMethod('init', appId);
  }
  void loadVideo(String codeId) async{
    await _channel.invokeMethod('loadVideo', codeId);
  }
  void showVideo() async{
    await _channel.invokeMethod('showVideo');
  }

}



