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

  /// A image stream of the camera, available when initAsync completed.
  Stream<CameraFrame> get stream;

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
  Stream<CameraFrame> get stream =>
      event.receiveBroadcastStream().map((e) => CameraFrame.fromNative(e));

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

/// A frame of a live camera.
class CameraFrame {
  /// A list of bytes of the image.
  final Uint8List bytes;

  /// Metadata of the image.
  final CameraFrameMetadata metadata;

  /// Create a [CameraFrame] from native data.
  CameraFrame.fromNative(Map<dynamic, dynamic> data)
      : bytes = data['bytes'],
        metadata = CameraFrameMetadata.fromNative(data);
}

/// Metadata of a [CameraFrame].
class CameraFrameMetadata {
  /// Size of the image in pixels.
  final Size size;

  /// Raw version of the format from the iOS platform.
  ///
  /// Since iOS can use any planar format, this format will be used to create
  /// the image buffer on iOS.
  ///
  /// On iOS, this is a `FourCharCode` constant from Pixel Format Identifiers.
  /// See https://developer.apple.com/documentation/corevideo/1563591-pixel_format_identifiers?language=objc
  ///
  /// Not used on Android.
  final int format;

  /// Rotation of the image for Android.
  ///
  /// Not currently used on iOS.
  final int rotation;

  /// The plane attributes to create the image buffer on iOS.
  ///
  /// Not used on Android.
  final List<CameraPlaneMetadata> planes;

  /// Create a [CameraFrameMetadata] from native data.
  CameraFrameMetadata.fromNative(Map<dynamic, dynamic> data)
      : size = toSize(data['size']),
        format = data['format'],
        rotation = data['rotation'],
        planes = toPlanes(data['metadata']);
}

/// Plane attributes to create image buffer on iOS
class CameraPlaneMetadata {
  /// The row stride for this color plane, in bytes.
  final int rowStride;

  /// Height of the pixel buffer on iOS.
  final int width;

  /// Width of the pixel buffer on iOS.
  final int height;

  /// Create a [CameraPlaneMetadata] from native data.
  CameraPlaneMetadata.fromNative(Map<dynamic, dynamic> data)
      : rowStride = data['rowStride'],
        width = data['width'],
        height = data['height'];
}
