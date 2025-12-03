import 'package:camerax/camerax.dart';
import 'package:clover/clover.dart';
import 'package:logging/logging.dart';

Logger get _logger => Logger('InteractiveViewModel');

class InteractiveViewModel extends ViewModel {
  final Uri uri;
  final VisionDetector _detector;

  List<VisionObject> _visionObjects;
  List<VisionObject> get visionObjects => _visionObjects;

  InteractiveViewModel(this.uri)
    : _detector = VisionDetector(),
      _visionObjects = [];

  Future<void> detect() async {
    final image = VisionImage.uri(uri);
    _visionObjects = await _detector.detect(image);
    _logger.info('detect completed');
    for (var visionObject in visionObjects) {
      _logger.info('${visionObject.type}: ${visionObject.bounds}');
    }
    notifyListeners();
  }
}
