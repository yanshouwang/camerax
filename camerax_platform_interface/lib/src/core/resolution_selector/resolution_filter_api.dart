import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

abstract base class ResolutionFilterApi {
  ResolutionFilterApi.impl();

  factory ResolutionFilterApi({
    required List<SizeApi> Function(
      List<SizeApi> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => CameraXPlugin.instance.$ResolutionFilterApi(filter: filter);
}
