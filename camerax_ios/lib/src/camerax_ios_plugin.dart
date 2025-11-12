import 'dart:io';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'avfoundation.dart';
// import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'video.dart';
import 'view.dart';
import 'vision.dart';

final class CameraXiOSPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXiOSPlugin();
  }

  @override
  PermissionManager $PermissionManager() => PermissionManagerImpl();

  @override
  CameraSelector get $CameraSelector$Back => CameraSelectorImpl.back;
  @override
  CameraSelector get $CameraSelector$Front => CameraSelectorImpl.front;
  @override
  CameraSelector get $CameraSelector$External => CameraSelectorImpl.external;
  @override
  CameraSelector $CameraSelector({CameraSelectorLensFacing? lensFacing}) =>
      CameraSelectorImpl(lensFacing: lensFacing);

  @override
  CameraController $CameraController() => CameraControllerImpl();

  @override
  PreviewView $PreviewView() => PreviewViewImpl();

  @override
  FallbackStrategy $FallbackStrategy$HigherQualityOrLowerThan(
    Quality quality,
  ) => throw UnimplementedError();
  // FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$HigherQualityThan(Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityOrHigherThan(
    Quality quality,
  ) => throw UnimplementedError();
  // FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityThan(Quality quality) =>
      throw UnimplementedError();
  // FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzer $MlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => throw UnimplementedError();

  @override
  Future<Size<int>?> $QualitySelector$GetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => throw UnimplementedError();
  // QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  QualitySelector $QualitySelector$From(
    Quality quality, [
    FallbackStrategy? fallbackStrategy,
  ]) => throw UnimplementedError();
  // QualitySelectorImpl.from(quality, fallbackStrategy: fallbackStrategy);

  @override
  QualitySelector $QualitySelector$FromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]) => throw UnimplementedError();
  // QualitySelectorImpl.fromOrderedList(
  //   qualities,
  //   fallbackStrategy: fallbackStrategy,
  // );

  @override
  BarcodeScannerOptions $BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => throw UnimplementedError();

  @override
  FaceDetectorOptions $FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => throw UnimplementedError();

  @override
  ZoomSuggestionOptions $ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => throw UnimplementedError();

  @override
  FileOutputOptions $FileOutputOptions(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => FileOutputOptionsImpl(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  @override
  SurfaceOrientedMeteringPointFactory $SurfaceOrientedMeteringPointFactory(
    width,
    height,
  ) => SurfaceOrientedMeteringPointFactoryImpl(width, height);

  @override
  FocusMeteringAction $FocusMeteringAction(
    (MeteringPoint, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPoint, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) => FocusMeteringActionImpl(
    point,
    morePoints: morePoints,
    disableAutoCancel: disableAutoCancel,
    autoCancelDuration: autoCancelDuration,
  );

  @override
  ImageAnalysisAnalyzer $ImageAnalysisAnalyzer({
    required Consumer<ImageProxy> consumer,
  }) => ImageAnalysisImageAnalyzerImplImpl(consumer: consumer);

  @override
  Camera2CameraControl $Camera2CameraControl$From(
    CameraControl cameraControl,
  ) => throw UnimplementedError();

  @override
  Camera2CameraInfo $Camera2CameraInfo$From(CameraInfo cameraInfo) =>
      throw UnimplementedError();

  @override
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => throw UnimplementedError();

  @override
  AVAnalyzer $AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => AVAnalyzerImpl(types: types, consumer: consumer);

  @override
  ImageCaptureOnImageCapturedCallback $ImageCaptureOnImageCapturedCallback({
    void Function()? onCaptureStarted,
    void Function(int progress)? onCaptureProcessProgressed,
    void Function(Image bitmap)? onPostviewBitmapAvailable,
    void Function(ImageProxy image)? onCaptureSuccess,
    void Function(Object exception)? onError,
  }) => ImageCaptureOnImageCapturedCallbackImpl(
    onCaptureStarted: onCaptureStarted,
    onCaptureProcessProgressed: onCaptureProcessProgressed,
    onPostviewBitmapAvailable: onPostviewBitmapAvailable,
    onCaptureSuccess: onCaptureSuccess,
    onError: onError,
  );

  @override
  ResolutionFilter $ResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => throw UnimplementedError();
  // ResolutionFilterImpl(filter: filter);

  @override
  RotationProvider $RotationProvider() => RotationProviderImpl();

  @override
  RotationProviderListener $RotationProviderListener({
    required void Function(SurfaceRotation rotation) onRotationChanged,
  }) => RotationProviderListenerImpl(onRotationChanged: onRotationChanged);

  @override
  ZoomSuggestionOptionsZoomCallback $ZoomSuggestionOptions$ZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => throw UnimplementedError();

  @override
  Location $Location(double latitude, double longitude) =>
      LocationImpl(latitude, longitude);

  @override
  AspectRatioStrategy $AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  }) => throw UnimplementedError();
  // AspectRatioStrategyImpl(
  //   preferredAspectRatio: preferredAspectRatio,
  //   fallbackRule: fallbackRule,
  // );

  @override
  AspectRatioStrategy get $AspectRatioStrategy$Ratio16_9FallbackAutoStrategy =>
      throw UnimplementedError();
  // AspectRatioStrategyImpl.ratio16_9FallbackAutoStrategy;

  @override
  AspectRatioStrategy get $AspectRatioStrategy$Ratio4_3FallbackAutoStrategy =>
      throw UnimplementedError();
  // AspectRatioStrategyImpl.ratio4_3FallbackAutoStrategy;

  @override
  AudioConfig get $AudioConfig$AudioDisabled => AudioConfigImpl.audioDisabled;

  @override
  AudioConfig $AudioConfig$Create(bool enableAudio) =>
      AudioConfigImpl.create(enableAudio);

  @override
  BarcodeScanner $BarcodeScanner() => throw UnimplementedError();

  @override
  BarcodeScanner $BarcodeScanner$Options(BarcodeScannerOptions options) =>
      throw UnimplementedError();

  @override
  Future<bool> $CameraInfo$MustPlayShutterSound() =>
      CameraInfoImpl.mustPlayShutterSound();

  @override
  Consumer<T> $Consumer<T>({required void Function(T value) accept}) =>
      ConsumerImpl(accept: accept);

  @override
  DynamicRange $DynamicRange({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  }) => throw UnimplementedError();
  // DynamicRangeImpl(encoding: encoding, bitDepth: bitDepth);

  @override
  DynamicRange get $DynamicRange$DolbyVision10Bit => throw UnimplementedError();
  // DynamicRangeImpl.dolbyVision10Bit;

  @override
  DynamicRange get $DynamicRange$DolbyVision8Bit => throw UnimplementedError();
  // DynamicRangeImpl.dolbyVision8Bit;

  @override
  DynamicRange get $DynamicRange$Hdr10Plus10Bit => throw UnimplementedError();
  // DynamicRangeImpl.hdr10Plus10Bit;

  @override
  DynamicRange get $DynamicRange$Hdr10_10Bit => throw UnimplementedError();
  // DynamicRangeImpl.hdr10_10Bit;

  @override
  DynamicRange get $DynamicRange$HdrUnspecified10Bit =>
      throw UnimplementedError();
  // DynamicRangeImpl.hdrUnspecified10Bit;

  @override
  DynamicRange get $DynamicRange$Hlg10Bit => throw UnimplementedError();
  // DynamicRangeImpl.hlg10Bit;

  @override
  DynamicRange get $DynamicRange$Sdr => throw UnimplementedError();
  // DynamicRangeImpl.sdr;

  @override
  DynamicRange get $DynamicRange$Unspecifid => throw UnimplementedError();
  // DynamicRangeImpl.unspecifid;

  @override
  FaceDetector $FaceDetector() => throw UnimplementedError();

  @override
  FaceDetector $FaceDetector$Options(FaceDetectorOptions options) =>
      throw UnimplementedError();

  @override
  Future<double> $MeteringPointFactory$GetDefaultPointSize() =>
      MeteringPointFactoryImpl.getDefaultPointSize();

  @override
  Observer<T> $Observer<T>({required void Function(T value) onChanged}) =>
      ObserverImpl(onChanged: onChanged);

  @override
  Quality get $Quality$Fhd => throw UnimplementedError();
  // QualityImpl.fhd;

  @override
  Quality get $Quality$Hd => throw UnimplementedError();
  // QualityImpl.hd;

  @override
  Quality get $Quality$Highest => throw UnimplementedError();
  // QualityImpl.highest;

  @override
  Quality get $Quality$Lowest => throw UnimplementedError();
  // QualityImpl.lowest;

  @override
  Quality get $Quality$Sd => throw UnimplementedError();
  // QualityImpl.sd;

  @override
  Quality get $Quality$Uhd => throw UnimplementedError();
  // QualityImpl.uhd;

  @override
  ResolutionSelector $ResolutionSelector({
    ResolutionSelectorMode? mode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) => ResolutionSelectorImpl(
    mode: mode,
    aspectRatioStrategy: aspectRatioStrategy,
    resolutionFilter: resolutionFilter,
    resolutionStrategy: resolutionStrategy,
  );

  @override
  ResolutionStrategy $ResolutionStrategy({
    required Size<int> boundSize,
    required ResolutionStrategyFallbackRule fallbackRule,
  }) =>
      ResolutionStrategyImpl(boundSize: boundSize, fallbackRule: fallbackRule);

  @override
  ResolutionStrategy get $ResolutionStrategy$HighestAvailableStrategy =>
      ResolutionStrategyImpl.highestAvailableStrategy;

  @override
  VisionAnalyzer $VisionAnalyzer({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
  }) => VisionAnalyzerImpl(types: types, consumer: consumer);
}
