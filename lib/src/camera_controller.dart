import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A camera controller.
abstract class CameraController {
  /// A camera preview widget.
  Widget get view;

  /// Resolution of the camera, available when initAsync completed.
  Size get resolution;

  /// A image stream of the camera, available when initAsync completed.
  Stream<CameraImage> get stream;

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

  final CameraFacing facing;

  int textureId;
  @override
  Size resolution;

  @override
  Widget get view => Texture(textureId: textureId);
  @override
  Stream<CameraImage> get stream => event
      .receiveBroadcastStream()
      .map((data) => CameraImage.fromNative(data));

  _CameraController(this.facing);

  @override
  Future<void> initAsync() async {
    final answer =
        await method.invokeMapMethod<String, dynamic>('init', '$facing');
    textureId = answer['textureId'] as int;
    final width = answer['width'] as double;
    final height = answer['height'] as double;
    resolution = Size(width, height);
  }

  @override
  void dispose() {
    method.invokeMethod('dispose');
  }
}

/// The facing of a camera.
enum CameraFacing {
  /// Front facing camera.
  front,

  /// Back facing camera.
  back,
}

/// A image of a camera with raw data.
class CameraImage {
  /// The pixels planes of this image.
  final List<Plane> planes;

  /// The [ImageFormat] of this image.
  final int format;

  /// The width of this image in pixels.
  final int width;

  /// The height of this image in pixels.
  final int height;

  /// The rotation of this image.
  final int rotation;

  /// Create a [CameraImage] from native channel.
  CameraImage.fromNative(Map<dynamic, dynamic> data)
      : planes = List.unmodifiable(
            (data['planes'] as List).map((data) => Plane.fromNative(data))),
        format = data['format'],
        width = data['width'],
        height = data['height'],
        rotation = data['rotation'];
}

/// A single color plane of a [CameraImage].
class Plane {
  /// The byte array of this plane.
  final Uint8List bytes;

  /// The row stride of this plane.
  final int rowStride;

  /// The pixel stride of this plane.
  final int pixelStride;

  /// Create a [Plane] from native channel.
  Plane.fromNative(Map<dynamic, dynamic> data)
      : bytes = data['bytes'] as Uint8List,
        rowStride = data['rowStride'] as int,
        pixelStride = data['pixelStride'] as int;
}

/// The format of a [CameraImage], A copy from Android.
class ImageFormat {
  static const UNKNOWN = 0;
  static const RGB_565 = 4;
  static const YV12 = 0x32315659;
  static const Y8 = 0x20203859;
  static const Y16 = 0x20363159;
  static const NV16 = 0x10;
  static const NV21 = 0x11;
  static const YUY2 = 0x14;
  static const JPEG = 0x100;
  static const DEPTH_JPEG = 0x69656963;
  static const YUV_420_888 = 0x23;
  static const YUV_422_888 = 0x27;
  static const YUV_444_888 = 0x28;
  static const FLEX_RGB_888 = 0x29;
  static const FLEX_RGBA_8888 = 0x2A;
  static const RAW_SENSOR = 0x20;
  static const RAW_PRIVATE = 0x24;
  static const RAW10 = 0x25;
  static const RAW12 = 0x26;
  static const DEPTH16 = 0x44363159;
  static const DEPTH_POINT_CLOUD = 0x101;
  static const RAW_DEPTH = 0x1002;
  static const PRIVATE = 0x22;
  static const HEIC = 0x48454946;
}
