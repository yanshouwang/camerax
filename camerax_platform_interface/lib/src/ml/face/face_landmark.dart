import 'package:camerax_platform_interface/src/common.dart';

import 'face_landmark_type.dart';

final class FaceLandmark {
  final FaceLandmarkType type;
  final Point<double> position;

  FaceLandmark({
    required this.type,
    required this.position,
  });
}
