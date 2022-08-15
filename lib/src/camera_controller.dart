import 'dart:async';

import 'camera_implementation.dart';
import 'camera_selector.dart';
import 'camera_value.dart';
import 'image_proxy.dart';

abstract class CameraController {
  factory CameraController(CameraSelector selector) =>
      $CameraController(selector);

  Stream<ImageProxy> get imageStream;

  Future<bool> requestPermission();
  Future<CameraValue> bind();
  Future<void> unbind();
  Future<void> torch(bool state);
  Future<void> zoom(double value);
  Future<void> linearZoom(double value);
  Future<void> focusAutomatically();
  Future<void> focusManually(double width, double height, double x, double y);
  Future<ImageProxy> captureToMemory();
  // Future<void> captureToFile(String filePath);
}
