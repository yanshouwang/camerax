import 'dart:async';
import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:flutter/widgets.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:photo_gallery/photo_gallery.dart';

class CameraViewModel extends ViewModel
    with WidgetsBindingObserver, TypeLogger {
  final WidgetsBinding _binding;
  final CameraController _controller;
  LensFacing _lensFacing;
  ZoomState? _zoomState;
  bool? _torchState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  Uint8List? _thumbnail;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  CameraViewModel()
      : _binding = WidgetsFlutterBinding.ensureInitialized(),
        _controller = CameraController(),
        _lensFacing = LensFacing.back,
        _zoomState = null,
        _flashMode = null,
        _savedUri = null {
    _initialize();
  }

  CameraController get controller => _controller;
  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;
  bool? get torchState => _torchState;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  Uint8List? get thumbnail => _thumbnail;

  void _initialize() async {
    _binding.addObserver(this);
    _zoomStateSubscription = _controller.zoomStateChanged.listen((zoomState) {
      logger.info(
          'zoomStateChanged ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.zoomRatio}, ${zoomState?.linearZoom}');
      _zoomState = zoomState;
      notifyListeners();
    });
    _torchStateSubscription =
        _controller.torchStateChanged.listen((torchState) {
      logger.info('torchStateChanged $torchState');
      _torchState = torchState;
      notifyListeners();
    });
    await _updateThumbnail();
    await _controller.requestPermissions();
    await _controller.setCameraSelector(CameraSelector.back);
    _zoomState = await _controller.getZoomState();
    _torchState = await _controller.getTorchState();
    _flashMode = await _controller.getImageCaptureFlashMode();
    final isPinchToZoomEnabled = await _controller.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await _controller.isTapToFocusEnabled();
    logger.info(
        '''zoomState: ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}
torchState: $torchState
flashMode: $flashMode
isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
    notifyListeners();
    await _controller.bindToLifecycle();
  }

  Future<void> _updateThumbnail() async {
    final albums = await PhotoGallery.listAlbums(
      mediumType: MediumType.image,
    );
    final album = albums.firstWhere((album) => album.isAllAlbum);
    final images = await album.listMedia();
    final image = images.items.first;
    final thumbnail = await PhotoGallery.getThumbnail(
      mediumId: image.id,
      highQuality: true,
    );
    _thumbnail = Uint8List.fromList(thumbnail);
    notifyListeners();
  }

  Future<void> toggleLensFacing() async {
    final cameraSelector = lensFacing == LensFacing.back
        ? CameraSelector.front
        : CameraSelector.back;
    final hasCamera = await _controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await _controller.setCameraSelector(cameraSelector);
    _lensFacing = cameraSelector.lensFacing;
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await _controller.setZoomRatio(zoomRatio);
  }

  Future<void> toggleTorchState() async {
    final enabled = torchState;
    if (enabled == null) {
      throw ArgumentError.notNull();
    }
    await _controller.enableTorch(!enabled);
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await _controller.setImageCaptureFlashMode(flashMode);
    _flashMode = await _controller.getImageCaptureFlashMode();
    notifyListeners();
  }

  Future<void> takePicture() async {
    _savedUri = await _controller.takePictureToAlbum();
    await _updateThumbnail();
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _updateThumbnail();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    _controller.unbind();
    _zoomStateSubscription.cancel();
    _torchStateSubscription.cancel();
    super.dispose();
  }
}
