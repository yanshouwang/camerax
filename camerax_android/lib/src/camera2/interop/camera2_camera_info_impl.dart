import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class Camera2CameraInfoImpl implements Camera2CameraInfo {
  final Camera2CameraInfoProxyApi api;

  Camera2CameraInfoImpl.internal(this.api);

  @override
  Future<String> getCameraId() => api.getCameraId();

  @override
  Future<T?> getCameraCharacteristic<T>(CameraCharacteristics$Key<T> key) {
    final keyApi = key.api;
    if (keyApi is CameraCharacteristicsStringKeyProxyApi) {
      return api.getStringCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsIntKeyProxyApi) {
      return api.getIntCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsBooleanKeyProxyApi) {
      return api.getBooleanCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsIntArrayKeyProxyApi) {
      return api.getIntArrayCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsFloatArrayKeyProxyApi) {
      return api.getFloatArrayCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsIntRangeKeyProxyApi) {
      return api
          .getIntRangeCameraCharacteristic(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi is CameraCharacteristicsLongRangeKeyProxyApi) {
      return api
          .getLongRangeCameraCharacteristic(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi
        is CameraCharacteristicsCameraMetadataInfoSupportedHardwareLevelKeyProxyApi) {
      return api
          .getCameraMetadataInfoSupportedHardwareLevel(keyApi)
          .then((e) => e?.impl as T?);
    }
    if (keyApi
        is CameraCharacteristicsCameraMetadataControlModeArrayKeyProxyApi) {
      return api
          .getCameraMetadataControlModeArray(keyApi)
          .then((e) => e?.map((e) => e.impl).toList() as T?);
    }
    if (keyApi
        is CameraCharacteristicsCameraMetadataControlAeModeArrayKeyProxyApi) {
      return api
          .getCameraMetadataControlAeModeArray(keyApi)
          .then((e) => e?.map((e) => e.impl).toList() as T?);
    }
    if (keyApi
        is CameraCharacteristicsCameraMetadataControlAfModeArrayKeyProxyApi) {
      return api
          .getCameraMetadataControlAfModeArray(keyApi)
          .then((e) => e?.map((e) => e.impl).toList() as T?);
    }
    if (keyApi
        is CameraCharacteristicsCameraMetadataControlAwbModeArrayKeyProxyApi) {
      return api
          .getCameraMetadataControlAwbModeArray(keyApi)
          .then((e) => e?.map((e) => e.impl).toList() as T?);
    }
    throw TypeError();
  }
}

final class Camera2CameraInfoChannelImpl extends Camera2CameraInfoChannel {
  @override
  Camera2CameraInfo from(CameraInfo cameraInfo) {
    final api = Camera2CameraInfoProxyApi.from(cameraInfo: cameraInfo.api);
    return Camera2CameraInfoImpl.internal(api);
  }
}
