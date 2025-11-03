import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
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
      filter: (_, e1, e2) =>
          filter(e1.map((e) => e.impl).toList(), e2).map((e) => e.api).toList(),
    );
    return ResolutionFilterImpl.internal(api);
  }
}

extension ResolutionFilterX on ResolutionFilter {
  ResolutionFilterApi get api {
    final impl = this;
    if (impl is! ResolutionFilterImpl) throw TypeError();
    return impl.api;
  }
}

extension ResolutionFilterApiX on ResolutionFilterApi {
  ResolutionFilter get impl => ResolutionFilterImpl.internal(this);
}
