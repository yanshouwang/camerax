import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VNDetectFaceRectanglesRequestImpl extends VNImageBasedRequestImpl
    implements VNDetectFaceRectanglesRequest {
  @override
  final VNDetectFaceRectanglesRequestProxyApi api;

  VNDetectFaceRectanglesRequestImpl.internal(this.api);

  @override
  Future<List<VNFaceObservation>?> getResults() => api.getResults().then(
    (e) async => e == null ? null : await Future.wait(e.map((e1) => e1.impl())),
  );
}

final class VNDetectFaceRectanglesRequestChannelImpl
    extends VNDetectFaceRectanglesRequestChannel {
  @override
  VNDetectFaceRectanglesRequest create({
    required VNRequestCompletionHandler completionHandler,
  }) {
    final api = VNDetectFaceRectanglesRequestProxyApi(
      completionHandler: (request, error) =>
          completionHandler(request.impl, error?.impl),
    );
    return VNDetectFaceRectanglesRequestImpl.internal(api);
  }
}
