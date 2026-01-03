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
      if (key is CameraCharacteristics$Key<int>) {
        return api.getIntCameraCharacteristic(keyApi).then((e) => e as T?);
      }
      if (key
          is CameraCharacteristics$Key<
            CameraMetadata$InfoSupportedHardwareLevel
          >) {
        return api
            .getIntCameraCharacteristic(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : CameraMetadataUtilProxyApi.fromInfoSupportedHardwareLevel(
                      e,
                    ).then((e) => e.impl as T?),
            );
      }
    }
    if (keyApi is CameraCharacteristicsBooleanKeyProxyApi) {
      return api.getBooleanCameraCharacteristic(keyApi).then((e) => e as T?);
    }
    if (keyApi is CameraCharacteristicsIntArrayKeyProxyApi) {
      if (key is CameraCharacteristics$Key<List<int>>) {
        return api.getIntArrayCameraCharacteristic(keyApi).then((e) => e as T?);
      }
      if (key is CameraCharacteristics$Key<List<CameraMetadata$ControlMode>>) {
        return api
            .getIntArrayCameraCharacteristic(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : Stream.fromIterable(e)
                        .asyncMap(
                          (e) => CameraMetadataUtilProxyApi.fromControlMode(
                            e,
                          ).then((e) => e.impl),
                        )
                        .toList()
                        .then((e) => e as T?),
            );
      }

      if (key
          is CameraCharacteristics$Key<List<CameraMetadata$ControlAeMode>>) {
        return api
            .getIntArrayCameraCharacteristic(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : Stream.fromIterable(e)
                        .asyncMap(
                          (e) => CameraMetadataUtilProxyApi.fromControlAeMode(
                            e,
                          ).then((e) => e.impl),
                        )
                        .toList()
                        .then((e) => e as T?),
            );
      }
      if (key
          is CameraCharacteristics$Key<List<CameraMetadata$ControlAfMode>>) {
        return api
            .getIntArrayCameraCharacteristic(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : Stream.fromIterable(e)
                        .asyncMap(
                          (e) => CameraMetadataUtilProxyApi.fromControlAfMode(
                            e,
                          ).then((e) => e.impl),
                        )
                        .toList()
                        .then((e) => e as T?),
            );
      }
      if (key
          is CameraCharacteristics$Key<List<CameraMetadata$ControlAwbMode>>) {
        return api
            .getIntArrayCameraCharacteristic(keyApi)
            .then(
              (e) => e == null
                  ? null
                  : Stream.fromIterable(e)
                        .asyncMap(
                          (e) => CameraMetadataUtilProxyApi.fromControlAwbMode(
                            e,
                          ).then((e) => e.impl),
                        )
                        .toList()
                        .then((e) => e as T?),
            );
      }
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
