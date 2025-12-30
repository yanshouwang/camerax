import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CameraCharacteristics$Key<T> {
  Future<String> getName();
}

abstract interface class CameraCharacteristics {
  // static CameraCharacteristics$Key<List<int>> get automotiveLensFacing;
  // static CameraCharacteristics$Key<int> get automotiveLocation;
  // static CameraCharacteristics$Key<List<int>>
  // get colorCorrectionAvailableAberrationModes;
  // static CameraCharacteristics$Key<List<int>> get colorCorrectionAvailableModes;
  // static CameraCharacteristics$Key<Range<int>>
  // get colorCorrectionColorTemperatureRange;
  // static CameraCharacteristics$Key<List<int>> get controlAeAvailableAntibandingModes;
  static CameraCharacteristics$Key<List<CameraMetadata$ControlAeMode>>
  get controlAeAvailableModes =>
      CameraCharacteristicsChannel.instance.controlAeAvailableModes;
  // static CameraCharacteristics$Key<List<int>> get controlAeAvailablePriorityModes;
  // static CameraCharacteristics$Key<Range<int>> get controlAeAvailableTargetFpsRanges;
  // static CameraCharacteristics$Key<Range<int>> get controlAeCompensationRange;
  // static CameraCharacteristics$Key<double> get controlAeCompensationStep;
  static CameraCharacteristics$Key<bool> get controlAeLockAvailable =>
      CameraCharacteristicsChannel.instance.controlAeLockAvailable;
  static CameraCharacteristics$Key<List<CameraMetadata$ControlAfMode>>
  get controlAfAvailableModes =>
      CameraCharacteristicsChannel.instance.controlAfAvailableModes;
  // static CameraCharacteristics$Key<bool> get controlAutoframingAvailable;
  // static CameraCharacteristics$Key<List<int>> get controlAvailableEffects;
  // static CameraCharacteristics$Key<List<Capability>>
  // get controlAvailableExtendedSceneModeCapabilities;
  static CameraCharacteristics$Key<List<CameraMetadata$ControlMode>>
  get controlAvailableModes =>
      CameraCharacteristicsChannel.instance.controlAvailableModes;
  // static CameraCharacteristics$Key<List<int>> get controlAvailableSceneModes;
  // static CameraCharacteristics$Key<List<int>> get controlAvailableSettingsOverrides;
  // static CameraCharacteristics$Key<List<int>>
  // get controlAvailableVideoStabilizationModes;
  static CameraCharacteristics$Key<List<CameraMetadata$ControlAwbMode>>
  get controlAwbAvailableModes =>
      CameraCharacteristicsChannel.instance.controlAwbAvailableModes;
  static CameraCharacteristics$Key<bool> get controlAwbLockAvailable =>
      CameraCharacteristicsChannel.instance.controlAwbLockAvailable;
  // static CameraCharacteristics$Key<Range<double>>
  // get controlLowLightBoostInfoLuminanceRange;
  // static CameraCharacteristics$Key<int> get controlMaxRegionsAe;
  // static CameraCharacteristics$Key<int> get controlMaxRegionsAf;
  // static CameraCharacteristics$Key<int> get controlMaxRegionsAwb;
  // static CameraCharacteristics$Key<Range<int>> get controlPostRawSensitivityBoostRange;
  // static CameraCharacteristics$Key<Range<double>> get controlZoomRatioRange;
  // static CameraCharacteristics$Key<bool> get depthDepthIsExclusive;
  // static CameraCharacteristics$Key<List<int>> get distortionCorrectionAvailableModes;
  // static CameraCharacteristics$Key<List<int>> get edgeAvailableEdgeModes;
  // static CameraCharacteristics$Key<bool> get flashInfoAvailable;
  // static CameraCharacteristics$Key<int> get flashInfoStrengthDefaultLevel;
  // static CameraCharacteristics$Key<int> get flashInfoStrengthMaximumLevel;
  // static CameraCharacteristics$Key<int> get flashSingleStrengthDefaultLevel;
  // static CameraCharacteristics$Key<int> get flashSingleStrengthMaxLevel;
  // static CameraCharacteristics$Key<int> get flashTorchStrengthDefaultLevel;
  // static CameraCharacteristics$Key<int> get flashTorchStrengthMaxLevel;
  // static CameraCharacteristics$Key<List<int>> get hotPixelAvailableHotPixelModes;
  // static CameraCharacteristics$Key<DeviceStateSensorOrientationMap>
  // get infoDeviceStateSensorOrientationMap;
  // static CameraCharacteristics$Key<int> get infoSessionConfigurationQueryVersion;
  static CameraCharacteristics$Key<CameraMetadata$InfoSupportedHardwareLevel>
  get infoSupportedHardwareLevel =>
      CameraCharacteristicsChannel.instance.infoSupportedHardwareLevel;
  static CameraCharacteristics$Key<String> get infoVersion =>
      CameraCharacteristicsChannel.instance.infoVersion;
  // static CameraCharacteristics$Key<List<Size<int>>> get jpegAvailableThumbnailSizes;
  // static CameraCharacteristics$Key<List<double>> get lensDistortion;
  // static CameraCharacteristics$Key<List<double>> get lensDistortionMaximumResolution;
  // static CameraCharacteristics$Key<int> get lensFacing;
  static CameraCharacteristics$Key<List<double>>
  get lensInfoAvailableApertures =>
      CameraCharacteristicsChannel.instance.lensInfoAvailableApertures;
  // static CameraCharacteristics$Key<List<double>> get lensInfoAvailableFilterDensities;
  // static CameraCharacteristics$Key<List<double>> get lensInfoAvailableFocalLengths;
  // static CameraCharacteristics$Key<List<int>>
  // get lensInfoAvailableOpticalStabilization;
  // static CameraCharacteristics$Key<int> get lensInfoFocusDistanceCalibration;
  // static CameraCharacteristics$Key<double> get lensInfoHyperfocalDistance;
  // static CameraCharacteristics$Key<double> get lensInfoMinimumFocusDistance;
  // static CameraCharacteristics$Key<List<double>> get lensIntrinsicCalibration;
  // static CameraCharacteristics$Key<List<double>>
  // get lensIntrinsicCalibrationMaximumResolution;
  // static CameraCharacteristics$Key<int> get lensPoseReference;
  // static CameraCharacteristics$Key<List<double>> get lensPoseRotation;
  // static CameraCharacteristics$Key<List<double>> get lensPoseTranslation;
  // static CameraCharacteristics$Key<List<double>> get lensRadialDistortion;
  // static CameraCharacteristics$Key<int> get logicalMultiCameraSensorSyncType;
  // static CameraCharacteristics$Key<List<int>>
  // get noiseReductionAvailableNoiseReductionModes;
  // static CameraCharacteristics$Key<int> get reprocessMaxCaptureStall;
  // static CameraCharacteristics$Key<List<int>> get requestAvailableCapabilities;
  // static CameraCharacteristics$Key<ColorSpaceProfiles>
  // get requestAvailableColorSpaceProfiles;
  // static CameraCharacteristics$Key<DynamicRangeProfiles>
  // get requestAvailableDynamicRangeProfiles;
  // static CameraCharacteristics$Key<int> get requestMaxNumInputStreams;
  // static CameraCharacteristics$Key<int> get requestMaxNumOutputProc;
  // static CameraCharacteristics$Key<int> get requestMaxNumOutputProcStalling;
  // static CameraCharacteristics$Key<int> get requestMaxNumOutputProcRaw;
  // static CameraCharacteristics$Key<int> get requestPartialResultCount;
  // static CameraCharacteristics$Key<int> get requestPipelineMaxDepth;
  // static CameraCharacteristics$Key<int>
  // get requestRecommendedTenBitDynamicRangeProfile;
  // static CameraCharacteristics$Key<double> get scalerAvailableMaxDigitalZoom;
  // static CameraCharacteristics$Key<List<int>> get scalerAvailableRotateAndCropModes;
  // static CameraCharacteristics$Key<List<int>> get scalerAvailableStreamUseCases;
  // static CameraCharacteristics$Key<int> get scalerCroppingType;
  // static CameraCharacteristics$Key<Size<int>> get scalerDefaultSecureImageSize;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryConcurrentStreamCombinations;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryMaximumResolutionStreamCombinations;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryPreviewStabilizationOutputStreamCombinations;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryStreamCombinations;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryTenBitOutputStreamCombinations;
  // static CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryUseCaseStreamCombinations;
  // static CameraCharacteristics$Key<MultiResolutionStreamConfigurationMap>
  // get scalerMultiResolutionStreamConfigurationMap;
  // static CameraCharacteristics$Key<StreamConfigurationMap>
  // get scalerStreamConfigurationMap;
  // static CameraCharacteristics$Key<StreamConfigurationMap>
  // get scalerStreamConfigurationMapMaximumResolution;
  // static CameraCharacteristics$Key<List<int>> get sensorAvailableTestPatternModes;
  // static CameraCharacteristics$Key<BlackLevelPattern> get sensorBlackLevelPattern;
  // static CameraCharacteristics$Key<ColorSpaceTransform>
  // get sensorCalibrationTransform1;
  // static CameraCharacteristics$Key<ColorSpaceTransform>
  // get sensorCalibrationTransform2;
  // static CameraCharacteristics$Key<ColorSpaceTransform> get sensorColorTransform1;
  // static CameraCharacteristics$Key<ColorSpaceTransform> get sensorColorTransform2;
  // static CameraCharacteristics$Key<ColorSpaceTransform> get sensorForwardMatrix1;
  // static CameraCharacteristics$Key<ColorSpaceTransform> get sensorForwardMatrix2;
  // static CameraCharacteristics$Key<Rect<int>> get sensorInfoActiveArraySize;
  // static CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoActiveArraySizeMaximumResolution;
  // static CameraCharacteristics$Key<Size<int>> get sensorInfoBinningFactor;
  // static CameraCharacteristics$Key<int> get sensorInfoColorFilterArrangement;
  static CameraCharacteristics$Key<Range<int>>
  get sensorInfoExposureTimeRange =>
      CameraCharacteristicsChannel.instance.sensorInfoExposureTimeRange;
  // static CameraCharacteristics$Key<bool> get sensorInfoLensShadingApplied;
  // static CameraCharacteristics$Key<int> get sensorInfoMaxFrameDuration;
  // static CameraCharacteristics$Key<Size<double>> get sensorInfoPhysicalSize;
  // static CameraCharacteristics$Key<Size<int>> get snesorInfoPixelArraySize;
  // static CameraCharacteristics$Key<Size<int>>
  // get snesorInfoPixelArraySizeMaximumResolution;
  // static CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoPreCorrectionActiveArraySize;
  // static CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoPreCorrectionActiveArraySizeMaximumResolution;
  static CameraCharacteristics$Key<Range<int>> get sensorInfoSensitivityRange =>
      CameraCharacteristicsChannel.instance.sensorInfoSensitivityRange;
  // static CameraCharacteristics$Key<int> get sensorInfoTimestampSource;
  // static CameraCharacteristics$Key<int> get sensorInfoWhiteLevel;
  // static CameraCharacteristics$Key<int> get sensorMaxAnalogSensitivity;
  // static CameraCharacteristics$Key<List<Rect<int>>> get sensorOpticalBlackRegions;
  static CameraCharacteristics$Key<int> get sensorOrientation =>
      CameraCharacteristicsChannel.instance.sensorOrientation;
  // static CameraCharacteristics$Key<int> get sensorReadoutTimestamp;
  // static CameraCharacteristics$Key<int> get sensorReferenceIlluminant1;
  // static CameraCharacteristics$Key<int> get sensorReferenceIlluminant2;
  // static CameraCharacteristics$Key<List<int>> get shadingAvailableModes;
  // static CameraCharacteristics$Key<List<int>>
  // get statisticsInfoAvailableFaceDetectModes;
  // static CameraCharacteristics$Key<List<bool>>
  // get statisticsInfoAvailableHotPixelMapModes;
  // static CameraCharacteristics$Key<List<int>>
  // get statisticsInfoAvailableLensShadingMapModes;
  // static CameraCharacteristics$Key<List<int>> get statisticsInfoAvailableOisDataModes;
  // static CameraCharacteristics$Key<int> get statisticsInfoMaxFaceCount;
  // static CameraCharacteristics$Key<int> get syncMaxLatency;
  // static CameraCharacteristics$Key<List<int>> get tonemapAvailableToneMapModes;
  // static CameraCharacteristics$Key<int> get tonemapMaxCurvePoints;

