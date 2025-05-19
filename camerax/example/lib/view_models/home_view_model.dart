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

  late final StreamSubscription _zoomStateChangedSubscription;

  CameraMode _mode;
  LensFacing _lensFacing;
  FlashMode? _flashMode;
  CameraInfo? _cameraInfo;
  CameraControl? _cameraControl;
  Camera2CameraInfo? _camera2Info;
  Camera2CameraControl? _camera2Control;
  Uri? _savedUri;
  ImageModel? _imageModel;
  Uint8List? _jpegValue;
  List<Barcode> _barcodes;
  List<Face> _faces;

  HomeViewModel()
      : _permissionManager = PermissionManager(),
        _controller = CameraController(),
        // _barcodeScanner = BarcodeScanner(),
        // _faceDetector = FaceDetector(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _barcodes = [],
        _faces = [] {
    _zoomStateChangedSubscription =
        _controller.zoomStateChanged.listen((e) => zoomState = e);
    _setUp();
  }

  CameraController get controller => _controller;
  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  FlashMode? get flashMode => _flashMode;

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

  Uri? get savedUri => _savedUri;
  bool get recording => _recording != null;
  ImageModel? get imageModel => _imageModel;
  Uint8List? get jpegValue => _jpegValue;
  List<Barcode> get barcodes => _barcodes;
  List<Face> get faces => _faces;

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
    _exposureState = null;
    _exposureTimeState = null;
    notifyListeners();
  }

  Future<void> setMode(CameraMode mode) async {
    switch (mode) {
      case CameraMode.takePicture:
      case CameraMode.recordVideo:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.rawValue:
        // await _setImageAnalyzer();
        // await _setJpegAnalyzer();
        break;
      case CameraMode.scanCode:
        // final analyzer = MlKitAnalyzer(
        //   detectors: [
        //     _barcodeScanner,
        //   ],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   consumer: _extractML,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        // final analyzer = MlKitAnalyzer(
        //   detectors: [
        //     _faceDetector,
        //   ],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   consumer: _extractML,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
    }
    _mode = mode;
    _imageModel = null;
    _jpegValue = null;
    _barcodes = [];
    _faces = [];
    notifyListeners();
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == LensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
      _lensFacing = LensFacing.front;
    } else {
      await _setCameraSelector(CameraSelector.back);
      _lensFacing = LensFacing.back;
    }
    notifyListeners();
  }

  // Future<void> toggleTorchState() async {
  //   final torchState = _controller.torchState;
  //   if (torchState == null) {
  //     throw ArgumentError.notNull();
  //   }
  //   final enableTorch = torchState == TorchState.off;
  //   await controller.enableTorch(enableTorch);
  // }

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
    final bundle = value == null
        ? CaptureRequestOptions(
            aeMode: ControlAeMode.on,
          )
        : CaptureRequestOptions(
            aeMode: ControlAeMode.off,
            sensorExposureTime: value,
          );
    await control.setCaptureRequestOptions(bundle);
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    _flashMode = await controller.getImageCaptureFlashMode();
    notifyListeners();
  }

  Future<void> takePicture() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw ArgumentError.notNull('directory');
    }
    final filePath = path.join(directory.path,
        'IMG_${DateTime.timestamp().millisecondsSinceEpoch}.JPG');
    final file = File(filePath);
    final options = OutputFileOptions(
      file: file,
    );
    await controller.takePictureToFile(
      options,
      onImageSaved: (outputFileResults) {
        _savedUri = outputFileResults.savedUri;
        notifyListeners();
      },
      onError: (exception) {
        logger.info('takePicture failed, $exception');
      },
    );
  }

  Recording? _recording;

  Future<void> startRecording() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw ArgumentError.notNull('directory');
    }
    final filePath = path.join(directory.path,
        'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV');
    final file = File(filePath);
    final options = FileOutputOptions(file: file);
    _recording = await controller.startRecording(
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
          _savedUri = results?.outputUri;
        } else {
          logger.info('startRecording failed, $error');
        }
        _recording = null;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void stopRecording() {
    _recording?.stop();
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
    // TODO: Use resolutionFilter will cause ANR error.
    // final resolutionSelector = ResolutionSelector(
    //   // resolutionFilter: (supportedSizes, rotationDegrees) => supportedSizes,
    //   resolutionStrategy: ResolutionStrategy(
    //     boundSize: Size(1024, 768),
    //     fallbackRule: ResolutionFallbackRule.closestHigherThenLower,
    //   ),
    // );
    // await controller.setImageAnalysisResolutionSelector(resolutionSelector);
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
          final planes = image.planes;
          final rotationDegrees = image.imageInfo.rotationDegrees;
          logger.info('image: $width * $height, $rotationDegrees°');
          if (format != ImageFormat.rgba8888) {
            throw ArgumentError.value(format);
          }
          final rawPixels = planes.first.buffer;
          final buffer = await ui.ImmutableBuffer.fromUint8List(rawPixels);
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
          image.close();
        }
      },
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  Future<void> _setJpegAnalyzer() async {
    await controller.unbind();
    final analyzer = JpegAnalyzer(
      targetCoordinateSystem: CoordinateSystem.viewReferenced,
      consumer: (value) {
        _jpegValue = value;
        notifyListeners();
      },
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _onRawPixelsAnalyzed(ImageModel imageModel) {
    if (mode != CameraMode.rawValue) {
      return;
    }
    _imageModel = imageModel;
    notifyListeners();
  }

  Future<void> _setMLAnalyzer(MlKitAnalyzer analyzer) async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(ImageFormat.yuv420_888);
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _extractML(MlKitAnalyzerResult result) async {
    // switch (mode) {
    //   case CameraMode.scanCode:
    //     final barcodes = await result.getValue(_barcodeScanner);
    //     _barcodes = barcodes ?? [];
    //     notifyListeners();
    //     break;
    //   case CameraMode.scanFace:
    //     final faces = await result.getValue(_faceDetector);
    //     _faces = faces ?? [];
    //     notifyListeners();
    //     break;
    //   default:
    // }
  }

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
