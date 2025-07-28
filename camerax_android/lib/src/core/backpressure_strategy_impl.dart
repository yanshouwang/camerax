import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BackpressureStrategyX on BackpressureStrategy {
  BackpressureStrategyApi get api {
    switch (this) {
      case BackpressureStrategy.keepOnlyLatest:
        return BackpressureStrategyApi.keepOnlyLatest;
      case BackpressureStrategy.blockProducer:
        return BackpressureStrategyApi.blockProducer;
    }
  }
}

extension BackpressureStrategyApiX on BackpressureStrategyApi {
  BackpressureStrategy get impl {
    switch (this) {
      case BackpressureStrategyApi.keepOnlyLatest:
        return BackpressureStrategy.keepOnlyLatest;
      case BackpressureStrategyApi.blockProducer:
        return BackpressureStrategy.blockProducer;
    }
  }
}
