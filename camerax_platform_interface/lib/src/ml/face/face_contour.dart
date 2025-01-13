import 'package:camerax_platform_interface/src/common.dart';

import 'face_contour_type.dart';

final class FaceContour {
  final FaceContourType type;
  final List<Point<double>> points;

  FaceContour({
    required this.type,
    required this.points,
  });
}
