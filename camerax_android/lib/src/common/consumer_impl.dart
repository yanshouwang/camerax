import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ConsumerImpl<T> implements Consumer<T> {}

final class ImageProxyConsumerImpl extends ConsumerImpl<ImageProxy> {
  ImageProxyConsumerProxyApi api;

  ImageProxyConsumerImpl.internal(this.api);
}

final class MlKitAnalyzerResultConsumerImpl
    extends ConsumerImpl<MlKitAnalyzer$Result> {
  final MlKitAnalyzerResultConsumerProxyApi api;

  MlKitAnalyzerResultConsumerImpl.internal(this.api);
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
    if (T == ImageProxy) {
      final api = ImageProxyConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return ImageProxyConsumerImpl.internal(api) as ConsumerImpl<T>;
    }
    if (T == MlKitAnalyzer$Result) {
      final api = MlKitAnalyzerResultConsumerProxyApi(
        accept: (_, e) => accept(e.impl as T),
      );
      return MlKitAnalyzerResultConsumerImpl.internal(api) as ConsumerImpl<T>;
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

extension ImageProxyConsumerX on Consumer<ImageProxy> {
  ImageProxyConsumerProxyApi get api {
    final impl = this;
    if (impl is! ImageProxyConsumerImpl) throw TypeError();
    return impl.api;
  }
}

extension MlKitAnalyzer$ResultConsumerX on Consumer<MlKitAnalyzer$Result> {
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
