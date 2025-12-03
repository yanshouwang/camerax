import 'package:camerax_platform_interface/src/common.dart';

import 'vn_detected_object_observation.dart';

abstract base class VNFaceLandmarkRegion {
  VNFaceLandmarkRegion.impl();

  int get pointCount;
}

abstract base class VNFaceLandmarkRegion2D extends VNFaceLandmarkRegion {
  VNFaceLandmarkRegion2D.impl() : super.impl();

  List<Point<double>> get normalizedPoints;
  List<double>? get precisionEstimatesPerPoint;

  Future<List<Point<double>>> pointsInImage(Size<int> imageSize);
}

abstract base class VNFaceLandmarks {
  VNFaceLandmarks.impl();

  double get confidence;
}

abstract base class VNFaceLandmarks2D extends VNFaceLandmarks {
  VNFaceLandmarks2D.impl() : super.impl();

  VNFaceLandmarkRegion2D? get allPoints;
  VNFaceLandmarkRegion2D? get faceContour;
  VNFaceLandmarkRegion2D? get leftEye;
  VNFaceLandmarkRegion2D? get rightEye;
  VNFaceLandmarkRegion2D? get leftEyebrow;
  VNFaceLandmarkRegion2D? get rightEyebrow;
  VNFaceLandmarkRegion2D? get nose;
  VNFaceLandmarkRegion2D? get noseCrest;
  VNFaceLandmarkRegion2D? get medianLine;
  VNFaceLandmarkRegion2D? get outerLips;
  VNFaceLandmarkRegion2D? get innerLips;
  VNFaceLandmarkRegion2D? get leftPupil;
  VNFaceLandmarkRegion2D? get rightPupil;
}

abstract base class VNFaceObservation extends VNDetectedObjectObservation {
  VNFaceObservation.impl() : super.impl();

  VNFaceLandmarks2D? get landmarks;
  double? get roll;
  double? get yaw;
  double? get pitch;
}
