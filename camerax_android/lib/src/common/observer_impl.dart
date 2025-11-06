import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraStateObserverImpl extends Observer<CameraState> {
  final CameraStateObserverProxyApi api;

  CameraStateObserverImpl.internal(this.api) : super.impl();

  factory CameraStateObserverImpl({
    required void Function(CameraState value) onChanged,
  }) {
    final api = CameraStateObserverProxyApi(
      onChanged: (_, e) => onChanged(e.impl),
    );
    return CameraStateObserverImpl.internal(api);
  }
}

final class TorchStateObserverImpl extends Observer<TorchState> {
  final TorchStateObserverProxyApi api;

  TorchStateObserverImpl.internal(this.api) : super.impl();

  factory TorchStateObserverImpl({
    required void Function(TorchState value) onChanged,
  }) {
    final api = TorchStateObserverProxyApi(
      onChanged: (_, e) => onChanged(e.impl),
    );
    return TorchStateObserverImpl.internal(api);
  }
}

final class ZoomStateObserverImpl extends Observer<ZoomState> {
  final ZoomStateObserverProxyApi api;

  ZoomStateObserverImpl.internal(this.api) : super.impl();

  factory ZoomStateObserverImpl({
    required void Function(ZoomState value) onChanged,
  }) {
    final api = ZoomStateObserverProxyApi(
      onChanged: (_, e) => onChanged(e.impl),
    );
    return ZoomStateObserverImpl.internal(api);
  }
}

extension CameraStateObserverX on Observer<CameraState> {
  CameraStateObserverProxyApi get api {
    final impl = this;
    if (impl is! CameraStateObserverImpl) throw TypeError();
    return impl.api;
  }
}

extension TorchStateObserverX on Observer<TorchState> {
  TorchStateObserverProxyApi get api {
    final impl = this;
    if (impl is! TorchStateObserverImpl) throw TypeError();
    return impl.api;
  }
}

extension ZoomStateObserverX on Observer<ZoomState> {
  ZoomStateObserverProxyApi get api {
    final impl = this;
    if (impl is! ZoomStateObserverImpl) throw TypeError();
    return impl.api;
  }
}
