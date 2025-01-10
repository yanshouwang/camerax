import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ResolutionFilter extends $base.ResolutionFilter {
  final $native.ResolutionFilter obj;

  ResolutionFilter.$native(this.obj) : super.impl();

  @override
  List<$base.Size> filter(
      List<$base.Size> supportedSizes, int rotationDegrees) {
    final supportedSizeObjs =
        supportedSizes.cast<Size>().map((size) => size.obj).toList();
    final sizeObjs = obj.filter(obj, supportedSizeObjs, rotationDegrees);
    return supportedSizes
        .cast<Size>()
        .where((size) => sizeObjs.contains(size.obj))
        .toList();
  }

  factory ResolutionFilter(
      List<$base.Size> Function(List<$base.Size>, int) filter) {
    final obj = $native.ResolutionFilter(
      filter: (obj, supportedSizeObjs, rotationDegrees) {
        final supportedSizes =
            supportedSizeObjs.map((obj) => Size.$native(obj)).toList();
        final sizes = filter(supportedSizes, rotationDegrees);
        return sizes.cast<Size>().map((size) => size.obj).toList();
      },
    );
    return ResolutionFilter.$native(obj);
  }
}
