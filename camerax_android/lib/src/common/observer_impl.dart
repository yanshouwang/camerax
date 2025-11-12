import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ObserverImpl<T> extends Observer<T> {
  ObserverImpl.impl() : super.impl();

  factory ObserverImpl({required void Function(T value) onChanged}) {
    if (T == CameraState) {
      final api = CameraStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return CameraStateObserverImpl.internal(api) as ObserverImpl<T>;
    } else if (T == int) {
      final api = IntObserverProxyApi(onChanged: (_, e) => onChanged(e as T));
      return IntObserverImpl.internal(api) as ObserverImpl<T>;
    } else if (T == LowLightBoostState) {
      final api = LowLightBoostStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return LowLightBoostStateObserverImpl.internal(api) as ObserverImpl<T>;
    } else if (T == TapToFocusInfo) {
      final api = TapToFocusInfoObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return TapToFocusInfoObserverImpl.internal(api) as ObserverImpl<T>;
    } else if (T == TorchState) {
      final api = TorchStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return TorchStateObserverImpl.internal(api) as ObserverImpl<T>;
    } else if (T == ZoomState) {
      final api = ZoomStateObserverProxyApi(
        onChanged: (_, e) => onChanged(e.impl as T),
      );
      return ZoomStateObserverImpl.internal(api) as ObserverImpl<T>;
    } else {
      return TObserverImpl(onChanged: onChanged);
    }
  }
}

final class TObserverImpl<T> extends ObserverImpl<T> {
  final void Function(T value) onChanged;

  TObserverImpl({required this.onChanged}) : super.impl();
}

final class CameraStateObserverImpl extends ObserverImpl<CameraState> {
  final CameraStateObserverProxyApi api;

  CameraStateObserverImpl.internal(this.api) : super.impl();
}

final class IntObserverImpl extends ObserverImpl<int> {
  final IntObserverProxyApi api;

  IntObserverImpl.internal(this.api) : super.impl();
}

final class LowLightBoostStateObserverImpl
    extends ObserverImpl<LowLightBoostState> {
  final LowLightBoostStateObserverProxyApi api;

  LowLightBoostStateObserverImpl.internal(this.api) : super.impl();
}

final class TapToFocusInfoObserverImpl extends ObserverImpl<TapToFocusInfo> {
  final TapToFocusInfoObserverProxyApi api;

  TapToFocusInfoObserverImpl.internal(this.api) : super.impl();
}

final class TorchStateObserverImpl extends ObserverImpl<TorchState> {
  final TorchStateObserverProxyApi api;

  TorchStateObserverImpl.internal(this.api) : super.impl();
}

final class ZoomStateObserverImpl extends ObserverImpl<ZoomState> {
  final ZoomStateObserverProxyApi api;

  ZoomStateObserverImpl.internal(this.api) : super.impl();
}

extension ObserverX<T> on Observer<T> {
  void onChanged(T value) {
    final impl = this;
    if (impl is! TObserverImpl<T>) throw TypeError();
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

extension IntObserverX on Observer<int> {
  IntObserverProxyApi get api {
    final impl = this;
    if (impl is! IntObserverImpl) throw TypeError();
    return impl.api;
  }
}

extension LowLightBoostStateObserverX on Observer<LowLightBoostState> {
  LowLightBoostStateObserverProxyApi get api {
    final impl = this;
    if (impl is! LowLightBoostStateObserverImpl) throw TypeError();
    return impl.api;
  }
}

extension TapToFocusInfoObserverX on Observer<TapToFocusInfo> {
  TapToFocusInfoObserverProxyApi get api {
    final impl = this;
    if (impl is! TapToFocusInfoObserverImpl) throw TypeError();
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
