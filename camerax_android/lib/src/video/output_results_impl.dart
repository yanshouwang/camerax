import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension OutputResultsApiX on OutputResultsApi {
  OutputResultsApi get impl {
    final outputUri = this.outputUri;
    return OutputResultsApi(
      outputUri: outputUri == null ? null : Uri.parse(outputUri),
    );
  }
}
