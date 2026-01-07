import 'package:camerax_platform_interface/src/vision.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VNDetectFaceRectanglesRequest
    implements VNImageBasedRequest {
  factory VNDetectFaceRectanglesRequest({
    required VNRequestCompletionHandler completionHandler,
  }) => VNDetectFaceRectanglesRequestChannel.instance.create(
    completionHandler: completionHandler,
  );

  @override
  Future<List<VNFaceObservation>?> getResults();
}

abstract base class VNDetectFaceRectanglesRequestChannel
    extends PlatformInterface {
  VNDetectFaceRectanglesRequestChannel() : super(token: _token);

  static final _token = Object();

  static VNDetectFaceRectanglesRequestChannel? _instance;

  static VNDetectFaceRectanglesRequestChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VNDetectFaceRectanglesRequestChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VNDetectFaceRectanglesRequest create({
    required VNRequestCompletionHandler completionHandler,
  });
}
