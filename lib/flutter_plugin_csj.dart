import 'dart:async';

import 'package:flutter/services.dart';

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




abstract class CSJEventHandler {
  final Function(CSJEvents, Map<String, dynamic>) _listener;

  CSJEventHandler(Function(CSJEvents, Map<String, dynamic>) listener) : _listener = listener;

  Future<dynamic> handleEvent(MethodCall call) async {
    switch (call.method) {
      case 'didSuccess':
        _listener(CSJEvents.didSuccess, null);
        break;
      case 'didFail':
        _listener(CSJEvents.didFail, null);
        break;
      case 'loadSuccess':
        _listener(CSJEvents.loadSuccess, null);
        break;
      case 'playStart':
        _listener(CSJEvents.playStart, null);
        break;
      case 'playEnd':
        _listener(CSJEvents.playEnd, null);
        break;
      case 'clicked':
        _listener(CSJEvents.clicked, null);
        break;
      case 'didError':
        _listener(CSJEvents.didError, null);
        break;
      case 'playError':
        _listener(CSJEvents.playError, null);
        break;
      case 'onAdClose':
        _listener(CSJEvents.onAdClose, null);
        break;
    }

    return null;
  }

}

enum CSJEvents {
  didSuccess,  // 有广告返回
  didFail, // 无广告返回
  loadSuccess, // 广告加载成功
  playStart, // 广告开始播放
  playEnd, // 广告播放完毕
  clicked, // 广告发生点击
  didError, // 广告发生错误
  playError, // 播放时发生错误
  onAdClose, // 广告播放完毕并点击了关闭按钮
}
