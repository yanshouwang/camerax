import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FlashStateApiX on FlashStateApi {
  FlashState get impl => FlashState.values[index];
}
