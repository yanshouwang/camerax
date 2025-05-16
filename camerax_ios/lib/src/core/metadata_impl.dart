import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension MetadataX on Metadata {
  MetadataApi get api {
    return MetadataApi(
      isReversedHorizontal: isReversedHorizontal,
      isReversedVertical: isReversedVertical,
      location: location?.api,
    );
  }
}
