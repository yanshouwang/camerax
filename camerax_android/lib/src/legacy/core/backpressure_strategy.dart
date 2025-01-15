import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension BackpressureStrategyArgs on $interface.BackpressureStrategy {
  $native.BackpressureStrategy get obj {
    switch (this) {
      case $interface.BackpressureStrategy.keepOnlyLatest:
        return $native.BackpressureStrategy.keepOnlyLatest;
      case $interface.BackpressureStrategy.blockProducer:
        return $native.BackpressureStrategy.blockProducer;
    }
  }
}

extension BackpressureStrategyObj on $native.BackpressureStrategy {
  $interface.BackpressureStrategy get args {
    switch (this) {
      case $native.BackpressureStrategy.keepOnlyLatest:
        return $interface.BackpressureStrategy.keepOnlyLatest;
      case $native.BackpressureStrategy.blockProducer:
        return $interface.BackpressureStrategy.blockProducer;
    }
  }
}
