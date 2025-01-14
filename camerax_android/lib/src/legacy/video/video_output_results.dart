import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension VideoOutputResultsObj on $native.VideoOutputResults {
  $base.VideoOutputResults get args {
    return $base.VideoOutputResults(
      outputUri: Uri.parse(outputUri),
    );
  }
}
