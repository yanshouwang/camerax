import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ConsumerImpl<T> implements Consumer<T> {}

final class AVAnalyzer$ResultConsumerImpl
    extends ConsumerImpl<AVAnalyzer$Result> {
  final AVAnalyzerResultConsumerProxyApi api;

  AVAnalyzer$ResultConsumerImpl.internal(this.api);
}

final class ImageProxyConsumerImpl extends ConsumerImpl<ImageProxy> {
  ImageProxyConsumerProxyApi api;

  ImageProxyConsumerImpl.internal(this.api);
}

final class VideoRecordEventConsumerImpl
    extends ConsumerImpl<VideoRecordEvent> {
  final VideoRecordEventConsumerProxyApi api;

  VideoRecordEventConsumerImpl.internal(this.api);
}

final class OtherConsumerImpl<T> extends ConsumerImpl<T> {
  final void Function(T value) accept;

  OtherConsumerImpl({required this.accept});
}

final class ConsumerChannelImpl extends ConsumerChannel {
  @override
  Consumer<T> create<T>({required void Function(T value) accept}) {
    if (T == AVAnalyzer$Result) {
      final api = AVAnalyzerResultConsumerProxyApi(
        accept: (_, e) async {
          final res = await e.impl();
          accept(res as T);
        },
      );
      return AVAnalyzer$ResultConsumerImpl.internal(api) as ConsumerImpl<T>;
    }
    if (T == ImageProxy) {
      final api = ImageProxyConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return ImageProxyConsumerImpl.internal(api) as ConsumerImpl<T>;
    }
    if (T == VideoRecordEvent) {
      final api = VideoRecordEventConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return VideoRecordEventConsumerImpl.internal(api) as ConsumerImpl<T>;
    }
    return OtherConsumerImpl(accept: accept);
  }
}

extension ConsumerX<T> on Consumer<T> {
  void accept(T value) {
    final impl = this;
    if (impl is! OtherConsumerImpl<T>) throw TypeError();
    impl.accept(value);
  }
}

extension MlKitAnalyzerResultConsumerX on Consumer<AVAnalyzer$Result> {
  AVAnalyzerResultConsumerProxyApi get api {
    final impl = this;
    if (impl is! AVAnalyzer$ResultConsumerImpl) throw TypeError();
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
