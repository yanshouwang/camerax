import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CaptureResult$Key<T> {
  Future<String> getName();
}

abstract interface class CaptureResult
    implements CameraMetadata<CaptureResult$Key> {
  // static CaptureResult$Key<bool> get blackLevelLock;
  // static CaptureResult$Key<int> get colorCorrectionAberrationMode;
  // static CaptureResult$Key<int> get colorCorrectionColorTemperature;
  // static CaptureResult$Key<int> get colorCorrectionColorTint;
  // static CaptureResult$Key<RggbChannelVector> get colorCorrectionGains;
  // static CaptureResult$Key<int> get colorCorrectionMode;
  // static CaptureResult$Key<ColorSpaceTransform> get colorCorrectioinTransform;
  // static CaptureResult$Key<int> get controlAeAntibandingMode;
  // static CaptureResult$Key<int> get controlAeExposureCompensation;
  static CaptureResult$Key<bool> get controlAeLock =>
      CaptureResultChannel.instance.controlAeLock;
  static CaptureResult$Key<CameraMetadata$ControlAeMode> get controlAeMode =>
      CaptureResultChannel.instance.controlAeMode;
  // static CaptureResult$Key<int> get controlAePrecaptureTrigger;
  // static CaptureResult$Key<int> get controlAePriorityMode;
  // static CaptureResult$Key<List<MeteringRectangle>> get controlAeRegions;
  // static CaptureResult$Key<int> get controlAeState;
  // static CaptureResult$Key<Range<int>> get controlAeTargetFpsRange;
  static CaptureResult$Key<CameraMetadata$ControlAfMode> get controlAfMode =>
      CaptureResultChannel.instance.controlAfMode;
  // static CaptureResult$Key<List<MeteringRectangle>> get controlAfRegions;
  // static CaptureResult$Key<int> get controlAfSceneChange;
  // static CaptureResult$Key<int> get controlAfState;
  // static CaptureResult$Key<int> get controlAfTrigger;
  // static CaptureResult$Key<int> get controlAutoframing;
  // static CaptureResult$Key<int> get controlAutoframingState;
  static CaptureResult$Key<bool> get controlAwbLock =>
      CaptureResultChannel.instance.controlAwbLock;
  static CaptureResult$Key<CameraMetadata$ControlAwbMode> get controlAwbMode =>
      CaptureResultChannel.instance.controlAwbMode;
  // static CaptureResult$Key<List<MeteringRectangle>> get controlAwbRegions;
  // static CaptureResult$Key<int> get controlAwbState;
  // static CaptureResult$Key<int> get controlCaptureIntent;
  // static CaptureResult$Key<int> get controlEffectMode;
  // static CaptureResult$Key<bool> get controlEnableZsl;
  // static CaptureResult$Key<int> get controlExtendedSceneMode;
  // static CaptureResult$Key<int> get controlLowLightBoostState;
  static CaptureResult$Key<CameraMetadata$ControlMode> get controlMode =>
      CaptureResultChannel.instance.controlMode;
  // static CaptureResult$Key<int> get controlPostRawSensitivityBoost;
  // static CaptureResult$Key<int> get controlSceneMode;
  // static CaptureResult$Key<int> get controlSettingsOverride;
  // static CaptureResult$Key<int> get controlVideoStabilizationMode;
  // static CaptureResult$Key<int> get controlZoomMethod;
  // static CaptureResult$Key<double> get controlZoomRatio;
  // static CaptureResult$Key<int> get distortionCorrectionMode;
  // static CaptureResult$Key<int> get edgeMode;
  // static CaptureResult$Key<int> get extensionCurrentType;
  // static CaptureResult$Key<int> get extensionNightModeIndicator;
  // static CaptureResult$Key<int> get extensionStrength;
  // static CaptureResult$Key<int> get flashMode;
  // static CaptureResult$Key<int> get flashState;
  // static CaptureResult$Key<int> get flashStrengthLevel;
  // static CaptureResult$Key<int> get hotPixelMode;
  // static CaptureResult$Key<Location> get jpegGpsLocation;
  // static CaptureResult$Key<int> get jpegOrientation;
  // static CaptureResult$Key<int> get jpegQuality;
  // static CaptureResult$Key<int> get jpegThumbnailQuality;
  // static CaptureResult$Key<Size<int>> get jpegThumbnailSize;
  static CaptureResult$Key<double> get lensAperture =>
      CaptureResultChannel.instance.lensAperture;
  // static CaptureResult$Key<List<double>> get lensDistortion;
  // static CaptureResult$Key<double> get lensFilterDensity;
  // static CaptureResult$Key<double> get lensFocalLength;
  // static CaptureResult$Key<double> get lensFocusDistance;
  // static CaptureResult$Key<(double, double)> get lensFocusRange;
  // static CaptureResult$Key<List<double>> get lensIntrinsicCalibration;
  // static CaptureResult$Key<int> get lensOpticalStabilizationMode;
  // static CaptureResult$Key<List<double>> get lensPoseRotation;
  // static CaptureResult$Key<List<double>> get lensPoseTranslation;
  // static CaptureResult$Key<List<double>> get lensRadialDistortion;
  // static CaptureResult$Key<int> get lensState;
  // static CaptureResult$Key<String> get logicalMultiCameraActivePhysicalId;
  // static CaptureResult$Key<Rect<int>>
  // get logicalMultiCameraActivePhysicalSensorCropRegion;
  // static CaptureResult$Key<int> get noiseReductionMode;
  // static CaptureResult$Key<double> get reprocessEffectiveExposureFactor;
  // static CaptureResult$Key<int> get requestPipelineDepth;
  // static CaptureResult$Key<Rect<int>> get scalerCropRegion;
  // static CaptureResult$Key<Rect<int>> get scalerRawCropRegion;
  // static CaptureResult$Key<int> get scalerRotateAndCrop;
  // static CaptureResult$Key<List<double>> get sensorDynamicBlackLevel;
  // static CaptureResult$Key<int> get sensorDynamicWhiteLevel;
  static CaptureResult$Key<int> get sensorExposureTime =>
      CaptureResultChannel.instance.sensorExposureTime;
  // static CaptureResult$Key<int> get sensorFrameDuration;
  // static CaptureResult$Key<double> get sensorGreenSplit;
  // static CaptureResult$Key<List<Rational>> get sensorNeutralColorPoint;
  // static CaptureResult$Key<List<(double, double)>> get sensorNoiseProfile;
  // static CaptureResult$Key<int> get sensorPixelMode;
  // static CaptureResult$Key<bool> get sensorRawBinningFactorUsed;
  // static CaptureResult$Key<int> get sensorRollingShutterSkew;
  static CaptureResult$Key<int> get sensorSensitivity =>
      CaptureResultChannel.instance.sensorSensitivity;
  // static CaptureResult$Key<List<int>> get sensorTestPatternData;
  // static CaptureResult$Key<int> get sensorTestPatternMode;
  // static CaptureResult$Key<int> get sensorTimestamp;
  // static CaptureResult$Key<int> get shadingMode;
  // static CaptureResult$Key<List<Face>> get statisticsFaces;
  // static CaptureResult$Key<int> get statisticsFaceDetectMode;
  // static CaptureResult$Key<List<Point<int>>> get statisticsHotPixelMap;
  // static CaptureResult$Key<bool> get statisticsHotPixelMapMode;
  // static CaptureResult$Key<List<LensIntrinsicsSample>>
  // get statisticsLensIntrinsicsSamples;
  // static CaptureResult$Key<LensShadingMap> get statisticsLensShadingCorrectionMap;
  // static CaptureResult$Key<int> get statisticsLensShadingMapMode;
  // static CaptureResult$Key<int> get statisticsOisDataMode;
  // static CaptureResult$Key<List<OisSample>> get statisticsOisSamples;
  // static CaptureResult$Key<int> get statisticsSceneFlicker;
  // static CaptureResult$Key<TonemapCurve> get tonemapCurve;
  // static CaptureResult$Key<double> get tonemapGamma;
  // static CaptureResult$Key<int> get tonemapMode;
  // static CaptureResult$Key<int> get tonemapPresetCurve;

  Future<T?> get<T>(CaptureResult$Key<T> key);
  Future<String> getCameraId();
  Future<int> getFrameNumber();
  // Future<List<CaptureResult$Key>> getKeys();
  Future<CaptureRequest> getRequest();
  Future<int> getSequenceId();
}

