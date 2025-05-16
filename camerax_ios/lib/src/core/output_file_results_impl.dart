import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension OutputFileResultsApiX on OutputFileResultsApi {
  OutputFileResults get impl {
    final savedUri = this.savedUri;
    return OutputFileResults(
      savedUri: savedUri == null ? null : Uri.parse(savedUri),
    );
  }
}
