import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/view.dart';
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

final class IntObserverImpl extends Observer<int> {
  final IntObserverProxyApi api;

  IntObserverImpl.internal(this.api) : super.impl();

  factory IntObserverImpl({required void Function(int value) onChanged}) {
    final api = IntObserverProxyApi(onChanged: (_, e) => onChanged(e));
    return IntObserverImpl.internal(api);
  }
}

final class LowLightBoostStateObserverImpl
    extends Observer<LowLightBoostState> {
  final LowLightBoostStateObserverProxyApi api;

  LowLightBoostStateObserverImpl.internal(this.api) : super.impl();

  factory LowLightBoostStateObserverImpl({
    required void Function(LowLightBoostState value) onChanged,
  }) {
    final api = LowLightBoostStateObserverProxyApi(
      onChanged: (_, e) => onChanged(e.impl),
    );
    return LowLightBoostStateObserverImpl.internal(api);
  }
}

final class TapToFocusInfoObserverImpl extends Observer<TapToFocusInfo> {
  final TapToFocusInfoObserverProxyApi api;

  TapToFocusInfoObserverImpl.internal(this.api) : super.impl();

  factory TapToFocusInfoObserverImpl({
    required void Function(TapToFocusInfo value) onChanged,
  }) {
    final api = TapToFocusInfoObserverProxyApi(
      onChanged: (_, e) => onChanged(e.impl),
    );
    return TapToFocusInfoObserverImpl.internal(api);
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
