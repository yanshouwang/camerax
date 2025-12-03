import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'vn_request.dart';

abstract base class VNImageRequestHandler {
  VNImageRequestHandler.impl();

  factory VNImageRequestHandler.uri(Uri uri) =>
      CameraXPlugin.instance.$VNImageRequestHandler$uri(uri);

  Future<void> perform(List<VNRequest> requests);
}
