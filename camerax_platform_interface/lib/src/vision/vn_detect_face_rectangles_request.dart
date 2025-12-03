import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'vn_face_observation.dart';
import 'vn_image_based_request.dart';
import 'vn_request.dart';

abstract base class VNDetectFaceRectanglesRequest extends VNImageBasedRequest {
  VNDetectFaceRectanglesRequest.impl() : super.impl();

  factory VNDetectFaceRectanglesRequest({
    required VNRequestCompletionHandler completionHandler,
  }) => CameraXPlugin.instance.$VNDetectFaceRectanglesRequest(
    completionHandler: completionHandler,
  );

  @override
  Future<List<VNFaceObservation>?> getResults();
}
