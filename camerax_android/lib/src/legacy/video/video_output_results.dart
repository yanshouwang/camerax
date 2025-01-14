import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension VideoOutputResultsObj on $native.OutputResults {
  $base.OutputResults get args {
    final outputUri = this.outputUri;
    return $base.OutputResults(
      outputUri: outputUri == null ? null : Uri.parse(outputUri),
    );
  }
}
