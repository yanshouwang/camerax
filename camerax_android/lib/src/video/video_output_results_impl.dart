import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension VideoOutputResultsApiX on OutputResultsApi {
  OutputResults get impl {
    final outputUri = this.outputUri;
    return OutputResults(
      outputUri: outputUri == null ? null : Uri.parse(outputUri),
    );
  }
}
