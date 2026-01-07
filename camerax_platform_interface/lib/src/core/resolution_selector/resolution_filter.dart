import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class ResolutionFilter {
  factory ResolutionFilter({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) => ResolutionFilterChannel.instance.create(filter: filter);
}

abstract base class ResolutionFilterChannel extends PlatformInterface {
  ResolutionFilterChannel() : super(token: _token);

  static final _token = Object();

  static ResolutionFilterChannel? _instance;

  static ResolutionFilterChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ResolutionFilterChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ResolutionFilter create({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  });
}
