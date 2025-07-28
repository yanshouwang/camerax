import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension TorchStateApiX on TorchStateApi {
  TorchState get impl {
    switch (this) {
      case TorchStateApi.off:
        return TorchState.off;
      case TorchStateApi.on:
        return TorchState.on;
    }
  }
}
