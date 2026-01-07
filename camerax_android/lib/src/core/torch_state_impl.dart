import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension TorchStateApiX on TorchStateApi {
  TorchState get impl => TorchState.values[index];
}
