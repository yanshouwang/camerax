import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LowLightBoostStateApiX on LowLightBoostStateApi {
  LowLightBoostState get impl => LowLightBoostState.values[index];
}
