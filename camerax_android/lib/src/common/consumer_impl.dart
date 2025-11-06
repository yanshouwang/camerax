import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ImageProxyConsumerImpl extends Consumer<ImageProxy> {
  ImageProxyConsumerProxyApi api;

  ImageProxyConsumerImpl.internal(this.api) : super.impl();

  factory ImageProxyConsumerImpl({
    required void Function(ImageProxy value) accept,
  }) {
    final api = ImageProxyConsumerProxyApi(accept: (_, e) => accept(e.impl));
    return ImageProxyConsumerImpl.internal(api);
  }
}

final class MlKitAnalyzerResultConsumerImpl
    extends Consumer<MlKitAnalyzerResult> {
  final MlKitAnalyzerResultConsumerProxyApi api;

  MlKitAnalyzerResultConsumerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerResultConsumerImpl({
    required void Function(MlKitAnalyzerResult value) accept,
  }) {
    final api = MlKitAnalyzerResultConsumerProxyApi(
      accept: (_, e) => accept(e.impl),
    );
    return MlKitAnalyzerResultConsumerImpl.internal(api);
  }
}

final class VideoRecordEventConsumerImpl extends Consumer<VideoRecordEvent> {
  final VideoRecordEventConsumerProxyApi api;

  VideoRecordEventConsumerImpl.internal(this.api) : super.impl();

  factory VideoRecordEventConsumerImpl({
    required void Function(VideoRecordEvent value) accept,
  }) {
    final api = VideoRecordEventConsumerProxyApi(
      accept: (_, e) => accept(e.impl),
    );
    return VideoRecordEventConsumerImpl.internal(api);
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
