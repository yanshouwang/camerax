import 'dart:typed_data';

import 'package:camerax/src/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A camera controller.
abstract class CameraController {
  /// A camera preview widget.
  Widget get view;

  /// Resolution of the camera, available when initAsync completed.
  Size get resolution;

  /// A barcode stream, available when initAsync completed.
  Stream<Barcode> get barcodes;

  /// Create a camera controller with [CameraFacing]
  factory CameraController(CameraFacing facing) => _CameraController(facing);

  /// Initialize the camera asynchronously.
  Future<void> initAsync();

  /// Release the resources of the camera.
  void dispose();
}

class _CameraController implements CameraController {
  static const MethodChannel method =
      MethodChannel('yanshouwang.dev/camerax/method');
  static const EventChannel event =
      EventChannel('yanshouwang.dev/camerax/event');

  static const not_determined = 0;
  static const authorized = 1;
  static const denied = 2;

  final CameraFacing facing;

  int textureId;
  @override
  Size resolution;

  @override
  Widget get view => Texture(textureId: textureId);
  @override
  Stream<Barcode> get barcodes =>
      event.receiveBroadcastStream().map((e) => Barcode.fromNative(e));

  _CameraController(this.facing);

  @override
  Future<void> initAsync() async {
    var state = await method.invokeMethod('state');
    if (state == not_determined) {
      final result = await method.invokeMethod('request');
      state = result ? authorized : denied;
    }
    if (state != authorized) {
      throw PlatformException(code: 'NO ACCESS');
    }
    final answer = await method
        .invokeMapMethod<String, dynamic>('init', [hashCode, facing.index]);
    textureId = answer['textureId'];
    final width = answer['width'];
    final height = answer['height'];
    resolution = Size(width, height);
  }

  @override
  void dispose() {
    method.invokeMethod('dispose', hashCode);
  }
}

/// The facing of a camera.
enum CameraFacing {
  /// Front facing camera.
  front,

  /// Back facing camera.
  back,
}

class Barcode {
  final List<Offset> corners;
  final int format;
  final Uint8List rawBytes;
  final String rawValue;
  final int type;

  Barcode.fromNative(Map<dynamic, dynamic> data)
      : corners = toCorners(data['corners']),
        format = data['format'],
        rawBytes = data['rawBytes'],
        rawValue = data['rawValue'],
        type = data['type'];
}
