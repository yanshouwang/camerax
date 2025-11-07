import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ConsumerImpl<T> extends Consumer<T> {
  ConsumerImpl.impl() : super.impl();

  factory ConsumerImpl({required void Function(T value) accept}) {
    if (T == ImageProxy) {
      final api = ImageProxyConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return ImageProxyConsumerImpl.internal(api) as ConsumerImpl<T>;
    } else if (T == MlKitAnalyzerResult) {
      final api = MlKitAnalyzerResultConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return MlKitAnalyzerResultConsumerImpl.internal(api) as ConsumerImpl<T>;
    } else if (T == VideoRecordEvent) {
      final api = VideoRecordEventConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return VideoRecordEventConsumerImpl.internal(api) as ConsumerImpl<T>;
    } else {
      return TConsumerImpl(accept: accept);
    }
  }
}

final class TConsumerImpl<T> extends ConsumerImpl<T> {
  final void Function(T value) accept;

  TConsumerImpl({required this.accept}) : super.impl();
}

final class ImageProxyConsumerImpl extends ConsumerImpl<ImageProxy> {
  ImageProxyConsumerProxyApi api;

  ImageProxyConsumerImpl.internal(this.api) : super.impl();
}

final class MlKitAnalyzerResultConsumerImpl
    extends ConsumerImpl<MlKitAnalyzerResult> {
  final MlKitAnalyzerResultConsumerProxyApi api;

  MlKitAnalyzerResultConsumerImpl.internal(this.api) : super.impl();
}

final class VideoRecordEventConsumerImpl
    extends ConsumerImpl<VideoRecordEvent> {
  final VideoRecordEventConsumerProxyApi api;

  VideoRecordEventConsumerImpl.internal(this.api) : super.impl();
}

extension ConsumerX<T> on Consumer<T> {
  void accept(T value) {
    final impl = this;
    if (impl is! TConsumerImpl<T>) throw TypeError();
    impl.accept(value);
  }
}

extension ImageProxyConsumerX on Consumer<ImageProxy> {
  ImageProxyConsumerProxyApi get api {
    final impl = this;
    if (impl is! ImageProxyConsumerImpl) throw TypeError();
    return impl.api;
  }
}

extension MlKitAnalyzerResultConsumerX on Consumer<MlKitAnalyzerResult> {
  MlKitAnalyzerResultConsumerProxyApi get api {
    final impl = this;
    if (impl is! MlKitAnalyzerResultConsumerImpl) throw TypeError();
    return impl.api;
  }
}

extension VideoRecordEventConsumerX on Consumer<VideoRecordEvent> {
  VideoRecordEventConsumerProxyApi get api {
    final impl = this;
    if (impl is! VideoRecordEventConsumerImpl) throw TypeError();
    return impl.api;
  }
}
