import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ConsumerImpl<T> extends Consumer<T> {
  ConsumerImpl.impl() : super.impl();

  factory ConsumerImpl({required void Function(T value) accept}) {
    if (T == AVAnalyzerResult) {
      final api = AVAnalyzerResultConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return AVAnalyzerResultConsumerImpl.internal(api) as ConsumerImpl<T>;
    } else if (T == ImageProxy) {
      final api = ImageProxyConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return ImageProxyConsumerImpl.internal(api) as ConsumerImpl<T>;
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

final class AVAnalyzerResultConsumerImpl
    extends ConsumerImpl<AVAnalyzerResult> {
  final AVAnalyzerResultConsumerProxyApi api;

  AVAnalyzerResultConsumerImpl.internal(this.api) : super.impl();
}

final class ImageProxyConsumerImpl extends ConsumerImpl<ImageProxy> {
  ImageProxyConsumerProxyApi api;

  ImageProxyConsumerImpl.internal(this.api) : super.impl();
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

extension MlKitAnalyzerResultConsumerX on Consumer<AVAnalyzerResult> {
  AVAnalyzerResultConsumerProxyApi get api {
    final impl = this;
    if (impl is! AVAnalyzerResultConsumerImpl) throw TypeError();
    return impl.api;
  }
}

extension ImageProxyConsumerX on Consumer<ImageProxy> {
  ImageProxyConsumerProxyApi get api {
    final impl = this;
    if (impl is! ImageProxyConsumerImpl) throw TypeError();
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
