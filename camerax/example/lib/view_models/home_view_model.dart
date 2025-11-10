import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:camerax_example/models.dart';
import 'package:clover/clover.dart';
import 'package:exif/exif.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

typedef ImageModelCallback = void Function(ImageModel imageModel);

class HomeViewModel extends ViewModel with TypeLogger {
  final PermissionManager _permissionManager;
  final CameraController _controller;
  final RotationProvider _rotationProvider;
  final BarcodeScanner _barcodeScanner;
  final FaceDetector _faceDetector;

  RotationProviderListener? _rotationProviderListener;
  Observer<TorchState>? _torchStateObserver;
  Observer<ZoomState>? _zoomStateObserver;

  CameraInfo? _cameraInfo;
  CameraControl? _cameraControl;
  Camera2CameraInfo? _camera2CameraInfo;
  Camera2CameraControl? _camera2CameraControl;

  HomeViewModel()
    : _permissionManager = PermissionManager(),
      _controller = CameraController(),
      _rotationProvider = RotationProvider(),
      _barcodeScanner = BarcodeScanner(),
      _faceDetector = FaceDetector(),
      _mode = CameraMode.takePicture,
      _lensFacing = CameraSelectorLensFacing.back,
      _barcodes = [],
      _faces = [] {
    _setUp();
  }

  CameraController get controller => _controller;

  CameraMode _mode;
  CameraMode get mode => _mode;
  set mode(CameraMode value) {
    if (_mode == value) return;
    _mode = value;
    notifyListeners();
  }

  CameraSelectorLensFacing _lensFacing;
  CameraSelectorLensFacing get lensFacing => _lensFacing;
  set lensFacing(CameraSelectorLensFacing value) {
    if (_lensFacing == value) return;
    _lensFacing = value;
    notifyListeners();
  }

  ImageCaptureFlashMode? _flashMode;
  ImageCaptureFlashMode? get flashMode => _flashMode;
  set flashMode(ImageCaptureFlashMode? value) {
    if (_flashMode == value) return;
    _flashMode = value;
    notifyListeners();
  }

  TorchState? _torchState;
  TorchState? get torchState => _torchState;
  set torchState(TorchState? value) {
    if (_torchState == value) return;
    logger.info('torchState changed: $value');
    _torchState = value;
    notifyListeners();
  }

  ZoomState? _zoomState;
  ZoomState? get zoomState => _zoomState;
  set zoomState(ZoomState? value) {
    if (_zoomState == value) return;
    logger.info('zoomState changed: $value');
    _zoomState = value;
    notifyListeners();
  }

  ExposureState? _exposureState;
  ExposureState? get exposureState => _exposureState;
  set exposureState(ExposureState? value) {
    if (_exposureState == value) return;
    _exposureState = value;
    notifyListeners();
  }

  LimitedValue<int>? _exposureTimeState;
  LimitedValue<int>? get exposureTimeState => _exposureTimeState;
  set exposureTimeState(LimitedValue<int>? value) {
    if (_exposureTimeState == value) return;
    _exposureTimeState = value;
    notifyListeners();
  }

  Uri? _savedUri;
  Uri? get savedUri => _savedUri;
  set savedUri(Uri? value) {
    if (_savedUri == value) return;
    _savedUri = value;
    notifyListeners();
  }

  Recording? _recording;
  Recording? get recording => _recording;
  set recording(Recording? value) {
    if (_recording == value) return;
    _recording = value;
    notifyListeners();
  }

  bool get isRecording => recording != null;

  ImageModel? _imageModel;
  ImageModel? get imageModel => _imageModel;
  set imageModel(ImageModel? value) {
    if (_imageModel == value) return;
    _imageModel = value;
    notifyListeners();
  }

  List<Barcode> _barcodes;
  List<Barcode> get barcodes => _barcodes;
  set barcodes(List<Barcode> value) {
    if (_barcodes == value) return;
    _barcodes = value;
    notifyListeners();
  }

  List<Face> _faces;
  List<Face> get faces => _faces;
  set faces(List<Face> value) {
    if (_faces == value) return;
    _faces = value;
    notifyListeners();
  }

  Future<void> bind() async {
    await controller.bind();
    // TODO: How to wait until camera really opened.
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
    final cameraInfo = await controller.getCameraInfo();
    final cameraControl = await controller.getCameraControl();
    if (cameraInfo == null || cameraControl == null) {
      return;
    }
    // final camera2Info = Camera2CameraInfo.from(cameraInfo);
    // final camera2Control = Camera2CameraControl.from(cameraControl);
    // final exposureState = await cameraInfo.getExposureState();
    // final exposureTimeRange = await camera2Info
    //     .getSensorInfoExposureTimeRange();
    // logger.info(
    //   'exposureTimeRange: ${exposureTimeRange?.lower}, ${exposureTimeRange?.upper}',
    // );
    // final exposureTimeState = exposureTimeRange == null
    //     ? null
    //     : LimitedValue(
    //         minimum: exposureTimeRange.lower,
    //         maximum: exposureTimeRange.upper,
    //         value: exposureTimeRange.lower,
    //       );
    _cameraInfo = cameraInfo;
    _cameraControl = cameraControl;
    // _camera2CameraInfo = camera2Info;
    // _camera2CameraControl = camera2Control;
    // this.exposureState = exposureState;
    // this.exposureTimeState = exposureTimeState;
  }

