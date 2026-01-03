import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VNFaceLandmarkRegionImpl implements VNFaceLandmarkRegion {
  VNFaceLandmarkRegionProxyApi get api;
}

final class VNFaceLandmarkRegion2DImpl extends VNFaceLandmarkRegionImpl
    implements VNFaceLandmarkRegion2D {
  @override
  final VNFaceLandmarkRegion2DProxyApi api;
  @override
  final int pointCount;
  @override
  final List<Point<double>> normalizedPoints;
  @override
  final List<double>? precisionEstimatesPerPoint;

  VNFaceLandmarkRegion2DImpl.internal(
    this.api, {
    required this.pointCount,
    required this.normalizedPoints,
    required this.precisionEstimatesPerPoint,
  });

  @override
  Future<List<Point<double>>> pointsInImage(Size<int> imageSize) => api
      .pointsInImage(imageSize.api)
      .then((e) => e.map((e1) => e1.impl).toList());
}

abstract base class VNFaceLandmarksImpl implements VNFaceLandmarks {
  VNFaceLandmarksProxyApi get api;
}

final class VNFaceLandmarks2DImpl extends VNFaceLandmarksImpl
    implements VNFaceLandmarks2D {
  @override
  final VNFaceLandmarks2DProxyApi api;
  @override
  final double confidence;
  @override
  final VNFaceLandmarkRegion2D? allPoints;
  @override
  final VNFaceLandmarkRegion2D? faceContour;
  @override
  final VNFaceLandmarkRegion2D? leftEye;
  @override
  final VNFaceLandmarkRegion2D? rightEye;
  @override
  final VNFaceLandmarkRegion2D? leftEyebrow;
  @override
  final VNFaceLandmarkRegion2D? rightEyebrow;
  @override
  final VNFaceLandmarkRegion2D? nose;
  @override
  final VNFaceLandmarkRegion2D? noseCrest;
  @override
  final VNFaceLandmarkRegion2D? medianLine;
  @override
  final VNFaceLandmarkRegion2D? outerLips;
  @override
  final VNFaceLandmarkRegion2D? innerLips;
  @override
  final VNFaceLandmarkRegion2D? leftPupil;
  @override
  final VNFaceLandmarkRegion2D? rightPupil;

  VNFaceLandmarks2DImpl.internal(
    this.api, {
    required this.confidence,
    required this.allPoints,
    required this.faceContour,
    required this.leftEye,
    required this.rightEye,
    required this.leftEyebrow,
    required this.rightEyebrow,
    required this.nose,
    required this.noseCrest,
    required this.medianLine,
    required this.outerLips,
    required this.innerLips,
    required this.leftPupil,
    required this.rightPupil,
  });
}

final class VNFaceObservationImpl extends VNDetectedObjectObservationImpl
    implements VNFaceObservation {
  @override
  final VNFaceObservationProxyApi api;
  @override
  final double confidence;
  @override
  final Rect<double> boundingBox;
  @override
  final VNFaceLandmarks2D? landmarks;
  @override
  final double? roll;
  @override
  final double? yaw;
  @override
  final double? pitch;

  VNFaceObservationImpl.internal(
    this.api, {
    required this.confidence,
    required this.boundingBox,
    required this.landmarks,
    required this.roll,
    required this.yaw,
    required this.pitch,
  });
}

extension VNFaceLandmarkRegion2DProxyApiX on VNFaceLandmarkRegion2DProxyApi {
  Future<VNFaceLandmarkRegion2D> impl() async {
    final api = this;
    final pointCount = await api.getPointCount();
    final normalizedPoints = await api.getNormalizedPoints().then(
      (e) => e.map((e1) => e1.impl).toList(),
    );
    final precisionEstimatesPerPoint = await api
        .getPrecisionEstimatesPerPoint();
    return VNFaceLandmarkRegion2DImpl.internal(
      api,
      pointCount: pointCount,
      normalizedPoints: normalizedPoints,
      precisionEstimatesPerPoint: precisionEstimatesPerPoint,
    );
  }
}

extension VNFaceLandmarks2DProxyApiX on VNFaceLandmarks2DProxyApi {
  Future<VNFaceLandmarks2D> impl() async {
    final api = this;
    final confidence = await api.getConfidence();
    final allPoints = await api.getAllPoints().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final faceContour = await api.getFaceContour().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final leftEye = await api.getLeftEye().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final rightEye = await api.getRightEye().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final leftEyebrow = await api.getLeftEyebrow().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final rightEyebrow = await api.getRightEyebrow().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final nose = await api.getNose().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final noseCrest = await api.getNoseCrest().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final medianLine = await api.getMedianLine().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final outerLips = await api.getOuterLips().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final innerLips = await api.getInnerLips().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final leftPupil = await api.getLeftPupil().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final rightPupil = await api.getRightPupil().then(
      (e) async => e == null ? null : await e.impl(),
    );
    return VNFaceLandmarks2DImpl.internal(
      api,
      confidence: confidence,
      allPoints: allPoints,
      faceContour: faceContour,
      leftEye: leftEye,
      rightEye: rightEye,
      leftEyebrow: leftEyebrow,
      rightEyebrow: rightEyebrow,
      nose: nose,
      noseCrest: noseCrest,
      medianLine: medianLine,
      outerLips: outerLips,
      innerLips: innerLips,
      leftPupil: leftPupil,
      rightPupil: rightPupil,
    );
  }
}

extension VNFaceObservationProxyApiX on VNFaceObservationProxyApi {
  Future<VNFaceObservation> impl() async {
    final api = this;
    final confidence = await api.getConfidence();
    final boundingBox = await api.getBoundingBox().then((e) => e.impl);
    final landmarks = await api.getLandmarks().then(
      (e) async => e == null ? null : await e.impl(),
    );
    final roll = await api.getRoll();
    final yaw = await api.getYaw();
    final pitch = await api.getPitch();
    return VNFaceObservationImpl.internal(
      api,
      confidence: confidence,
      boundingBox: boundingBox,
      landmarks: landmarks,
      roll: roll,
      yaw: yaw,
      pitch: pitch,
    );
  }
}
