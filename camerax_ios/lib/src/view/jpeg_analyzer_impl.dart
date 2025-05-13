import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class JpegAnalyzerImpl extends JpegAnalyzerChannel with AnalyzerImpl {
  @override
  final JpegAnalyzerApi api;

  JpegAnalyzerImpl.impl(this.api) : super.impl();

  factory JpegAnalyzerImpl({
    required CoordinateSystem targetCoordinateSystem,
    required JpegConsumer consumer,
  }) {
    final obj = JpegAnalyzerApi(
      targetCoordinateSystem: targetCoordinateSystem.api,
      consumer: (_, value) => consumer(value),
    );
    return JpegAnalyzerImpl.impl(obj);
  }
}
