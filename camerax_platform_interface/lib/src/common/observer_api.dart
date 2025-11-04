import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

abstract base class CameraStateObserverApi {
  CameraStateObserverApi.impl();

  factory CameraStateObserverApi({
    required void Function(CameraState value) onChanged,
  }) => CameraXPlugin.instance.$CameraStateObserverApi(onChanged: onChanged);
}

abstract base class TorchStateObserverApi {
  TorchStateObserverApi.impl();

  factory TorchStateObserverApi({
    required void Function(TorchState value) onChanged,
  }) => CameraXPlugin.instance.$TorchStateObserverApi(onChanged: onChanged);
}

abstract base class ZoomStateObserverApi {
  ZoomStateObserverApi.impl();

  factory ZoomStateObserverApi({
    required void Function(ZoomStateApi value) onChanged,
  }) => CameraXPlugin.instance.$ZoomStateObserverApi(onChanged: onChanged);
}
