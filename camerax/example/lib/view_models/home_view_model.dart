import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:camerax_example/models.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

typedef ImageModelCallback = void Function(ImageModel imageModel);

class HomeViewModel extends ViewModel with TypeLogger {
  final PermissionManager _permissionManager;
  final CameraController _controller;
  // final BarcodeScanner _barcodeScanner;
  // final FaceDetector _faceDetector;

  late final StreamSubscription _torchStateChangedSubscription;
  late final StreamSubscription _zoomStateChangedSubscription;

  CameraInfo? _cameraInfo;
  CameraControl? _cameraControl;
  Camera2CameraInfo? _camera2Info;
  Camera2CameraControl? _camera2Control;

  HomeViewModel()
    : _permissionManager = PermissionManager(),
      _controller = CameraController(),
      // _barcodeScanner = BarcodeScanner(),
      // _faceDetector = FaceDetector(),
      _mode = CameraMode.takePicture,
      _lensFacing = LensFacing.back,
      _barcodes = [],
      _faces = [] {
    _torchStateChangedSubscription = _controller.torchStateChanged.listen(
      (e) => torchState = e,
    );
    _zoomStateChangedSubscription = _controller.zoomStateChanged.listen(
      (e) => zoomState = e,
    );
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

  LensFacing _lensFacing;
  LensFacing get lensFacing => _lensFacing;
  set lensFacing(LensFacing value) {
    if (_lensFacing == value) return;
    _lensFacing = value;
    notifyListeners();
  }

  FlashMode? _flashMode;
  FlashMode? get flashMode => _flashMode;
  set flashMode(FlashMode? value) {
    if (_flashMode == value) return;
    _flashMode = value;
    notifyListeners();
  }

  TorchState? _torchState;
  TorchState? get torchState => _torchState;
  set torchState(TorchState? value) {
    if (_torchState == value) return;
    _torchState = value;
    notifyListeners();
  }

  ZoomState? _zoomState;
  ZoomState? get zoomState => _zoomState;
  set zoomState(ZoomState? value) {
    if (_zoomState == value) return;
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
    // const duration = Duration(seconds: 1);
    // await Future.delayed(duration);
    // final cameraInfo = await controller.getCameraInfo();
    // final cameraControl = await controller.getCameraControl();
    // if (cameraInfo == null || cameraControl == null) {
    //   return;
    // }
    // final camera2Info = Camera2CameraInfo.from(cameraInfo);
    // final camera2Control = Camera2CameraControl.from(cameraControl);
    // final exposureState = await cameraInfo.getExposureState();
    // final exposureTimeRange =
    //     await camera2Info.getSensorInfoExposureTimeRange();
    // logger.info(
    //     'exposureTimeRange: ${exposureTimeRange?.lower}, ${exposureTimeRange?.upper}');
    // final exposureTimeState = exposureTimeRange == null
    //     ? null
    //     : LimitedValue(
    //         minimum: exposureTimeRange.lower,
    //         maximum: exposureTimeRange.upper,
    //         value: exposureTimeRange.lower,
    //       );
    // _cameraInfo = cameraInfo;
    // _cameraControl = cameraControl;
    // _camera2Info = camera2Info;
    // _camera2Control = camera2Control;
    // this.exposureState = exposureState;
    // this.exposureTimeState = exposureTimeState;
  }

  Future<void> unbind() async {
    await controller.unbind();
    _cameraInfo = null;
    _cameraControl = null;
    _camera2Info = null;
    _camera2Control = null;
    exposureState = null;
    exposureTimeState = null;
  }

  Future<void> setMode(CameraMode mode) async {
    switch (mode) {
      case CameraMode.takePicture:
      case CameraMode.recordVideo:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.rawValue:
        await _setImageAnalyzer();
        break;
      case CameraMode.scanCode:
        // final analyzer = MlKitAnalyzer(
        //   detectors: [_barcodeScanner],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   consumer: _extractML,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        // final analyzer = MlKitAnalyzer(
        //   detectors: [_faceDetector],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   consumer: _extractML,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
    }
    this.mode = mode;
    imageModel = null;
    barcodes = [];
    faces = [];
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == LensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
      lensFacing = LensFacing.front;
    } else {
      await _setCameraSelector(CameraSelector.back);
      lensFacing = LensFacing.back;
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
    final control = ArgumentError.checkNotNull(_camera2Control);
    final bundle =
        value == null
            ? CaptureRequestOptions(aeMode: ControlAeMode.on)
            : CaptureRequestOptions(
              aeMode: ControlAeMode.off,
              sensorExposureTime: value,
            );
    await control.setCaptureRequestOptions(bundle);
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    flashMode = await controller.getImageCaptureFlashMode();
  }

  Future<void> takePicture() async {
    // await controller.takePictureToMemory(
    //   onCaptureStarted: () {
    //     logger.info('onCaptureStarted');
    //   },
    //   onCaptureProcessProgressed: (progress) {
    //     logger.info('onCaptureProcessProgressed: $progress');
    //   },
    //   onPostviewBitmapAvailable: (bitmap) {
    //     logger.info('onPostviewBitmapAvailable');
    //   },
    //   onCaptureSuccess: (image) async {
    //     logger.info(
    //       'onCaptureSuccess: ${image.format}, ${image.width}, ${image.height}, ${image.imageInfo.rotationDegrees}',
    //     );
    //     await image.close();
    //   },
    //   onError: (exception) {
    //     logger.warning('onError', exception);
    //   },
    // );
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(
      directory.path,
      'IMG_${DateTime.timestamp().millisecondsSinceEpoch}.JPG',
    );
    final file = File(filePath);
    final options = OutputFileOptions(file: file);
    await controller.takePictureToFile(
      options,
      onCaptureStarted: () {
        logger.info('onCaptureStarted');
      },
      onCaptureProcessProgressed: (progress) {
        logger.info('onCaptureProcessProgressed: $progress');
      },
      onPostviewBitmapAvailable: (bitmap) {
        logger.info('onPostviewBitmapAvailable');
      },
      onImageSaved: (outputFileResults) {
        logger.info('onImageSaved: ${outputFileResults.savedUri}');
        savedUri = outputFileResults.savedUri;
      },
      onError: (exception) {
        logger.warning('onError, $exception');
      },
    );
  }

  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(
      directory.path,
      'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV',
    );
    final file = File(filePath);
    final options = FileOutputOptions(file: file);
    recording = await controller.startRecording(
      options,
      audioConfig: AudioConfig.audioDisabled,
      listener: (event) {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        final error = event.cause;
        final results = event.outputResults;
        if (error == null) {
          savedUri = results?.outputUri;
        } else {
          logger.warning('startRecording failed, $error');
        }
        recording = null;
      },
    );
  }

