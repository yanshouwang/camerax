import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension TorchStateObj on $native.TorchState {
  $interface.TorchState get args {
    switch (this) {
      case $native.TorchState.off:
        return $interface.TorchState.off;
      case $native.TorchState.on:
        return $interface.TorchState.on;
    }
  }
}
