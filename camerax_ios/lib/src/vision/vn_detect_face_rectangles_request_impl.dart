import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_face_observation_impl.dart';
import 'vn_image_based_request_impl.dart';
import 'vn_request_impl.dart';

final class VNDetectFaceRectanglesRequestImpl
    extends VNDetectFaceRectanglesRequest
    with VNRequestImpl, VNImageBasedRequestImpl {
  @override
  final VNDetectFaceRectanglesRequestProxyApi api;

  VNDetectFaceRectanglesRequestImpl.internal(this.api) : super.impl();

  factory VNDetectFaceRectanglesRequestImpl({
    required VNRequestCompletionHandler completionHandler,
  }) {
    final api = VNDetectFaceRectanglesRequestProxyApi(
      completionHandler: (request, error) =>
          completionHandler(request.impl, error?.impl),
    );
    return VNDetectFaceRectanglesRequestImpl.internal(api);
  }

  @override
  Future<List<VNFaceObservation>?> getResults() => api.getResults().then(
    (e) async => e == null ? null : await Future.wait(e.map((e1) => e1.impl())),
  );
}