abstract base class CaptureResultChannel extends PlatformInterface {
  CaptureResultChannel() : super(token: _token);

  static final _token = Object();

  static CaptureResultChannel? _instance;

  static CaptureResultChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CaptureResultChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  // CaptureResult$Key<bool> get blackLevelLock;
  // CaptureResult$Key<int> get colorCorrectionAberrationMode;
  // CaptureResult$Key<int> get colorCorrectionColorTemperature;
  // CaptureResult$Key<int> get colorCorrectionColorTint;
  // CaptureResult$Key<RggbChannelVector> get colorCorrectionGains;
  // CaptureResult$Key<int> get colorCorrectionMode;
  // CaptureResult$Key<ColorSpaceTransform> get colorCorrectioinTransform;
  // CaptureResult$Key<int> get controlAeAntibandingMode;
  // CaptureResult$Key<int> get controlAeExposureCompensation;
  CaptureResult$Key<bool> get controlAeLock;
  CaptureResult$Key<CameraMetadata$ControlAeMode> get controlAeMode;
  // CaptureResult$Key<int> get controlAePrecaptureTrigger;
  // CaptureResult$Key<int> get controlAePriorityMode;
  // CaptureResult$Key<List<MeteringRectangle>> get controlAeRegions;
  // CaptureResult$Key<int> get controlAeState;
  // CaptureResult$Key<Range<int>> get controlAeTargetFpsRange;
  CaptureResult$Key<CameraMetadata$ControlAfMode> get controlAfMode;
  // CaptureResult$Key<List<MeteringRectangle>> get controlAfRegions;
  // CaptureResult$Key<int> get controlAfSceneChange;
  // CaptureResult$Key<int> get controlAfState;
  // CaptureResult$Key<int> get controlAfTrigger;
  // CaptureResult$Key<int> get controlAutoframing;
  // CaptureResult$Key<int> get controlAutoframingState;
  CaptureResult$Key<bool> get controlAwbLock;
  CaptureResult$Key<CameraMetadata$ControlAwbMode> get controlAwbMode;
  // CaptureResult$Key<List<MeteringRectangle>> get controlAwbRegions;
  // CaptureResult$Key<int> get controlAwbState;
  // CaptureResult$Key<int> get controlCaptureIntent;
  // CaptureResult$Key<int> get controlEffectMode;
  // CaptureResult$Key<bool> get controlEnableZsl;
  // CaptureResult$Key<int> get controlExtendedSceneMode;
  // CaptureResult$Key<int> get controlLowLightBoostState;
  CaptureResult$Key<CameraMetadata$ControlMode> get controlMode;
  // CaptureResult$Key<int> get controlPostRawSensitivityBoost;
  // CaptureResult$Key<int> get controlSceneMode;
  // CaptureResult$Key<int> get controlSettingsOverride;
  // CaptureResult$Key<int> get controlVideoStabilizationMode;
  // CaptureResult$Key<int> get controlZoomMethod;
  // CaptureResult$Key<double> get controlZoomRatio;
  // CaptureResult$Key<int> get distortionCorrectionMode;
  // CaptureResult$Key<int> get edgeMode;
  // CaptureResult$Key<int> get extensionCurrentType;
  // CaptureResult$Key<int> get extensionNightModeIndicator;
  // CaptureResult$Key<int> get extensionStrength;
  // CaptureResult$Key<int> get flashMode;
  // CaptureResult$Key<int> get flashState;
  // CaptureResult$Key<int> get flashStrengthLevel;
  // CaptureResult$Key<int> get hotPixelMode;
  // CaptureResult$Key<Location> get jpegGpsLocation;
  // CaptureResult$Key<int> get jpegOrientation;
  // CaptureResult$Key<int> get jpegQuality;
  // CaptureResult$Key<int> get jpegThumbnailQuality;
  // CaptureResult$Key<Size<int>> get jpegThumbnailSize;
  CaptureResult$Key<double> get lensAperture;
  // CaptureResult$Key<List<double>> get lensDistortion;
  // CaptureResult$Key<double> get lensFilterDensity;
  // CaptureResult$Key<double> get lensFocalLength;
  // CaptureResult$Key<double> get lensFocusDistance;
  // CaptureResult$Key<(double, double)> get lensFocusRange;
  // CaptureResult$Key<List<double>> get lensIntrinsicCalibration;
  // CaptureResult$Key<int> get lensOpticalStabilizationMode;
  // CaptureResult$Key<List<double>> get lensPoseRotation;
  // CaptureResult$Key<List<double>> get lensPoseTranslation;
  // CaptureResult$Key<List<double>> get lensRadialDistortion;
  // CaptureResult$Key<int> get lensState;
  // CaptureResult$Key<String> get logicalMultiCameraActivePhysicalId;
  // CaptureResult$Key<Rect<int>>
  // get logicalMultiCameraActivePhysicalSensorCropRegion;
  // CaptureResult$Key<int> get noiseReductionMode;
  // CaptureResult$Key<double> get reprocessEffectiveExposureFactor;
  // CaptureResult$Key<int> get requestPipelineDepth;
  // CaptureResult$Key<Rect<int>> get scalerCropRegion;
  // CaptureResult$Key<Rect<int>> get scalerRawCropRegion;
  // CaptureResult$Key<int> get scalerRotateAndCrop;
  // CaptureResult$Key<List<double>> get sensorDynamicBlackLevel;
  // CaptureResult$Key<int> get sensorDynamicWhiteLevel;
  CaptureResult$Key<int> get sensorExposureTime;
  // CaptureResult$Key<int> get sensorFrameDuration;
  // CaptureResult$Key<double> get sensorGreenSplit;
  // CaptureResult$Key<List<Rational>> get sensorNeutralColorPoint;
  // CaptureResult$Key<List<(double, double)>> get sensorNoiseProfile;
  // CaptureResult$Key<int> get sensorPixelMode;
  // CaptureResult$Key<bool> get sensorRawBinningFactorUsed;
  // CaptureResult$Key<int> get sensorRollingShutterSkew;
  CaptureResult$Key<int> get sensorSensitivity;
  // CaptureResult$Key<List<int>> get sensorTestPatternData;
  // CaptureResult$Key<int> get sensorTestPatternMode;
  // CaptureResult$Key<int> get sensorTimestamp;
  // CaptureResult$Key<int> get shadingMode;
  // CaptureResult$Key<List<Face>> get statisticsFaces;
  // CaptureResult$Key<int> get statisticsFaceDetectMode;
  // CaptureResult$Key<List<Point<int>>> get statisticsHotPixelMap;
  // CaptureResult$Key<bool> get statisticsHotPixelMapMode;
  // CaptureResult$Key<List<LensIntrinsicsSample>>
  // get statisticsLensIntrinsicsSamples;
  // CaptureResult$Key<LensShadingMap> get statisticsLensShadingCorrectionMap;
  // CaptureResult$Key<int> get statisticsLensShadingMapMode;
  // CaptureResult$Key<int> get statisticsOisDataMode;
  // CaptureResult$Key<List<OisSample>> get statisticsOisSamples;
  // CaptureResult$Key<int> get statisticsSceneFlicker;
  // CaptureResult$Key<TonemapCurve> get tonemapCurve;
  // CaptureResult$Key<double> get tonemapGamma;
  // CaptureResult$Key<int> get tonemapMode;
  // CaptureResult$Key<int> get tonemapPresetCurve;
}
