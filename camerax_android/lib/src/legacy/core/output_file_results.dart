import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension OutputFileResultsObj on $native.OutputFileResults {
  $interface.OutputFileResults get args {
    final savedUri = this.savedUri;
    return $interface.OutputFileResults(
      savedUri: savedUri == null ? null : Uri.parse(savedUri),
    );
  }
}
