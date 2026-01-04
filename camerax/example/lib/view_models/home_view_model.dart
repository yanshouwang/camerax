import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:camerax/camerax.dart';
import 'package:camerax_example/models.dart';
import 'package:clover/clover.dart';
import 'package:exif/exif.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Logger get _logger => Logger('HomeViewModel');

typedef ImageModelCallback = void Function(ImageModel imageModel);

class HomeViewModel extends ViewModel {
  final PermissionManager _permissionManager;
  final CameraController _controller;
  final RotationProvider _rotationProvider;

  RotationProvider$Listener? _rotationProviderListener;
  Observer<TorchState>? _torchStateObserver;
  Observer<ZoomState>? _zoomStateObserver;

  CameraInfo? _info;
  CameraControl? _control;
  Camera2CameraInfo? _camera2Info;
  Camera2CameraControl? _camera2Control;

  HomeViewModel()
    : _permissionManager = PermissionManager(),
      _controller = CameraController(),
      _rotationProvider = RotationProvider(),
      _mode = CameraMode.takePicture,
      _lensFacing = CameraSelector$LensFacing.back,
      _codes = [],
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

  CameraSelector$LensFacing _lensFacing;
  CameraSelector$LensFacing get lensFacing => _lensFacing;
  set lensFacing(CameraSelector$LensFacing value) {
    if (_lensFacing == value) return;
    _lensFacing = value;
    notifyListeners();
  }

