import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class InputImage {
  InputImage.impl();

  factory InputImage.fromFilePath(Uri imageUri) =>
      CameraXPlugin.instance.$InputImage$fromFilePath(imageUri);

  Future<int> getWidth();
  Future<int> getHeight();
}
