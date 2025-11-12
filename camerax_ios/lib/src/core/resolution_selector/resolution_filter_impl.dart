// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_ios/src/common.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class ResolutionFilterImpl extends ResolutionFilter {
//   final ResolutionFilterProxyApi api;

//   ResolutionFilterImpl.internal(this.api) : super.impl();

//   factory ResolutionFilterImpl({
//     required List<Size<int>> Function(
//       List<Size<int>> supportedSizes,
//       int rotationDegrees,
//     )
//     filter,
//   }) {
//     final api = ResolutionFilterProxyApi(
//       filter: (_, e1, e2) =>
//           filter(e1.map((e) => e.impl).toList(), e2).map((e) => e.api).toList(),
//     );
//     return ResolutionFilterImpl.internal(api);
//   }
// }

// extension ResolutionFilterX on ResolutionFilter {
//   ResolutionFilterProxyApi get api {
//     final impl = this;
//     if (impl is! ResolutionFilterImpl) throw TypeError();
//     return impl.api;
//   }
// }

// extension ResolutionFilterProxyApiX on ResolutionFilterProxyApi {
//   ResolutionFilter get impl => ResolutionFilterImpl.internal(this);
// }
