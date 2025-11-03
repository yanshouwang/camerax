import 'package:camerax_platform_interface/src/avfoundation.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml.dart';
import 'package:camerax_platform_interface/src/video.dart';

abstract base class Consumer<T> {
  Consumer.impl();

  factory Consumer({required void Function(T value) accept}) {
    switch (T) {
      case const (VideoRecordEvent):
        return CameraXPlugin.instance.newVideoRecordEventConsumer(
              accept: (e) => accept(e as T),
            )
            as Consumer<T>;
      case const (MlKitAnalyzerResult):
        return CameraXPlugin.instance.newMlKitAnalyzerResultConsumer(
              accept: (e) => accept(e as T),
            )
            as Consumer<T>;
      case const (AVAnalyzerResult):
        return CameraXPlugin.instance.newAVAnalyzerResultConsumer(
              accept: (e) => accept(e as T),
            )
            as Consumer<T>;
      default:
        return ConsumerImpl(accept: accept);
    }
  }
}

final class ConsumerImpl<T> extends Consumer<T> {
  final void Function(T value) accept;

  ConsumerImpl({required this.accept}) : super.impl();
}
