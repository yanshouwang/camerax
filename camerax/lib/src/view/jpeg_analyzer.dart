import 'package:camerax/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class JpegAnalyzer extends Analyzer {
  final $interface.JpegAnalyzer _obj;

  JpegAnalyzer({
    required $interface.CoordinateSystem targetCoordinateSystem,
    required $interface.JpegConsumer consumer,
  }) : _obj = $interface.JpegAnalyzer(
          targetCoordinateSystem: targetCoordinateSystem,
          consumer: consumer,
        );

  @override
  $interface.JpegAnalyzer get obj => _obj;
}
