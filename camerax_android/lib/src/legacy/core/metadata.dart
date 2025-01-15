import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension MetadataArgs on $interface.Metadata {
  $native.Metadata get obj {
    return $native.Metadata(
      isReversedHorizontal: isReversedHorizontal,
      isReversedVertical: isReversedVertical,
      location: location?.obj,
    );
  }
}
