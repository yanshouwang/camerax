import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ConsumerImpl<T> extends Consumer<T> {
  ConsumerImpl.impl() : super.impl();

  factory ConsumerImpl({required void Function(T value) accept}) {
    switch (T) {
      case const (VideoRecordEvent):
        return VideoRecordEventConsumerImpl(accept: (e) => accept(e as T))
            as ConsumerImpl<T>;
      case const (MlKitAnalyzerResult):
        return MlKitAnalyzerResultConsumerImpl(accept: (e) => accept(e as T))
            as ConsumerImpl<T>;
      default:
        throw UnimplementedError();
    }
  }
}

final class VideoRecordEventConsumerImpl
    extends ConsumerImpl<VideoRecordEvent> {
  final VideoRecordEventConsumerApi api;

  VideoRecordEventConsumerImpl.internal(this.api) : super.impl();

  factory VideoRecordEventConsumerImpl({
    required void Function(VideoRecordEvent value) accept,
  }) {
    final api = VideoRecordEventConsumerApi(accept: (_, e) => accept(e.impl));
    return VideoRecordEventConsumerImpl.internal(api);
  }
}

final class MlKitAnalyzerResultConsumerImpl
    extends Consumer<MlKitAnalyzerResult> {
  final MlKitAnalyzerResultConsumerApi api;

  MlKitAnalyzerResultConsumerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerResultConsumerImpl({
    required void Function(MlKitAnalyzerResult value) accept,
  }) {
    final api = MlKitAnalyzerResultConsumerApi(
      accept: (_, e) => accept(e.impl),
    );
    return MlKitAnalyzerResultConsumerImpl.internal(api);
  }
}

final class AVAnalyzerResultConsumerImpl
    extends ConsumerImpl<AVAnalyzerResult> {
  final void Function(AVAnalyzerResult value) accept;

  AVAnalyzerResultConsumerImpl({required this.accept}) : super.impl();
}

extension ConsumerX on Consumer {
  VideoRecordEventConsumerApi get videoRecordEventConsumerApi {
    final impl = this;
    if (impl is! VideoRecordEventConsumerImpl) throw TypeError();
    return impl.api;
  }

  MlKitAnalyzerResultConsumerApi get mlKitAnalyzerResultConsumerApi {
    final impl = this;
    if (impl is! MlKitAnalyzerResultConsumerImpl) throw TypeError();
    return impl.api;
  }

  void acceptAVAnalyzerResult(AVAnalyzerResult value) {
    final impl = this;
    if (impl is! AVAnalyzerResultConsumerImpl) throw TypeError();
  }
}