  // Future<T?> get<T>(CameraCharacteristics$Key<T> key);
  // Future<List<CaptureRequest$Key>> getAvailableCaptureRequestKeys();
  // Future<List<CaptureResult$Key>> getAvailableCaptureResultKeys();
  // Future<List<CaptureRequest$Key>> getAvailablePhysicalCameraRequestKeys();
  // Future<List<CameraCharacteristics$Key>>
  // getAvailableSessionCharacteristicsKeys();
  // Future<List<CaptureRequest$Key>> getAvailableSessionKeys();
  // Future<List<CameraCharacteristics$Key>> getKeys();
  // Future<List<CameraCharacteristics$Key>> getKeysNeedingPermission();
  // Future<Set<String>> getPhysicalCameraIds();
  // Future<RecommendedStreamConfigurationMap?>
  // getRecommendedStreamConfigurationMap(int usecase);
}

abstract base class CameraCharacteristicsChannel extends PlatformInterface {
  CameraCharacteristicsChannel() : super(token: _token);

  static final _token = Object();

  static CameraCharacteristicsChannel? _instance;

  static CameraCharacteristicsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraCharacteristicsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  // CameraCharacteristics$Key<List<int>> get automotiveLensFacing;
  // CameraCharacteristics$Key<int> get automotiveLocation;
  // CameraCharacteristics$Key<List<int>>
  // get colorCorrectionAvailableAberrationModes;
  // CameraCharacteristics$Key<List<int>> get colorCorrectionAvailableModes;
  // CameraCharacteristics$Key<Range<int>>
  // get colorCorrectionColorTemperatureRange;
  // CameraCharacteristics$Key<List<int>> get controlAeAvailableAntibandingModes;
  CameraCharacteristics$Key<List<CameraMetadata$ControlAeMode>>
  get controlAeAvailableModes;
  // CameraCharacteristics$Key<List<int>> get controlAeAvailablePriorityModes;
  // CameraCharacteristics$Key<Range<int>> get controlAeAvailableTargetFpsRanges;
  // CameraCharacteristics$Key<Range<int>> get controlAeCompensationRange;
  // CameraCharacteristics$Key<double> get controlAeCompensationStep;
  CameraCharacteristics$Key<bool> get controlAeLockAvailable;
  CameraCharacteristics$Key<List<CameraMetadata$ControlAfMode>>
  get controlAfAvailableModes;
  // CameraCharacteristics$Key<bool> get controlAutoframingAvailable;
  // CameraCharacteristics$Key<List<int>> get controlAvailableEffects;
  // CameraCharacteristics$Key<List<Capability>>
  // get controlAvailableExtendedSceneModeCapabilities;
  CameraCharacteristics$Key<List<CameraMetadata$ControlMode>>
  get controlAvailableModes;
  // CameraCharacteristics$Key<List<int>> get controlAvailableSceneModes;
  // CameraCharacteristics$Key<List<int>> get controlAvailableSettingsOverrides;
  // CameraCharacteristics$Key<List<int>>
  // get controlAvailableVideoStabilizationModes;
  CameraCharacteristics$Key<List<CameraMetadata$ControlAwbMode>>
  get controlAwbAvailableModes;
  CameraCharacteristics$Key<bool> get controlAwbLockAvailable;
  // CameraCharacteristics$Key<Range<double>>
  // get controlLowLightBoostInfoLuminanceRange;
  // CameraCharacteristics$Key<int> get controlMaxRegionsAe;
  // CameraCharacteristics$Key<int> get controlMaxRegionsAf;
  // CameraCharacteristics$Key<int> get controlMaxRegionsAwb;
  // CameraCharacteristics$Key<Range<int>> get controlPostRawSensitivityBoostRange;
  // CameraCharacteristics$Key<Range<double>> get controlZoomRatioRange;
  // CameraCharacteristics$Key<bool> get depthDepthIsExclusive;
  // CameraCharacteristics$Key<List<int>> get distortionCorrectionAvailableModes;
  // CameraCharacteristics$Key<List<int>> get edgeAvailableEdgeModes;
  // CameraCharacteristics$Key<bool> get flashInfoAvailable;
  // CameraCharacteristics$Key<int> get flashInfoStrengthDefaultLevel;
  // CameraCharacteristics$Key<int> get flashInfoStrengthMaximumLevel;
  // CameraCharacteristics$Key<int> get flashSingleStrengthDefaultLevel;
  // CameraCharacteristics$Key<int> get flashSingleStrengthMaxLevel;
  // CameraCharacteristics$Key<int> get flashTorchStrengthDefaultLevel;
  // CameraCharacteristics$Key<int> get flashTorchStrengthMaxLevel;
  // CameraCharacteristics$Key<List<int>> get hotPixelAvailableHotPixelModes;
  // CameraCharacteristics$Key<DeviceStateSensorOrientationMap>
  // get infoDeviceStateSensorOrientationMap;
  // CameraCharacteristics$Key<int> get infoSessionConfigurationQueryVersion;
  CameraCharacteristics$Key<CameraMetadata$InfoSupportedHardwareLevel>
  get infoSupportedHardwareLevel;
  CameraCharacteristics$Key<String> get infoVersion;
  // CameraCharacteristics$Key<List<Size<int>>> get jpegAvailableThumbnailSizes;
  // CameraCharacteristics$Key<List<double>> get lensDistortion;
  // CameraCharacteristics$Key<List<double>> get lensDistortionMaximumResolution;
  // CameraCharacteristics$Key<int> get lensFacing;
  CameraCharacteristics$Key<List<double>> get lensInfoAvailableApertures;
  // CameraCharacteristics$Key<List<double>> get lensInfoAvailableFilterDensities;
  // CameraCharacteristics$Key<List<double>> get lensInfoAvailableFocalLengths;
  // CameraCharacteristics$Key<List<int>>
  // get lensInfoAvailableOpticalStabilization;
  // CameraCharacteristics$Key<int> get lensInfoFocusDistanceCalibration;
  // CameraCharacteristics$Key<double> get lensInfoHyperfocalDistance;
  // CameraCharacteristics$Key<double> get lensInfoMinimumFocusDistance;
  // CameraCharacteristics$Key<List<double>> get lensIntrinsicCalibration;
  // CameraCharacteristics$Key<List<double>>
  // get lensIntrinsicCalibrationMaximumResolution;
  // CameraCharacteristics$Key<int> get lensPoseReference;
  // CameraCharacteristics$Key<List<double>> get lensPoseRotation;
  // CameraCharacteristics$Key<List<double>> get lensPoseTranslation;
  // CameraCharacteristics$Key<List<double>> get lensRadialDistortion;
  // CameraCharacteristics$Key<int> get logicalMultiCameraSensorSyncType;
  // CameraCharacteristics$Key<List<int>>
  // get noiseReductionAvailableNoiseReductionModes;
  // CameraCharacteristics$Key<int> get reprocessMaxCaptureStall;
  // CameraCharacteristics$Key<List<int>> get requestAvailableCapabilities;
  // CameraCharacteristics$Key<ColorSpaceProfiles>
  // get requestAvailableColorSpaceProfiles;
  // CameraCharacteristics$Key<DynamicRangeProfiles>
  // get requestAvailableDynamicRangeProfiles;
  // CameraCharacteristics$Key<int> get requestMaxNumInputStreams;
  // CameraCharacteristics$Key<int> get requestMaxNumOutputProc;
  // CameraCharacteristics$Key<int> get requestMaxNumOutputProcStalling;
  // CameraCharacteristics$Key<int> get requestMaxNumOutputProcRaw;
  // CameraCharacteristics$Key<int> get requestPartialResultCount;
  // CameraCharacteristics$Key<int> get requestPipelineMaxDepth;
  // CameraCharacteristics$Key<int>
  // get requestRecommendedTenBitDynamicRangeProfile;
  // CameraCharacteristics$Key<double> get scalerAvailableMaxDigitalZoom;
  // CameraCharacteristics$Key<List<int>> get scalerAvailableRotateAndCropModes;
  // CameraCharacteristics$Key<List<int>> get scalerAvailableStreamUseCases;
  // CameraCharacteristics$Key<int> get scalerCroppingType;
  // CameraCharacteristics$Key<Size<int>> get scalerDefaultSecureImageSize;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryConcurrentStreamCombinations;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryMaximumResolutionStreamCombinations;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryPreviewStabilizationOutputStreamCombinations;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryStreamCombinations;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryTenBitOutputStreamCombinations;
  // CameraCharacteristics$Key<List<MandatoryStreamCombination>>
  // get scalerMandatoryUseCaseStreamCombinations;
  // CameraCharacteristics$Key<MultiResolutionStreamConfigurationMap>
  // get scalerMultiResolutionStreamConfigurationMap;
  // CameraCharacteristics$Key<StreamConfigurationMap>
  // get scalerStreamConfigurationMap;
  // CameraCharacteristics$Key<StreamConfigurationMap>
  // get scalerStreamConfigurationMapMaximumResolution;
  // CameraCharacteristics$Key<List<int>> get sensorAvailableTestPatternModes;
  // CameraCharacteristics$Key<BlackLevelPattern> get sensorBlackLevelPattern;
  // CameraCharacteristics$Key<ColorSpaceTransform>
  // get sensorCalibrationTransform1;
  // CameraCharacteristics$Key<ColorSpaceTransform>
  // get sensorCalibrationTransform2;
  // CameraCharacteristics$Key<ColorSpaceTransform> get sensorColorTransform1;
  // CameraCharacteristics$Key<ColorSpaceTransform> get sensorColorTransform2;
  // CameraCharacteristics$Key<ColorSpaceTransform> get sensorForwardMatrix1;
  // CameraCharacteristics$Key<ColorSpaceTransform> get sensorForwardMatrix2;
  // CameraCharacteristics$Key<Rect<int>> get sensorInfoActiveArraySize;
  // CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoActiveArraySizeMaximumResolution;
  // CameraCharacteristics$Key<Size<int>> get sensorInfoBinningFactor;
  // CameraCharacteristics$Key<int> get sensorInfoColorFilterArrangement;
  CameraCharacteristics$Key<Range<int>> get sensorInfoExposureTimeRange;
  // CameraCharacteristics$Key<bool> get sensorInfoLensShadingApplied;
  // CameraCharacteristics$Key<int> get sensorInfoMaxFrameDuration;
  // CameraCharacteristics$Key<Size<double>> get sensorInfoPhysicalSize;
  // CameraCharacteristics$Key<Size<int>> get snesorInfoPixelArraySize;
  // CameraCharacteristics$Key<Size<int>>
  // get snesorInfoPixelArraySizeMaximumResolution;
  // CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoPreCorrectionActiveArraySize;
  // CameraCharacteristics$Key<Rect<int>>
  // get sensorInfoPreCorrectionActiveArraySizeMaximumResolution;
  CameraCharacteristics$Key<Range<int>> get sensorInfoSensitivityRange;
  // CameraCharacteristics$Key<int> get sensorInfoTimestampSource;
  // CameraCharacteristics$Key<int> get sensorInfoWhiteLevel;
  // CameraCharacteristics$Key<int> get sensorMaxAnalogSensitivity;
  // CameraCharacteristics$Key<List<Rect<int>>> get sensorOpticalBlackRegions;
  CameraCharacteristics$Key<int> get sensorOrientation;
  // CameraCharacteristics$Key<int> get sensorReadoutTimestamp;
  // CameraCharacteristics$Key<int> get sensorReferenceIlluminant1;
  // CameraCharacteristics$Key<int> get sensorReferenceIlluminant2;
  // CameraCharacteristics$Key<List<int>> get shadingAvailableModes;
  // CameraCharacteristics$Key<List<int>>
  // get statisticsInfoAvailableFaceDetectModes;
  // CameraCharacteristics$Key<List<bool>>
  // get statisticsInfoAvailableHotPixelMapModes;
  // CameraCharacteristics$Key<List<int>>
  // get statisticsInfoAvailableLensShadingMapModes;
  // CameraCharacteristics$Key<List<int>> get statisticsInfoAvailableOisDataModes;
  // CameraCharacteristics$Key<int> get statisticsInfoMaxFaceCount;
  // CameraCharacteristics$Key<int> get syncMaxLatency;
  // CameraCharacteristics$Key<List<int>> get tonemapAvailableToneMapModes;
  // CameraCharacteristics$Key<int> get tonemapMaxCurvePoints;
}
