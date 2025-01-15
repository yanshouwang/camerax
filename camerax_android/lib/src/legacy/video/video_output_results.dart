import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension VideoOutputResultsObj on $native.OutputResults {
  $interface.OutputResults get args {
    final outputUri = this.outputUri;
    return $interface.OutputResults(
      outputUri: outputUri == null ? null : Uri.parse(outputUri),
    );
  }
}
