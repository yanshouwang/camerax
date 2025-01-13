import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ResolutionFilter extends $base.ResolutionFilter {
  final $native.ResolutionFilter obj;

  ResolutionFilter.$native(this.obj) : super.impl();

  @override
  List<$base.Size> filter(
      List<$base.Size> supportedSizes, int rotationDegrees) {
    final supportedSizeObjs = supportedSizes.map((size) => size.obj).toList();
    final sizeObjs = obj.filter(obj, supportedSizeObjs, rotationDegrees);
    final sizes = sizeObjs.map((obj) => obj.args).toList();
    return sizes;
  }

  factory ResolutionFilter(
      List<$base.Size> Function(List<$base.Size>, int) filter) {
    final obj = $native.ResolutionFilter(
      filter: (obj, supportedSizeObjs, rotationDegrees) {
        final supportedSizes =
            supportedSizeObjs.map((obj) => obj.args).toList();
        final sizes = filter(supportedSizes, rotationDegrees);
        final sizeObjs = sizes.map((size) => size.obj).toList();
        return sizeObjs;
      },
    );
    return ResolutionFilter.$native(obj);
  }
}
