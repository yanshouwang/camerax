import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';

abstract base class Observer<T> {
  Observer.impl();

  factory Observer({required void Function(T value) onChanged}) {
    switch (T) {
      case const (CameraState):
        return CameraXPlugin.instance.newCameraStateObserver(
              onChanged: (e) => onChanged(e as T),
            )
            as Observer<T>;
      case const (TorchState):
        return CameraXPlugin.instance.newTorchStateObserver(
              onChanged: (e) => onChanged(e as T),
            )
            as Observer<T>;
      case const (ZoomState):
        return CameraXPlugin.instance.newZoomStateObserver(
              onChanged: (e) => onChanged(e as T),
            )
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