  ImageCapture$FlashMode? _flashMode;
  ImageCapture$FlashMode? get flashMode => _flashMode;
  set flashMode(ImageCapture$FlashMode? value) {
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

  ExposureTimeState? _exposureTimeState;
  ExposureTimeState? get exposureTimeState => _exposureTimeState;
  set exposureTimeState(ExposureTimeState? value) {
    if (_exposureTimeState == value) return;
    _exposureTimeState = value;
    notifyListeners();
  }

  ApertureState? _lensApertureState;
  ApertureState? get lensApertureState => _lensApertureState;
  set lensApertureState(ApertureState? value) {
    if (_lensApertureState == value) return;
    _lensApertureState = value;
    notifyListeners();
  }

  SensitivityState? _sensitivityState;
  SensitivityState? get sensitivityState => _sensitivityState;
  set sensitivityState(SensitivityState? value) {
    if (_sensitivityState == value) return;
    _sensitivityState = value;
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

  List<VisionMachineReadableCodeObject> _codes;
  List<VisionMachineReadableCodeObject> get codes => _codes;
  set codes(List<VisionMachineReadableCodeObject> value) {
    if (_codes == value) return;
    _codes = value;
    notifyListeners();
  }

  List<VisionFaceObject> _faces;
  List<VisionFaceObject> get faces => _faces;
  set faces(List<VisionFaceObject> value) {
    if (_faces == value) return;
    _faces = value;
    notifyListeners();
  }

  Future<void> bind() async {
    await controller.bind();
  }

  Future<void> unbind() async {
    await controller.unbind();
  }

  Future<void> setMode(CameraMode mode) async {
    if (Platform.isAndroid) {
      // See https://developer.android.com/reference/kotlin/androidx/camera/view/CameraController#setEnabledUseCases(int)
      if (mode == CameraMode.recordVideo) {
        await controller.setEnabledUseCases([
          CameraController$UseCase.videoCapture,
        ]);
      } else {
        await controller.setEnabledUseCases([
          CameraController$UseCase.imageCapture,
          CameraController$UseCase.imageAnalysis,
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
        final analyzer = VisionAnalyzer(
          types: [
            ...VisionObjectType.towDimensionalCodes,
            ...VisionObjectType.barcodes,
          ],
          consumer: Consumer(
            accept: (res) => codes = res.objects
                .whereType<VisionMachineReadableCodeObject>()
                .toList(),
          ),
        );
        await _setVisionAnalyzer(analyzer);
        break;
      case CameraMode.face:
        final analyzer = VisionAnalyzer(
          types: VisionObjectType.faces,
          consumer: Consumer(
            accept: (res) =>
                faces = res.objects.whereType<VisionFaceObject>().toList(),
          ),
        );
        await _setVisionAnalyzer(analyzer);
        break;
    }
    this.mode = mode;
    imageModel = null;
    codes = [];
    faces = [];
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == CameraSelector$LensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
      lensFacing = CameraSelector$LensFacing.front;
    } else {
      await _setCameraSelector(CameraSelector.back);
      lensFacing = CameraSelector$LensFacing.back;
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

  Future<void> setFlashMode(ImageCapture$FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    flashMode = await controller.getImageCaptureFlashMode();
  }

  Future<void> takePicture() async {
    final callback = ImageCapture$OnImageCapturedCallback(
      onCaptureStarted: () {
        _logger.info('onCaptureStarted');
      },
      onCaptureProcessProgressed: (progress) {
        _logger.info('onCaptureProcessProgressed: $progress');
      },
      onPostviewBitmapAvailable: (bitmap) {
        _logger.info('onPostviewBitmapAvailable');
      },
      onCaptureSuccess: (image) async {
        _logger.info(
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
          _logger.info(exif);
          await file.writeAsBytes(value, flush: true);
          savedUri = file.uri;
        } catch (e) {
          _logger.warning('save image failed', e);
        } finally {
          await image.close();
        }
      },
      onError: (exception) {
        _logger.warning('onError', exception);
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
    final outputOptions = await FileOutputOptions$Builder(file).build();
    final listener = Consumer<VideoRecordEvent>(
      accept: (event) {
        _logger.info('${event.runtimeType}');
        if (event is! VideoRecordEvent$Finalize) {
          return;
        }
        if (event.hasError) {
          _logger.warning('startRecording failed, ${event.error}');
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
          PermissionManager$Permission.audio,
        ) &&
        await _permissionManager.checkPermission(
          PermissionManager$Permission.video,
        );
    if (!isGranted) {
      isGranted = await _permissionManager.requestPermissions([
        PermissionManager$Permission.video,
        PermissionManager$Permission.audio,
      ]);
    }
    if (!isGranted) {
      throw StateError('requestPermissions failed.');
    }
    final resolutionStrategy = ResolutionStrategy(
      boundSize: Size(1024, 768),
      fallbackRule: ResolutionStrategy$FallbackRule.closestHigherThenLower,
    );
    final resolutionSelector = await ResolutionSelector$Builder()
        .setResolutionStrategy(resolutionStrategy)
        .then((e) => e.build());
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
    final rotationProviderListener = RotationProvider$Listener(
      onRotationChanged: (rotation) {
        _logger.info(
          'RotationProviderListener.onRotationChanged: ${rotation.name}',
        );
      },
    );
    await _rotationProvider.addListener(rotationProviderListener);
    _rotationProviderListener = rotationProviderListener;
    await bind();

    final info = await controller.getCameraInfo();
    final control = await controller.getCameraControl();
    if (info == null || control == null) {
      _logger.warning('info or control is null');
      return;
    }
    final camera2Info = Camera2CameraInfo.from(info);
    final camera2Control = Camera2CameraControl.from(control);

    _info = info;
    _control = control;
    _camera2Info = camera2Info;
    _camera2Control = camera2Control;

    final options = await camera2Control.getCaptureRequestOptions();

    final availableApertures = await camera2Info.getCameraCharacteristic(
      CameraCharacteristics.lensInfoAvailableApertures,
    );
    final aperture = await options.getCaptureRequestOption(
      CaptureRequest.lensAperture,
    );

    _logger.info('availableApertures: $availableApertures');
    _logger.info('aperture: $aperture');

    final exposureTimeRange = await camera2Info.getCameraCharacteristic(
      CameraCharacteristics.sensorInfoExposureTimeRange,
    );
    final exposureTime = await options.getCaptureRequestOption(
      CaptureRequest.sensorExposureTime,
    );
    _logger.info('exposureTimeRagne: $exposureTimeRange');
    _logger.info('exposureTime: $exposureTime');

    final sensitivityRange = await camera2Info.getCameraCharacteristic(
      CameraCharacteristics.sensorInfoSensitivityRange,
    );
    final sensitivity = await options.getCaptureRequestOption(
      CaptureRequest.sensorSensitivity,
    );
    _logger.info('sensitivityRange: $sensitivityRange');
    _logger.info('sensitivity: $sensitivity');
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
      ImageAnalysis$OutputImageFormat.rgba8888,
    );
    final analyzer = ImageAnalysis$Analyzer(
      consumer: Consumer(
        accept: (image) async {
          try {
            final format = image.format;
            final width = image.width;
            final height = image.height;
            final plane = image.planes.first;
            // final width = plane.rowStride ~/ plane.pixelStride;
            final rotationDegrees = image.imageInfo.rotationDegrees;
            _logger.info(
              '${image.hashCode}: $width * $height, $rotationDegrees°',
            );
            if (format != ImageFormat.rgba8888) {
              throw ArgumentError.value(format.name);
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
            _logger.info('${image.hashCode} closed');
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

  Future<void> _setVisionAnalyzer(VisionAnalyzer analyzer) async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(
      ImageAnalysis$OutputImageFormat.yuv420_888,
    );
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
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
