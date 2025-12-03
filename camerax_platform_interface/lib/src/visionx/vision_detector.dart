import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'vision_image.dart';
import 'vision_object.dart';

abstract base class VisionDetector {
  VisionDetector.impl();

  factory VisionDetector({List<VisionObjectType>? types}) =>
      CameraXPlugin.instance.$VisionDetector(types: types);

  Future<List<VisionObject>> detect(VisionImage image);
}
