import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class VisionImage {
  VisionImage.impl();

  factory VisionImage.uri(Uri uri) =>
      CameraXPlugin.instance.$VisionImage$uri(uri);

  factory VisionImage.file(File file) =>
      CameraXPlugin.instance.$VisionImage$file(file);
}