  Future<void> unbind() async {
    await controller.unbind();
    _cameraInfo = null;
    _cameraControl = null;
    _camera2CameraControl = null;
    exposureState = null;
    exposureTimeState = null;
  }

  Future<void> setMode(CameraMode mode) async {
    if (Platform.isAndroid) {
      // See https://developer.android.com/reference/kotlin/androidx/camera/view/CameraController#setEnabledUseCases(int)
      if (mode == CameraMode.recordVideo) {
        await controller.setEnabledUseCases([
          CameraControllerUseCase.videoCapture,
        ]);
      } else {
        await controller.setEnabledUseCases([
          CameraControllerUseCase.imageCapture,
          CameraControllerUseCase.imageAnalysis,
        ]);
      }
    }
    switch (mode) {
      case CameraMode.takePicture:
      case CameraMode.recordVideo:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.rawValue:
        await _setImageAnalyzer();
        break;
      case CameraMode.barcodes:
        final analyzer = MlKitAnalyzer(
          detectors: [_barcodeScanner],
          targetCoordinateSystem: ImageAnalysisCoordinateSystem.viewReferenced,
          consumer: Consumer(accept: _handleMlKitAnalyzerResult),
        );
        await _setMlKitAnalyzer(analyzer);
        break;
      case CameraMode.face:
        final analyzer = MlKitAnalyzer(
          detectors: [_faceDetector],
          targetCoordinateSystem: ImageAnalysisCoordinateSystem.viewReferenced,
          consumer: Consumer(accept: _handleMlKitAnalyzerResult),
        );
        await _setMlKitAnalyzer(analyzer);
        break;
    }
    this.mode = mode;
    imageModel = null;
    barcodes = [];
    faces = [];
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == CameraSelectorLensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
      lensFacing = CameraSelectorLensFacing.front;
    } else {
      await _setCameraSelector(CameraSelector.back);
      lensFacing = CameraSelectorLensFacing.back;
    }
  }

  Future<void> toggleTorchState() async {
    final torchState = this.torchState;
    if (torchState == null) {
      throw ArgumentError.notNull();
    }
    final enabled = torchState == TorchState.off;
    await controller.enableTorch(enabled);
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await controller.setZoomRatio(zoomRatio);
  }

  Future<void> setExposureCompensationIndex(int value) async {
    final control = ArgumentError.checkNotNull(_cameraControl);
    final exposureIndex = await control.setExposureCompensationIndex(value);
    logger.info('New exposure compensation index: $exposureIndex');
  }

  Future<void> setExposureTime(int? value) async {
    final control = ArgumentError.checkNotNull(_camera2CameraControl);
    final bundle = value == null
        ? CaptureRequestOptions(aeMode: CameraMetadataControlAeMode.on)
        : CaptureRequestOptions(
            aeMode: CameraMetadataControlAeMode.off,
            sensorExposureTime: value,
          );
    await control.setCaptureRequestOptions(bundle);
  }

  Future<void> setFlashMode(ImageCaptureFlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    flashMode = await controller.getImageCaptureFlashMode();
  }

  Future<void> takePicture() async {
    final info = ArgumentError.checkNotNull(_cameraInfo);
    final degrees1 = await info.getSensorRotationDegrees();
    final degrees2 = await info.getSensorRotationDegrees(
      SurfaceRotation.rotation0,
    );
    logger.info('degrees: $degrees1, $degrees2');
    final callback = ImageCaptureOnImageCapturedCallback(
      onCaptureStarted: () {
        logger.info('onCaptureStarted');
      },
      onCaptureProcessProgressed: (progress) {
        logger.info('onCaptureProcessProgressed: $progress');
      },
      onPostviewBitmapAvailable: (bitmap) {
        logger.info('onPostviewBitmapAvailable');
      },
      onCaptureSuccess: (image) async {
        logger.info(
          'onCaptureSuccess: ${image.format}, ${image.width}, ${image.height}, ${image.imageInfo.rotationDegrees}',
        );
        try {
          final directory = await getApplicationDocumentsDirectory();
          final filePath = path.join(
            directory.path,
            'IMG_${DateTime.timestamp().millisecondsSinceEpoch}.JPG',
          );
          final file = File(filePath);
          final value = image.planes[0].value;
          final exif = await readExifFromBytes(value);
          logger.info(exif);
          await file.writeAsBytes(value, flush: true);
          savedUri = file.uri;
        } catch (e) {
          logger.warning('save image failed', e);
        } finally {
          await image.close();
        }
      },
      onError: (exception) {
        logger.warning('onError', exception);
      },
    );
    await controller.takePicture(callback);
  }

  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(
      directory.path,
      'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV',
    );
    final file = File(filePath);
    final outputOptions = FileOutputOptions(file);
    final listener = Consumer<VideoRecordEvent>(
      accept: (event) {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        if (event.hasError) {
          logger.warning('startRecording failed, ${event.error}');
        } else {
          savedUri = event.outputResults.outputUri;
        }
        recording = null;
      },
    );
    recording = await controller.startRecording(
      outputOptions: outputOptions,
      audioConfig: AudioConfig.audioDisabled,
      listener: listener,
    );
  }

  void stopRecording() {
    recording?.stop();
  }

  void _setUp() async {
    var isGranted =
        await _permissionManager.checkPermission(
          PermissionManagerPermission.audio,
        ) &&
        await _permissionManager.checkPermission(
          PermissionManagerPermission.video,
        );
    if (!isGranted) {
      isGranted = await _permissionManager.requestPermissions([
        PermissionManagerPermission.video,
        PermissionManagerPermission.audio,
      ]);
    }
    if (!isGranted) {
      throw StateError('requestPermissions failed.');
    }
    // await controller.initialize();
    // await controller.setCameraSelector(CameraSelector.front);
    final resolutionSelector = ResolutionSelector(
      // TODO: Use resolutionFilter will cause ANR error.
      // resolutionFilter: (supportedSizes, rotationDegrees) => supportedSizes,
      resolutionStrategy: ResolutionStrategy(
        boundSize: Size(1024, 768),
        fallbackRule: ResolutionStrategyFallbackRule.closestHigherThenLower,
      ),
    );
    await controller.setImageAnalysisResolutionSelector(resolutionSelector);
    final torchState = await controller.getTorchState();
    final zoomState = await controller.getZoomState();
    this.torchState = torchState;
    this.zoomState = zoomState;
    final torchStateObserver = Observer<TorchState>(
      onChanged: (e) => this.torchState = e,
    );
    final zoomStateObserver = Observer<ZoomState>(
      onChanged: (e) => this.zoomState = e,
    );
    await controller.observeTorchState(torchStateObserver);
    await controller.observeZoomState(zoomStateObserver);
    _torchStateObserver = torchStateObserver;
    _zoomStateObserver = zoomStateObserver;
    final rotationProviderListener = RotationProviderListener(
      onRotationChanged: (rotation) {
        logger.info('RotationProviderListener.onRotationChanged: $rotation');
      },
    );
    await _rotationProvider.addListener(rotationProviderListener);
    _rotationProviderListener = rotationProviderListener;
    await bind();
  }

  Future<void> _setCameraSelector(CameraSelector cameraSelector) async {
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
  }

  Future<void> _setImageAnalyzer() async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(
      ImageAnalysisOutputImageFormat.rgba8888,
    );
    final analyzer = ImageAnalysisAnalyzer(
      consumer: Consumer(
        accept: (image) async {
          try {
            final format = image.format;
            final width = image.width;
            final height = image.height;
            final plane = image.planes.first;
            // final width = plane.rowStride ~/ plane.pixelStride;
            final rotationDegrees = image.imageInfo.rotationDegrees;
            logger.info(
              '${image.hashCode}: $width * $height, $rotationDegrees°',
            );
            if (format != ImageFormat.rgba8888) {
              throw ArgumentError.value(format);
            }
            final buffer = await ui.ImmutableBuffer.fromUint8List(plane.value);
            final descriptor = ui.ImageDescriptor.raw(
              buffer,
              width: width,
              height: height,
              pixelFormat: ui.PixelFormat.rgba8888,
            );
            final codec = await descriptor.instantiateCodec();
            final frame = await codec.getNextFrame();
            final imageModel = ImageModel(
              image: frame.image,
              rotationDegrees: rotationDegrees,
            );
            _handleImageModel(imageModel);
          } finally {
            await image.close();
            logger.info('${image.hashCode} closed');
          }
        },
      ),
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _handleImageModel(ImageModel imageModel) {
    if (mode != CameraMode.rawValue) {
      return;
    }
    this.imageModel = imageModel;
  }

  Future<void> _setMlKitAnalyzer(MlKitAnalyzer analyzer) async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(
      ImageAnalysisOutputImageFormat.yuv420_888,
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _handleMlKitAnalyzerResult(MlKitAnalyzerResult result) async {
    switch (mode) {
      case CameraMode.barcodes:
        final barcodes = await result.getValue(_barcodeScanner);
        this.barcodes = barcodes ?? [];
        break;
      case CameraMode.face:
        final faces = await result.getValue(_faceDetector);
        this.faces = faces ?? [];
        break;
      default:
    }
  }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
  }

  @override
  void dispose() {
    final rotationProviderListener = _rotationProviderListener;
    if (rotationProviderListener != null) {
      _rotationProvider.removeListener(rotationProviderListener);
    }
    final torchStateObserver = _torchStateObserver;
    final zoomStateObserver = _zoomStateObserver;
    if (torchStateObserver != null) {
      controller.removeTorchStateObserver(torchStateObserver);
    }
    if (zoomStateObserver != null) {
      controller.removeZoomStateObserver(zoomStateObserver);
    }
    _clearImageAnalysisAnalyzer();
    unbind();
    super.dispose();
  }
}
