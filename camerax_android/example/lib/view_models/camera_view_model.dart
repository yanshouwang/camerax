import 'dart:async';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

class CameraViewModel extends ViewModel with TypeLogger {
  final CameraController controller;
  LensFacing _lensFacing;
  ZoomState? _zoomState;

  late final StreamSubscription _zoomStateSubscription;

  CameraViewModel()
      : controller = CameraController(),
        _lensFacing = LensFacing.back,
        _zoomState = null {
    _initialize();
  }

  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;

  void _initialize() async {
    _zoomStateSubscription = controller.zoomStateChanged.listen((zoomState) {
      logger.info(
          'zoomStateChanged ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}');
      _zoomState = zoomState;
      notifyListeners();
    });
    await controller.requestPermissions();
    await controller.setCameraSelector(CameraSelector.back);
    _zoomState = await controller.getZoomState();
    final isPinchToZoomEnabled = await controller.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await controller.isTapToFocusEnabled();
    logger.info(
        '''zoomState: ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}
isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
    notifyListeners();
    await controller.bindToLifecycle();
  }

  Future<void> toggleLensFacing() async {
    final cameraSelector = lensFacing == LensFacing.back
        ? CameraSelector.front
        : CameraSelector.back;
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
    _lensFacing = cameraSelector.lensFacing;
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await controller.setZoomRatio(zoomRatio);
  }

  @override
  void dispose() {
    controller.unbind();
    _zoomStateSubscription.cancel();
    super.dispose();
  }
}
