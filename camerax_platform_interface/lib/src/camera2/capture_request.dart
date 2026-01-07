import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CaptureRequest$Key<T> {
  Future<String> getName();
}

abstract interface class CaptureRequest
    implements CameraMetadata<CaptureRequest$Key> {
  // static CaptureRequest$Key<bool> get blackLevelLock;
  // static CaptureRequest$Key<int> get colorCorrectionAberrationMode;
  // static CaptureRequest$Key<int> get colorCorrectionColorTemprature;
  // static CaptureRequest$Key<int> get colorCorrectionColorTint;
  // static CaptureRequest$Key<RggbChannelVector> get colorCorrectionGains;
  // static CaptureRequest$Key<int> get colorCorrectionMode;
  // static CaptureRequest$Key<ColorSpaceTransform> get colorCorrectionTransform;
  // static CaptureRequest$Key<int> get controlAeAntibandingMode;
  // static CaptureRequest$Key<int> get controlAeExposureCompensation;
  static CaptureRequest$Key<bool> get controlAeLock =>
      CaptureRequestChannel.instance.controlAeLock;
  static CaptureRequest$Key<CameraMetadata$ControlAeMode> get controlAeMode =>
      CaptureRequestChannel.instance.controlAeMode;
  // static CaptureRequest$Key<int> get controlAePrecaptureTrigger;
  // static CaptureRequest$Key<int> get controlAePriorityMode;
  // static CaptureRequest$Key<List<MeteringRectangle>> get controlAeRegions;
  // static CaptureRequest$Key<Range<int>> get controlAeTargetFpsRange;
  static CaptureRequest$Key<CameraMetadata$ControlAfMode> get controlAfMode =>
      CaptureRequestChannel.instance.controlAfMode;
  // static CaptureRequest$Key<List<MeteringRectangle>> get controlAfRegions;
  // static CaptureRequest$Key<int> get controlAfTrigger;
  // static CaptureRequest$Key<int> get controlAutoframing;
  static CaptureRequest$Key<bool> get controlAwbLock =>
      CaptureRequestChannel.instance.controlAwbLock;
  static CaptureRequest$Key<CameraMetadata$ControlAwbMode> get controlAwbMode =>
      CaptureRequestChannel.instance.controlAwbMode;
  // static CaptureRequest$Key<List<MeteringRectangle>> get controlAwbRegions;
  // static CaptureRequest$Key<int> get controlCaptureIntent;
  // static CaptureRequest$Key<int> get controlEffectMode;
  // static CaptureRequest$Key<bool> get controlEnableZsl;
  // static CaptureRequest$Key<int> get controlExtendedSceneMode;
  static CaptureRequest$Key<CameraMetadata$ControlMode> get controlMode =>
      CaptureRequestChannel.instance.controlMode;
  // static CaptureRequest$Key<int> get controlPostRawSensitivityBoost;
  // static CaptureRequest$Key<int> get controlSceneMode;
  // static CaptureRequest$Key<int> get controlSettingsOverride;
  // static CaptureRequest$Key<int> get controlVideoStabilizationMode;
  // static CaptureRequest$Key<int> get controlZoomMethod;
  // static CaptureRequest$Key<double> get controlZoomRatio;
  // static CaptureRequest$Key<int> get distortionCorrectionMode;
  // static CaptureRequest$Key<int> get edgeMode;
  // static CaptureRequest$Key<int> get extensionStrength;
  // static CaptureRequest$Key<int> get flashMode;
  // static CaptureRequest$Key<int> get flashStrengthLevel;
  // static CaptureRequest$Key<int> get hotPixelMode;
  // static CaptureRequest$Key<Location> get jpegGpsLocation;
  // static CaptureRequest$Key<int> get jpegOrientation;
  // static CaptureRequest$Key<int> get jpegQuality;
  // static CaptureRequest$Key<int> get jpegThumbnailQuality;
  // static CaptureRequest$Key<Size<int>> get jpegThumbnailSize;
  static CaptureRequest$Key<double> get lensAperture =>
      CaptureRequestChannel.instance.lensAperture;
  // static CaptureRequest$Key<double> get lensFilterDensity;
  // static CaptureRequest$Key<double> get lensFocalLength;
  // static CaptureRequest$Key<double> get lensFocusDistance;
  // static CaptureRequest$Key<int> get lensOpticalStabilizationMode;
  // static CaptureRequest$Key<int> get noiseReductionMode;
  // static CaptureRequest$Key<double> get reprocessEffectiveExposureFactor;
  // static CaptureRequest$Key<Rect<int>> get scalerCropRegion;
  // static CaptureRequest$Key<int> get scalerRotateAndCrop;
  static CaptureRequest$Key<int> get sensorExposureTime =>
      CaptureRequestChannel.instance.sensorExposureTime;
  // static CaptureRequest$Key<int> get sensorFrameDuration;
  // static CaptureRequest$Key<int> get sensorPixelMode;
  static CaptureRequest$Key<int> get sensorSensitivity =>
      CaptureRequestChannel.instance.sensorSensitivity;
  // static CaptureRequest$Key<List<int>> get sensorTestPatternData;
  // static CaptureRequest$Key<int> get sensorTestPatternMode;
  // static CaptureRequest$Key<int> get shadingMode;
  // static CaptureRequest$Key<int> get statisticsFaceDetectMode;
  // static CaptureRequest$Key<bool> get statisticsHotPixelMapMode;
  // static CaptureRequest$Key<int> get statisticsLensShadingMapMode;
  // static CaptureRequest$Key<int> get statisticsOisDataMode;
  // static CaptureRequest$Key<TonemapCurve> get tonemapCurve;
  // static CaptureRequest$Key<double> get tonemapGamma;
  // static CaptureRequest$Key<int> get tonemapMode;
  // static CaptureRequest$Key<int> get tonemapPresetCurve;

  Future<T?> get<T>(CaptureRequest$Key<T> key);
  // Future<List<CaptureRequest$Key>> getKeys();
  // Future<Object?> getTag();
  Future<bool> isReprocess();
}

