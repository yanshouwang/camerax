import 'dart:async';

import 'package:flutter/services.dart';

class Camerax {
  static const MethodChannel _channel = MethodChannel('camerax');

  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
