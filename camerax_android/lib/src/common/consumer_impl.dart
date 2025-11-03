import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
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

  void accept<T>(T value) {
    final impl = this;
    if (impl is! ConsumerImpl<T>) throw TypeError();
    impl.accept(value);
  }
}
