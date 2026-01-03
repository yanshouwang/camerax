import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AVAnalyzer$ResultImpl implements AVAnalyzer$Result {
  final AVAnalyzerResultProxyApi api;
  @override
  final List<AVMetadataObject> objects;

  AVAnalyzer$ResultImpl.internal(this.api, {required this.objects});
}

final class AVAnalyzerImpl extends ImageAnalysis$AnalyzerImpl
    implements AVAnalyzer {
  @override
  final AVAnalyzerProxyApi api;

  AVAnalyzerImpl.internal(this.api);
}

final class AVAnalyzerChannelImpl extends AVAnalyzerChannel {
  @override
  AVAnalyzer create({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzer$Result> consumer,
  }) {
    final api = AVAnalyzerProxyApi(
      types: types?.map((e) => e.api).toList(),
      consumer: consumer.api,
    );
    return AVAnalyzerImpl.internal(api);
  }
}

extension AVAnalyzer$ResultX on AVAnalyzer$Result {
  VisionAnalyzer$Result get visionAnalyzerResult =>
      VisionAnalyzer$ResultImpl.internal(this);
}

extension AVAnalyzerResultProxyApiX on AVAnalyzerResultProxyApi {
  Future<AVAnalyzer$Result> impl() async {
    final api = this;
    final objects = await api.getObjects().then(
      (e) => Future.wait(e.map((e) => e.impl())),
    );
    return AVAnalyzer$ResultImpl.internal(this, objects: objects);
  }
}
