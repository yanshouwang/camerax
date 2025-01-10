import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class ResolutionFilter extends PlatformInterface {
  static final _token = Object();

  ResolutionFilter.impl() : super(token: _token);

  List<Size> filter(List<Size> supportedSizes, int rotationDegrees);
}
