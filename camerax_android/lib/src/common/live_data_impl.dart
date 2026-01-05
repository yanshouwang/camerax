import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class LiveDataImpl<T> implements LiveData<T> {}

final class IntLiveDataImpl extends LiveDataImpl<int> {
  final IntLiveDataProxyApi api;

  IntLiveDataImpl.internal(this.api);

  @override
  Future<int?> getValue() => api.getValue();

  @override
  Future<void> observeForever(Observer<int> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<int> observer) =>
      api.removeObserver(observer.api);
}

final class CameraStateLiveDataImpl extends LiveDataImpl<CameraState> {
  final CameraStateLiveDataProxyApi api;

  CameraStateLiveDataImpl.internal(this.api);

  @override
  Future<CameraState?> getValue() => api.getValue().then((e) => e?.impl);

  @override
  Future<void> observeForever(Observer<CameraState> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<CameraState> observer) =>
      api.removeObserver(observer.api);
}

final class TorchStateLiveDataImpl extends LiveDataImpl<TorchState> {
  final TorchStateLiveDataProxyApi api;

  TorchStateLiveDataImpl.internal(this.api);

  @override
  Future<TorchState?> getValue() => api.getValue().then((e) => e?.impl);

  @override
  Future<void> observeForever(Observer<TorchState> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<TorchState> observer) =>
      api.removeObserver(observer.api);
}

final class ZoomStateLiveDataImpl extends LiveDataImpl<ZoomState> {
  final ZoomStateLiveDataProxyApi api;

  ZoomStateLiveDataImpl.internal(this.api);

  @override
  Future<ZoomState?> getValue() => api.getValue().then((e) => e?.impl);

  @override
  Future<void> observeForever(Observer<ZoomState> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<ZoomState> observer) =>
      api.removeObserver(observer.api);
}

final class TapToFocusInfoLiveDataImpl extends LiveDataImpl<TapToFocusInfo> {
  final TapToFocusInfoLiveDataProxyApi api;

  TapToFocusInfoLiveDataImpl.internal(this.api);

  @override
  Future<TapToFocusInfo?> getValue() => api.getValue().then((e) => e?.impl);

  @override
  Future<void> observeForever(Observer<TapToFocusInfo> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<TapToFocusInfo> observer) =>
      api.removeObserver(observer.api);
}

final class LowLightBoostStateLiveDataImpl
    extends LiveDataImpl<LowLightBoostState> {
  final LowLightBoostStateLiveDataProxyApi api;

  LowLightBoostStateLiveDataImpl.internal(this.api);

  @override
  Future<LowLightBoostState?> getValue() => api.getValue().then((e) => e?.impl);

  @override
  Future<void> observeForever(Observer<LowLightBoostState> observer) =>
      api.observeForever(observer.api);

  @override
  Future<void> removeObserver(Observer<LowLightBoostState> observer) =>
      api.removeObserver(observer.api);
}

extension IntLiveDataProxyApiX on IntLiveDataProxyApi {
  LiveData<int> get impl => IntLiveDataImpl.internal(this);
}

extension CameraStateLiveDataProxyApiX on CameraStateLiveDataProxyApi {
  LiveData<CameraState> get impl => CameraStateLiveDataImpl.internal(this);
}

extension TorchStateLiveDataProxyApiX on TorchStateLiveDataProxyApi {
  LiveData<TorchState> get impl => TorchStateLiveDataImpl.internal(this);
}

extension ZoomStateLiveDataProxyApiX on ZoomStateLiveDataProxyApi {
  LiveData<ZoomState> get impl => ZoomStateLiveDataImpl.internal(this);
}

extension TapToFocusInfoLiveDataProxyApiX on TapToFocusInfoLiveDataProxyApi {
  LiveData<TapToFocusInfo> get impl =>
      TapToFocusInfoLiveDataImpl.internal(this);
}

extension LowLightBoostStateLiveDataProxyApiX
    on LowLightBoostStateLiveDataProxyApi {
  LiveData<LowLightBoostState> get impl =>
      LowLightBoostStateLiveDataImpl.internal(this);
}
