import 'package:camerax_platform_interface/src/common.dart';

typedef ResolutionFilter =
    List<Size<int>> Function(
      List<Size<int>> supportedSizes,
      int rotationDegrees,
    );
