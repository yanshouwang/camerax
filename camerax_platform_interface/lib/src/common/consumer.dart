import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Consumer<T> {
  Consumer.impl();

  factory Consumer({required void Function(T value) accept}) =>
      CameraXPlugin.instance.newConsumer<T>(accept: accept);
}
