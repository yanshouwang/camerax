import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ObserverImpl<T> implements Observer<T> {}

final class CameraStateObserverImpl extends ObserverImpl<CameraState> {
  final CameraStateObserverProxyApi api;

  CameraStateObserverImpl.internal(this.api);
}

final class TorchStateObserverImpl extends ObserverImpl<TorchState> {
  final TorchStateObserverProxyApi api;

  TorchStateObserverImpl.internal(this.api);
}

final class ZoomStateObserverImpl extends ObserverImpl<ZoomState> {
  final ZoomStateObserverProxyApi api;

  ZoomStateObserverImpl.internal(this.api);
}

final class OtherObserverImpl<T> extends ObserverImpl<T> {
  final void Function(T value) onChanged;

  OtherObserverImpl({required this.onChanged});
}

final class ObserverChannelImpl extends ObserverChannel {
  @override
  Observer<T> create<T>({required void Function(T value) onChanged}) {
    if (T == CameraState) {
      final api = CameraStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return CameraStateObserverImpl.internal(api) as ObserverImpl<T>;
    }
    if (T == TorchState) {
      final api = TorchStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return TorchStateObserverImpl.internal(api) as ObserverImpl<T>;
    }
    if (T == ZoomState) {
      final api = ZoomStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return ZoomStateObserverImpl.internal(api) as ObserverImpl<T>;
    }
    return OtherObserverImpl(onChanged: onChanged);
  }
}

extension ObserverX<T> on Observer<T> {
  void onChanged(T value) {
    final impl = this;
    if (impl is! OtherObserverImpl<T>) throw TypeError();
    impl.onChanged(value);
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
