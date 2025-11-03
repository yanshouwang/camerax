import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension OutputResultsApiX on OutputResultsApi {
  OutputResults get impl {
    final outputUri = this.outputUri;
    return OutputResults(
      outputUri: outputUri == null ? null : Uri.parse(outputUri),
    );
  }
}
