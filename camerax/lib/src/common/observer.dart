abstract base class Observer<T> {
  Observer.impl();

  factory Observer({required void Function(T value) onChanged}) {
    switch (T) {
      case const (CameraState):
        return CameraStateObserverApi(onChanged: (e) => onChanged(e as T))
            as Observer<T>;
      case const (TorchState):
        return TorchStateObserverApi(onChanged: (e) => onChanged(e as T))
            as Observer<T>;
      case const (ZoomStateApi):
        return ZoomStateApiObserverApi(onChanged: (e) => onChanged(e as T))
            as Observer<T>;
      default:
        return ObserverImpl(onChanged: onChanged);
    }
  }
}

final class ObserverImpl<T> extends Observer<T> {
  final void Function(T value) onChanged;

  ObserverImpl({required this.onChanged}) : super.impl();
}

extension ObserverX<T> on Observer<T> {
  void onChanged(T value) {
    final impl = this;
    if (impl is! ObserverImpl<T>) throw TypeError();
    impl.onChanged(value);
  }
}
