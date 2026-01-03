import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AspectRatioX on AspectRatio {
  AspectRatioApi get api => AspectRatioApi.values[index];
}

extension AspectRatioApiX on AspectRatioApi {
  AspectRatio get impl => AspectRatio.values[index];
}
