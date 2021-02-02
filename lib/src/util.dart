import 'package:flutter/material.dart';

import 'camera_controller.dart';

Size toSize(Map<dynamic, dynamic> data) {
  final width = data['width'];
  final height = data['height'];
  return Size(width, height);
}

List<CameraPlaneMetadata> toPlanes(List<dynamic> data) {
  return data?.map((e) => CameraPlaneMetadata.fromNative(e))?.toList() ?? [];
}
