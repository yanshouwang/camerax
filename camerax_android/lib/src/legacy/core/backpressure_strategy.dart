import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension BackpressureStrategyArgs on $base.BackpressureStrategy {
  $native.BackpressureStrategy get obj {
    switch (this) {
      case $base.BackpressureStrategy.keepOnlyLatest:
        return $native.BackpressureStrategy.keepOnlyLatest;
      case $base.BackpressureStrategy.blockProducer:
        return $native.BackpressureStrategy.blockProducer;
    }
  }
}

extension BackpressureStrategyObj on $native.BackpressureStrategy {
  $base.BackpressureStrategy get args {
    switch (this) {
      case $native.BackpressureStrategy.keepOnlyLatest:
        return $base.BackpressureStrategy.keepOnlyLatest;
      case $native.BackpressureStrategy.blockProducer:
        return $base.BackpressureStrategy.blockProducer;
    }
  }
}
