import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraCharacteristics$KeyImpl<T>
    implements CameraCharacteristics$Key<T> {
  final CameraCharacteristicsKeyProxyApi api;

  CameraCharacteristics$KeyImpl.internal(this.api);

  @override
  Future<String> getName() => api.getName();
}

final class CameraCharacteristicsImpl implements CameraCharacteristics {}

final class CameraCharacteristicsChannelImpl
    extends CameraCharacteristicsChannel {
  @override
  CameraCharacteristics$Key<List<CameraMetadata$ControlAeMode>>
  get controlAeAvailableModes => CameraCharacteristics$KeyImpl.internal(
    CameraCharacteristicsProxyApi.controlAeAvailableModes,
  );

  @override
  CameraCharacteristics$Key<bool> get controlAeLockAvailable =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.controlAeLockAvailable,
      );

  @override
  CameraCharacteristics$Key<List<CameraMetadata$ControlAfMode>>
  get controlAfAvailableModes => CameraCharacteristics$KeyImpl.internal(
    CameraCharacteristicsProxyApi.controlAfAvailableModes,
  );

  @override
  CameraCharacteristics$Key<List<CameraMetadata$ControlMode>>
  get controlAvailableModes => CameraCharacteristics$KeyImpl.internal(
    CameraCharacteristicsProxyApi.controlAvailableModes,
  );

  @override
  CameraCharacteristics$Key<List<CameraMetadata$ControlAwbMode>>
  get controlAwbAvailableModes => CameraCharacteristics$KeyImpl.internal(
    CameraCharacteristicsProxyApi.controlAwbAvailableModes,
  );

  @override
  CameraCharacteristics$Key<bool> get controlAwbLockAvailable =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.controlAwbLockAvailable,
      );

  @override
  CameraCharacteristics$Key<CameraMetadata$InfoSupportedHardwareLevel>
  get infoSupportedHardwareLevel => CameraCharacteristics$KeyImpl.internal(
    CameraCharacteristicsProxyApi.infoSupportedHardwareLevel,
  );

  @override
  CameraCharacteristics$Key<String> get infoVersion =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.infoVersion,
      );

  @override
  CameraCharacteristics$Key<List<double>> get lensInfoAvailableApertures =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.lensInfoAvailableApertures,
      );

  @override
  CameraCharacteristics$Key<Range<int>> get sensorInfoExposureTimeRange =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.sensorInfoExposureTimeRange,
      );

  @override
  CameraCharacteristics$Key<Range<int>> get sensorInfoSensitivityRange =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.sensorInfoSensitivityRange,
      );

  @override
  CameraCharacteristics$Key<int> get sensorOrientation =>
      CameraCharacteristics$KeyImpl.internal(
        CameraCharacteristicsProxyApi.sensorOrientation,
      );
}

extension CameraCharacteristics$KeyX on CameraCharacteristics$Key {
  CameraCharacteristicsKeyProxyApi get api {
    final impl = this;
    if (impl is! CameraCharacteristics$KeyImpl) throw TypeError();
    return impl.api;
  }
}
