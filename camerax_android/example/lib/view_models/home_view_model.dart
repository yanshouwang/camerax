import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final CameraController cameraController;
  LensFacing _lensFacing;
  double _zoomRatio;

  HomeViewModel()
      : cameraController = CameraController(),
        _lensFacing = LensFacing.back,
        _zoomRatio = 1.0 {
    _initialize();
  }

  LensFacing get lensFacing => _lensFacing;
  double get zoomRatio => _zoomRatio;

  void _initialize() async {
    await cameraController.requestPermissions();
    await cameraController.bind();
    final isPinchToZoomEnabled = await cameraController.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await cameraController.isTapToFocusEnabled();
    logger.info('''isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
  }

  Future<void> toggleLensFacing() async {
    final cameraSelector = lensFacing == LensFacing.back
        ? CameraSelector.front
        : CameraSelector.back;
    await cameraController.setCameraSelector(cameraSelector);
    _lensFacing = cameraSelector.lensFacing;
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await cameraController.setZoomRatio(zoomRatio);
    _zoomRatio = zoomRatio;
    notifyListeners();
  }

  @override
  void dispose() {
    cameraController.unbind();
    super.dispose();
  }
}
