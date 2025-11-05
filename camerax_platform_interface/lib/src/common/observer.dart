import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Observer<T> {
  Observer.impl();

  factory Observer({required void Function(T value) onChanged}) =>
      CameraXPlugin.instance.$Observer(onChanged: onChanged);
}