  void stopRecording() {
    recording?.stop();
  }

  void _setUp() async {
    var isGranted =
        await _permissionManager.checkPermission(Permission.album) &&
        await _permissionManager.checkPermission(Permission.audio) &&
        await _permissionManager.checkPermission(Permission.video);
    if (!isGranted) {
      isGranted = await _permissionManager.requestPermissions([
        Permission.album,
        Permission.audio,
        Permission.video,
      ]);
    }
    if (!isGranted) {
      throw StateError('requestPermissions failed.');
    }
    // await controller.initialize();
    await controller.setCameraSelector(CameraSelector.back);
    final resolutionSelector = ResolutionSelector(
      // TODO: Use resolutionFilter will cause ANR error.
      // resolutionFilter: (supportedSizes, rotationDegrees) => supportedSizes,
      resolutionStrategy: ResolutionStrategy(
        boundSize: Size(1024, 768),
        fallbackRule: ResolutionFallbackRule.closestHigherThenLower,
      ),
    );
    await controller.setImageAnalysisResolutionSelector(resolutionSelector);
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
    await controller.setImageAnalysisOutputImageFormat(ImageFormat.rgba8888);
    final analyzer = ImageAnalyzer(
      analyze: (image) async {
        try {
          final format = image.format;
          final width = image.width;
          final height = image.height;
          final plane = image.planes.first;
          // final width = plane.rowStride ~/ plane.pixelStride;
          final rotationDegrees = image.imageInfo.rotationDegrees;
          logger.info('${image.hashCode}: $width * $height, $rotationDegrees°');
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
          _onRawPixelsAnalyzed(imageModel);
        } finally {
          await image.close();
          logger.info('${image.hashCode} closed');
        }
      },
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _onRawPixelsAnalyzed(ImageModel imageModel) {
    if (mode != CameraMode.rawValue) {
      return;
    }
    this.imageModel = imageModel;
  }

  // Future<void> _setMLAnalyzer(MlKitAnalyzer analyzer) async {
  //   await controller.unbind();
  //   await controller.setImageAnalysisOutputImageFormat(ImageFormat.yuv420_888);
  //   await controller.setImageAnalysisAnalyzer(analyzer);
  //   await controller.bind();
  // }

  // void _extractML(MlKitAnalyzerResult result) async {
  //   switch (mode) {
  //     case CameraMode.scanCode:
  //       final barcodes = await result.getValue(_barcodeScanner);
  //       this.barcodes = barcodes ?? [];
  //       break;
  //     case CameraMode.scanFace:
  //       final faces = await result.getValue(_faceDetector);
  //       this.faces = faces ?? [];
  //       break;
  //     default:
  //   }
  // }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
  }

  @override
  void dispose() {
    _clearImageAnalysisAnalyzer();
    unbind();
    _zoomStateChangedSubscription.cancel();
    super.dispose();
  }
}
