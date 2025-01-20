import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class JpegAnalyzer extends $interface.JpegAnalyzer with Analyzer {
  @override
  final $native.JpegAnalyzer obj;

  JpegAnalyzer.$native(this.obj) : super.impl();

  factory JpegAnalyzer({
    required $interface.CoordinateSystem targetCoordinateSystem,
    required $interface.JpegConsumer consumer,
  }) {
    final obj = $native.JpegAnalyzer(
      targetCoordinateSystem: targetCoordinateSystem.obj,
      consumer: (obj, value) => consumer(value),
    );
    return JpegAnalyzer.$native(obj);
  }
}
