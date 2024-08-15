import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MyResolutionSelector implements ResolutionSelector {
  final jni.ResolutionSelector jniValue;

  MyResolutionSelector.jni(this.jniValue);

  factory MyResolutionSelector({
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionMode? allowedResolutionMode,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) {
    final builder = jni.ResolutionSelector_Builder();
    if (aspectRatioStrategy != null) {
      builder.setAspectRatioStrategy(aspectRatioStrategy.jniValue);
    }
    if (allowedResolutionMode != null) {
      builder.setAllowedResolutionMode(allowedResolutionMode.jniValue);
    }
    if (resolutionFilter != null) {
      builder.setResolutionFilter(resolutionFilter.jniValue);
    }
    if (resolutionStrategy != null) {
      builder.setResolutionStrategy(resolutionStrategy.jniValue);
    }
    final resolutionSelector = builder.build();
    return MyResolutionSelector.jni(resolutionSelector);
  }

  @override
  AspectRatioStrategy get aspectRatioStrategy {
    final strategy = jniValue.getAspectRatioStrategy();
    return strategy.dartValue;
  }

  @override
  ResolutionMode get allowedResolutionMode {
    final mode = jniValue.getAllowedResolutionMode();
    return mode.dartResolutionMode;
  }

  @override
  ResolutionFilter? get resolutionFilter {
    final filter = jniValue.getResolutionFilter();
    if (filter.isNull) {
      return null;
    }
    return filter.dartValue;
  }

  @override
  ResolutionStrategy? get resolutionStrategy {
    final strategy = jniValue.getResolutionStrategy();
    if (strategy.isNull) {
      return null;
    }
    return strategy.dartValue;
  }
}
