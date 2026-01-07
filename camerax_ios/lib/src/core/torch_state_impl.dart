import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension TorchStateApiX on TorchStateApi {
  TorchState get impl => TorchState.values[index];
}
