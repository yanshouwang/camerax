import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VideoRecordEventConsumerImpl extends Consumer<VideoRecordEvent> {
  final VideoRecordEventConsumerApi api;

  VideoRecordEventConsumerImpl.internal(this.api) : super.impl();

  factory VideoRecordEventConsumerImpl({
    required void Function(VideoRecordEvent value) accept,
  }) {
    final api = VideoRecordEventConsumerApi(accept: (_, e) => accept(e.impl));
    return VideoRecordEventConsumerImpl.internal(api);
  }
}

final class AVAnalyzerResultConsumerImpl extends Consumer<AVAnalyzerResult> {
  final AVAnalyzerResultConsumerApi api;

  AVAnalyzerResultConsumerImpl.internal(this.api) : super.impl();

  factory AVAnalyzerResultConsumerImpl({
    required void Function(AVAnalyzerResult value) accept,
  }) {
    final api = AVAnalyzerResultConsumerApi(accept: (_, e) => accept(e.impl));
    return AVAnalyzerResultConsumerImpl.internal(api);
  }
}

extension ConsumerX on Consumer {
  VideoRecordEventConsumerApi get videoRecordEventConsumerApi {
    final impl = this;
    if (impl is! VideoRecordEventConsumerImpl) throw TypeError();
    return impl.api;
  }

  AVAnalyzerResultConsumerApi get avAnalyzerResultConsumerApi {
    final impl = this;
    if (impl is! AVAnalyzerResultConsumerImpl) throw TypeError();
    return impl.api;
  }

  void accept<T>(T value) {
    final impl = this;
    if (impl is! ConsumerImpl<T>) throw TypeError();
    impl.accept(value);
  }
}
