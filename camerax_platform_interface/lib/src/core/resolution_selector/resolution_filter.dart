import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

abstract base class ResolutionFilter {
  ResolutionFilter.impl();

  factory ResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => CameraXPlugin.instance.$ResolutionFilter(filter: filter);
}
