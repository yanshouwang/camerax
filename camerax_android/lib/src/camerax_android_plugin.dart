import 'dart:io';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  PermissionManager $PermissionManager() => PermissionManagerImpl();

  @override
  CameraSelector get $CameraSelector$Front => CameraSelectorImpl.front;
  @override
  CameraSelector get $CameraSelector$Back => CameraSelectorImpl.back;
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
  ) => FallbackStrategyImpl.higherQualityOrLowerThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$HigherQualityThan(Quality quality) =>
      FallbackStrategyImpl.higherQualityThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityOrHigherThan(
    Quality quality,
  ) => FallbackStrategyImpl.lowerQualityOrHigherThan(quality);
  @override
  FallbackStrategy $FallbackStrategy$LowerQualityThan(Quality quality) =>
      FallbackStrategyImpl.lowerQualityThan(quality);

  @override
  MlKitAnalyzer $MlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysisCoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzerResult> consumer,
  }) => MlKitAnalyzerImpl(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );

  @override
  Future<Size<int>?> $QualitySelector$GetResolution(
    CameraInfo cameraInfo,
    Quality quality,
  ) => QualitySelectorImpl.getResolution(cameraInfo, quality);

  @override
  QualitySelector $QualitySelector$From(
    Quality quality, [
    FallbackStrategy? fallbackStrategy,
  ]) => QualitySelectorImpl.from(quality, fallbackStrategy: fallbackStrategy);

  @override
  QualitySelector $QualitySelector$FromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]) => QualitySelectorImpl.fromOrderedList(
    qualities,
    fallbackStrategy: fallbackStrategy,
  );

  @override
  BarcodeScannerOptions $BarcodeScannerOptions({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) => BarcodeScannerOptionsImpl(
    enableAllPotentialBarcodes: enableAllPotentialBarcodes,
    formats: formats,
    zoomSuggestionOptions: zoomSuggestionOptions,
  );

  @override
  FaceDetectorOptions $FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => FaceDetectorOptionsImpl(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );

  @override
  ZoomSuggestionOptions $ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => ZoomSuggestionOptionsImpl(
    zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );

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
  ) => Camera2CameraControlImpl.from(cameraControl);

  @override
  Camera2CameraInfo $Camera2CameraInfo$From(CameraInfo cameraInfo) =>
      Camera2CameraInfoImpl.from(cameraInfo);

  @override
  CaptureRequestOptions $CaptureRequestOptions({
    CameraMetadataControlMode? mode,
    CameraMetadataControlAeMode? aeMode,
    CameraMetadataControlAfMode? afMode,
    CameraMetadataControlAwbMode? awbMode,
    int? sensorExposureTime,
  }) => CaptureRequestOptionsImpl(
    mode: mode,
    aeMode: aeMode,
    afMode: afMode,
    awbMode: awbMode,
    sensorExposureTime: sensorExposureTime,
  );

  @override
  AVAnalyzer $AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => throw UnimplementedError();

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
  }) => ResolutionFilterImpl(filter: filter);

  @override
  RotationProvider $RotationProvider() => RotationProviderImpl();

  @override
  RotationProviderListener $RotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  }) => RotationProviderListenerImpl(onRotationChanged: onRotationChanged);

  @override
  ZoomSuggestionOptionsZoomCallback $ZoomSuggestionOptions$ZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => ZoomSuggestionOptionsZoomCallbackImpl(setZoom: setZoom);

  @override
  Location $Location() => LocationImpl();

  @override
  AspectRatioStrategy $AspectRatioStrategy({
    required AspectRatio preferredAspectRatio,
    required AspectRatioStrategyFallbackRule fallbackRule,
  }) => AspectRatioStrategyImpl(
    preferredAspectRatio: preferredAspectRatio,
    fallbackRule: fallbackRule,
  );

  @override
  AspectRatioStrategy get $AspectRatioStrategy$Ratio16_9FallbackAutoStrategy =>
      AspectRatioStrategyImpl.ratio16_9FallbackAutoStrategy;

  @override
  AspectRatioStrategy get $AspectRatioStrategy$Ratio4_3FallbackAutoStrategy =>
      AspectRatioStrategyImpl.ratio4_3FallbackAutoStrategy;

  @override
  AudioConfig get $AudioConfig$AudioDisabled => AudioConfigImpl.audioDisabled;

  @override
  AudioConfig $AudioConfig$Create(bool enableAudio) =>
      AudioConfigImpl.create(enableAudio);

  @override
  BarcodeScanner $BarcodeScanner() => BarcodeScannerImpl();

  @override
  BarcodeScanner $BarcodeScanner$Options(BarcodeScannerOptions options) =>
      BarcodeScannerImpl.options(options);

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
  }) => DynamicRangeImpl(encoding: encoding, bitDepth: bitDepth);

  @override
  DynamicRange get $DynamicRange$DolbyVision10Bit =>
      DynamicRangeImpl.dolbyVision10Bit;

  @override
  DynamicRange get $DynamicRange$DolbyVision8Bit =>
      DynamicRangeImpl.dolbyVision8Bit;

  @override
  DynamicRange get $DynamicRange$Hdr10Plus10Bit =>
      DynamicRangeImpl.hdr10Plus10Bit;

  @override
  DynamicRange get $DynamicRange$Hdr10_10Bit => DynamicRangeImpl.hdr10_10Bit;

  @override
  DynamicRange get $DynamicRange$HdrUnspecified10Bit =>
      DynamicRangeImpl.hdrUnspecified10Bit;

  @override
  DynamicRange get $DynamicRange$Hlg10Bit => DynamicRangeImpl.hlg10Bit;

  @override
  DynamicRange get $DynamicRange$Sdr => DynamicRangeImpl.sdr;

  @override
  DynamicRange get $DynamicRange$Unspecifid => DynamicRangeImpl.unspecifid;

  @override
  FaceDetector $FaceDetector() => FaceDetectorImpl();

  @override
  FaceDetector $FaceDetector$Options(FaceDetectorOptions options) =>
      FaceDetectorImpl.options(options);

  @override
  Future<double> $MeteringPointFactory$GetDefaultPointSize() =>
      MeteringPointFactoryImpl.getDefaultPointSize();

  @override
  Observer<T> $Observer<T>({required void Function(T value) onChanged}) =>
      ObserverImpl(onChanged: onChanged);

  @override
  Quality get $Quality$Fhd => QualityImpl.fhd;

  @override
  Quality get $Quality$Hd => QualityImpl.hd;

  @override
  Quality get $Quality$Highest => QualityImpl.highest;

  @override
  Quality get $Quality$Lowest => QualityImpl.lowest;

  @override
  Quality get $Quality$Sd => QualityImpl.sd;

  @override
  Quality get $Quality$Uhd => QualityImpl.uhd;

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
}
