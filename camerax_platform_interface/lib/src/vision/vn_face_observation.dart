import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/vision.dart';

abstract interface class VNFaceLandmarkRegion {
  int get pointCount;
}

abstract interface class VNFaceLandmarkRegion2D
    implements VNFaceLandmarkRegion {
  List<Point<double>> get normalizedPoints;
  List<double>? get precisionEstimatesPerPoint;

  Future<List<Point<double>>> pointsInImage(Size<int> imageSize);
}

abstract interface class VNFaceLandmarks {
  double get confidence;
}

abstract interface class VNFaceLandmarks2D implements VNFaceLandmarks {
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

abstract interface class VNFaceObservation
    implements VNDetectedObjectObservation {
  VNFaceLandmarks2D? get landmarks;
  double? get roll;
  double? get yaw;
  double? get pitch;
}
