import 'package:flutter/services.dart';

class VoiceChangerPlugin {
  static const MethodChannel _channel = MethodChannel('voice_changer_plugin');

  static Future<void> startVoiceChanger() async {
    try {
      await _channel.invokeMethod('startVoiceChanger');
    } on PlatformException catch (e) {
      print("Failed to start voice changer: '${e.message}'.");
    }
  }

  static Future<void> stopVoiceChanger() async {
    try {
      await _channel.invokeMethod('stopVoiceChanger');
    } on PlatformException catch (e) {
      print("Failed to stop voice changer: '${e.message}'.");
    }
  }

  static Future<void> setPitch(double pitch) async {
    try {
      await _channel.invokeMethod('setPitch', {'pitch': pitch});
    } on PlatformException catch (e) {
      print("Failed to set pitch: '${e.message}'.");
    }
  }
}