abstract base class CaptureRequestChannel extends PlatformInterface {
  CaptureRequestChannel() : super(token: _token);

  static final _token = Object();

  static CaptureRequestChannel? _instance;

  static CaptureRequestChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CaptureRequestChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  // CaptureRequest$Key<bool> get blackLevelLock;
  // CaptureRequest$Key<int> get colorCorrectionAberrationMode;
  // CaptureRequest$Key<int> get colorCorrectionColorTemprature;
  // CaptureRequest$Key<int> get colorCorrectionColorTint;
  // CaptureRequest$Key<RggbChannelVector> get colorCorrectionGains;
  // CaptureRequest$Key<int> get colorCorrectionMode;
  // CaptureRequest$Key<ColorSpaceTransform> get colorCorrectionTransform;
  // CaptureRequest$Key<int> get controlAeAntibandingMode;
  // CaptureRequest$Key<int> get controlAeExposureCompensation;
  CaptureRequest$Key<bool> get controlAeLock;
  CaptureRequest$Key<CameraMetadata$ControlAeMode> get controlAeMode;
  // CaptureRequest$Key<int> get controlAePrecaptureTrigger;
  // CaptureRequest$Key<int> get controlAePriorityMode;
  // CaptureRequest$Key<List<MeteringRectangle>> get controlAeRegions;
  // CaptureRequest$Key<Range<int>> get controlAeTargetFpsRange;
  CaptureRequest$Key<CameraMetadata$ControlAfMode> get controlAfMode;
  // CaptureRequest$Key<List<MeteringRectangle>> get controlAfRegions;
  // CaptureRequest$Key<int> get controlAfTrigger;
  // CaptureRequest$Key<int> get controlAutoframing;
  CaptureRequest$Key<bool> get controlAwbLock;
  CaptureRequest$Key<CameraMetadata$ControlAwbMode> get controlAwbMode;
  // CaptureRequest$Key<List<MeteringRectangle>> get controlAwbRegions;
  // CaptureRequest$Key<int> get controlCaptureIntent;
  // CaptureRequest$Key<int> get controlEffectMode;
  // CaptureRequest$Key<bool> get controlEnableZsl;
  // CaptureRequest$Key<int> get controlExtendedSceneMode;
  CaptureRequest$Key<CameraMetadata$ControlMode> get controlMode;
  // CaptureRequest$Key<int> get controlPostRawSensitivityBoost;
  // CaptureRequest$Key<int> get controlSceneMode;
  // CaptureRequest$Key<int> get controlSettingsOverride;
  // CaptureRequest$Key<int> get controlVideoStabilizationMode;
  // CaptureRequest$Key<int> get controlZoomMethod;
  // CaptureRequest$Key<double> get controlZoomRatio;
  // CaptureRequest$Key<int> get distortionCorrectionMode;
  // CaptureRequest$Key<int> get edgeMode;
  // CaptureRequest$Key<int> get extensionStrength;
  // CaptureRequest$Key<int> get flashMode;
  // CaptureRequest$Key<int> get flashStrengthLevel;
  // CaptureRequest$Key<int> get hotPixelMode;
  // CaptureRequest$Key<Location> get jpegGpsLocation;
  // CaptureRequest$Key<int> get jpegOrientation;
  // CaptureRequest$Key<int> get jpegQuality;
  // CaptureRequest$Key<int> get jpegThumbnailQuality;
  // CaptureRequest$Key<Size<int>> get jpegThumbnailSize;
  CaptureRequest$Key<double> get lensAperture;
  // CaptureRequest$Key<double> get lensFilterDensity;
  // CaptureRequest$Key<double> get lensFocalLength;
  // CaptureRequest$Key<double> get lensFocusDistance;
  // CaptureRequest$Key<int> get lensOpticalStabilizationMode;
  // CaptureRequest$Key<int> get noiseReductionMode;
  // CaptureRequest$Key<double> get reprocessEffectiveExposureFactor;
  // CaptureRequest$Key<Rect<int>> get scalerCropRegion;
  // CaptureRequest$Key<int> get scalerRotateAndCrop;
  CaptureRequest$Key<int> get sensorExposureTime;
  // CaptureRequest$Key<int> get sensorFrameDuration;
  // CaptureRequest$Key<int> get sensorPixelMode;
  CaptureRequest$Key<int> get sensorSensitivity;
  // CaptureRequest$Key<List<int>> get sensorTestPatternData;
  // CaptureRequest$Key<int> get sensorTestPatternMode;
  // CaptureRequest$Key<int> get shadingMode;
  // CaptureRequest$Key<int> get statisticsFaceDetectMode;
  // CaptureRequest$Key<bool> get statisticsHotPixelMapMode;
  // CaptureRequest$Key<int> get statisticsLensShadingMapMode;
  // CaptureRequest$Key<int> get statisticsOisDataMode;
  // CaptureRequest$Key<TonemapCurve> get tonemapCurve;
  // CaptureRequest$Key<double> get tonemapGamma;
  // CaptureRequest$Key<int> get tonemapMode;
  // CaptureRequest$Key<int> get tonemapPresetCurve;
}
