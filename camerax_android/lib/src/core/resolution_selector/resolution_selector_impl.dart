import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'aspect_ratio_startegy_impl.dart';
import 'resolution_mode_impl.dart';
import 'resolution_strategy_impl.dart';

extension ResolutionSelectorX on ResolutionSelector {
  ResolutionSelectorApi get api {
    final resolutionFilter = this.resolutionFilter;
    return ResolutionSelectorApi(
      allowedResolutionMode: allowedResolutionMode.api,
      aspectRatioStrategy: aspectRatioStrategy.api,
      resolutionFilter: resolutionFilter == null
          ? null
          : ResolutionFilterApi(
              filter: (_, supportedSizeApis, rotationDegrees) {
                final supportedSizes =
                    supportedSizeApis.map((e) => e.impl).toList();
                final sizes = resolutionFilter(supportedSizes, rotationDegrees);
                return sizes.map((e) => e.api).toList();
              },
            ),
      resolutionStrategy: resolutionStrategy?.api,
    );
  }
}

extension ResolutionSelectorApiX on ResolutionSelectorApi {
  ResolutionSelector get impl {
    final resolutionFilter = this.resolutionFilter;
    return ResolutionSelector(
      allowedResolutionMode: allowedResolutionMode.impl,
      aspectRatioStrategy: aspectRatioStrategy.impl,
      resolutionFilter: resolutionFilter == null
          ? null
          : (supportedSizes, rotationDegrees) {
              final supportedSizeApis =
                  supportedSizes.map((e) => e.api).toList();
              final sizeApis = resolutionFilter.filter(
                  resolutionFilter, supportedSizeApis, rotationDegrees);
              return sizeApis.map((e) => e.impl).toList();
            },
      resolutionStrategy: resolutionStrategy?.impl,
    );
  }
}
