import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ResolutionFilterImpl extends ResolutionFilter {
  final ResolutionFilterApi api;

  ResolutionFilterImpl.internal(this.api) : super.impl();

  factory ResolutionFilterImpl({
    required List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    )
    filter,
  }) {
    final api = ResolutionFilterApi(
      filter: (_, e1, e2) => filter(e1.map((e) => e.impl).toList(), e2).api,
    );
    return ResolutionFilterImpl.api(api);
  }
}
