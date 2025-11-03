import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraStateObserverImpl extends Observer<CameraState> {
  final CameraStateObserverApi api;

  CameraStateObserverImpl.internal(this.api) : super.impl();

  factory CameraStateObserverImpl({
    required void Function(CameraState value) onChanged,
  }) {
    final api = CameraStateObserverApi(onChanged: (_, e) => onChanged(e.impl));
    return CameraStateObserverImpl.internal(api);
  }
}

final class TorchStateObserverImpl extends Observer<TorchState> {
  final TorchStateObserverApi api;

  TorchStateObserverImpl.internal(this.api) : super.impl();

  factory TorchStateObserverImpl({
    required void Function(TorchState value) onChanged,
  }) {
    final api = TorchStateObserverApi(onChanged: (_, e) => onChanged(e.impl));
    return TorchStateObserverImpl.internal(api);
  }
}

final class ZoomStateObserverImpl extends Observer<ZoomState> {
  final ZoomStateObserverApi api;

  ZoomStateObserverImpl.internal(this.api) : super.impl();

  factory ZoomStateObserverImpl({
    required void Function(ZoomState value) onChanged,
  }) {
    final api = ZoomStateObserverApi(onChanged: (_, e) => onChanged(e.impl));
    return ZoomStateObserverImpl.internal(api);
  }
}

extension ObserverX on Observer {
  CameraStateObserverApi get cameraStateObserverApi {
    final impl = this;
    if (impl is! CameraStateObserverImpl) throw TypeError();
    return impl.api;
  }

  TorchStateObserverApi get torchStateObserverApi {
    final impl = this;
    if (impl is! TorchStateObserverImpl) throw TypeError();
    return impl.api;
  }

  ZoomStateObserverApi get zoomStateObserverApi {
    final impl = this;
    if (impl is! ZoomStateObserverImpl) throw TypeError();
    return impl.api;
  }

  void onChanged<T>(T value) {
    final impl = this;
    if (impl is! ObserverImpl<T>) throw TypeError();
    impl.onChanged(value);
  }
}
