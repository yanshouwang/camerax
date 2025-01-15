import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'aspect_ratio_startegy.dart';
import 'resolution_mode.dart';
import 'resolution_strategy.dart';

extension ResolutionSelectorArgs on $interface.ResolutionSelector {
  $native.ResolutionSelector get obj {
    final resolutionFilter = this.resolutionFilter;
    return $native.ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode.obj,
      aspectRatioStrategy: aspectRatioStrategy.obj,
      resolutionFilter: resolutionFilter == null
          ? null
          : $native.ResolutionFilter(
              filter: (obj, supportedSizeObjs, rotationDegrees) {
                final supportedSizes =
                    supportedSizeObjs.map((obj) => obj.args).toList();
                final sizes = resolutionFilter(supportedSizes, rotationDegrees);
                return sizes.map((size) => size.obj).toList();
              },
            ),
      resolutionStrategy: resolutionStrategy?.obj,
    );
  }
}

extension ResolutionSelectorObj on $native.ResolutionSelector {
  $interface.ResolutionSelector get args {
    final resolutionFilter = this.resolutionFilter;
    return $interface.ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode.args,
      aspectRatioStrategy: aspectRatioStrategy.args,
      resolutionFilter: resolutionFilter == null
          ? null
          : (List<$interface.Size> supportedSizes, int rotationDegrees) {
              final supportedSizeObjs =
                  supportedSizes.map((size) => size.obj).toList();
              final sizeObjs = resolutionFilter.filter(
                  resolutionFilter, supportedSizeObjs, rotationDegrees);
              return sizeObjs.map((obj) => obj.args).toList();
            },
      resolutionStrategy: resolutionStrategy?.args,
    );
  }
}
