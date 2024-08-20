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
    final jniBuilder = jni.ResolutionSelector_Builder();
    if (aspectRatioStrategy != null) {
      jniBuilder.setAspectRatioStrategy(aspectRatioStrategy.jniValue);
    }
    if (allowedResolutionMode != null) {
      jniBuilder.setAllowedResolutionMode(allowedResolutionMode.jniValue);
    }
    if (resolutionFilter != null) {
      jniBuilder.setResolutionFilter(resolutionFilter.jniValue);
    }
    if (resolutionStrategy != null) {
      jniBuilder.setResolutionStrategy(resolutionStrategy.jniValue);
    }
    final jniResolutionSelector = jniBuilder.build();
    return MyResolutionSelector.jni(jniResolutionSelector);
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
