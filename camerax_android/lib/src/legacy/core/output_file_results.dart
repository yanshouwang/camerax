import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension OutputFileResultsObj on $native.OutputFileResults {
  $base.OutputFileResults get args {
    final savedUri = this.savedUri;
    return $base.OutputFileResults(
      savedUri: savedUri == null ? null : Uri.parse(savedUri),
    );
  }
}
