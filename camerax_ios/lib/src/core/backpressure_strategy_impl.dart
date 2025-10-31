import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BackpressureStrategyX on ImageAnalysisStrategy {
  BackpressureStrategyApi get api {
    switch (this) {
      case ImageAnalysisStrategy.keepOnlyLatest:
        return BackpressureStrategyApi.keepOnlyLatest;
      case ImageAnalysisStrategy.blockProducer:
        return BackpressureStrategyApi.blockProducer;
    }
  }
}

extension BackpressureStrategyApiX on BackpressureStrategyApi {
  ImageAnalysisStrategy get impl {
    switch (this) {
      case BackpressureStrategyApi.keepOnlyLatest:
        return ImageAnalysisStrategy.keepOnlyLatest;
      case BackpressureStrategyApi.blockProducer:
        return ImageAnalysisStrategy.blockProducer;
    }
  }
}
