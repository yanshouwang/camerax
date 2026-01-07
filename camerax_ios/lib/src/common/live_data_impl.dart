import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class LiveDataImpl<T> implements LiveData<T> {}

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

extension CameraStateLiveDataProxyApiX on CameraStateLiveDataProxyApi {
  LiveData<CameraState> get impl => CameraStateLiveDataImpl.internal(this);
}

extension TorchStateLiveDataProxyApiX on TorchStateLiveDataProxyApi {
  LiveData<TorchState> get impl => TorchStateLiveDataImpl.internal(this);
}

extension ZoomStateLiveDataProxyApiX on ZoomStateLiveDataProxyApi {
  LiveData<ZoomState> get impl => ZoomStateLiveDataImpl.internal(this);
}
