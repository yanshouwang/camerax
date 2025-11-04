import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VideoRecordEventConsumerImpl extends VideoRecordEventConsumerApi {
  final VideoRecordEventConsumerProxyApi api;

  VideoRecordEventConsumerImpl.internal(this.api) : super.impl();

  factory VideoRecordEventConsumerImpl({
    required void Function(VideoRecordEventApi value) accept,
  }) {
    final api = VideoRecordEventConsumerProxyApi(
      accept: (_, e) => accept(e.impl),
    );
    return VideoRecordEventConsumerImpl.internal(api);
  }
}

final class MlKitAnalyzerResultConsumerImpl
    extends MlKitAnalyzerResultConsumerApi {
  final MlKitAnalyzerResultConsumerProxyApi api;

  MlKitAnalyzerResultConsumerImpl.internal(this.api) : super.impl();

  factory MlKitAnalyzerResultConsumerImpl({
    required void Function(MlKitAnalyzerResultApi value) accept,
  }) {
    final api = MlKitAnalyzerResultConsumerProxyApi(
      accept: (_, e) => accept(e.impl),
    );
    return MlKitAnalyzerResultConsumerImpl.internal(api);
  }
}

extension VideoRecordEventConsumerApiX on VideoRecordEventConsumerApi {
  VideoRecordEventConsumerProxyApi get api {
    final impl = this;
    if (impl is! VideoRecordEventConsumerImpl) throw TypeError();
    return impl.api;
  }
}

extension MlKitAnalyzerResultConsumerApiX on MlKitAnalyzerResultConsumerApi {
  MlKitAnalyzerResultConsumerProxyApi get api {
    final impl = this;
    if (impl is! MlKitAnalyzerResultConsumerImpl) throw TypeError();
    return impl.api;
  }
}
