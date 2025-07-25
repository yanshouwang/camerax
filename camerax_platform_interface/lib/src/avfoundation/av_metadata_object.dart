import 'package:camerax_platform_interface/src/common.dart';

enum AVMetadataObjectType {
  codabar,
  code39,
  code39Mod43,
  code93,
  code128,
  ean8,
  ean13,
  gs1DataBar,
  gs1DataBarExpanded,
  gs1DataBarLimited,
  interleaved2of5,
  itf14,
  upce,
  aztec,
  dataMatrix,
  microPDF417,
  microQR,
  pdf417,
  qr,
  humanBody,
  humanFullBody,
  dogBody,
  catBody,
  face,
  salientObject;

  static List<AVMetadataObjectType> get barcodes => [
    AVMetadataObjectType.codabar,
    AVMetadataObjectType.code39,
    AVMetadataObjectType.code39Mod43,
    AVMetadataObjectType.code93,
    AVMetadataObjectType.code128,
    AVMetadataObjectType.ean8,
    AVMetadataObjectType.ean13,
    AVMetadataObjectType.gs1DataBar,
    AVMetadataObjectType.gs1DataBarExpanded,
    AVMetadataObjectType.gs1DataBarLimited,
    AVMetadataObjectType.interleaved2of5,
    AVMetadataObjectType.itf14,
    AVMetadataObjectType.upce,
  ];

  static List<AVMetadataObjectType> get towDimensionalCodes => [
    AVMetadataObjectType.aztec,
    AVMetadataObjectType.dataMatrix,
    AVMetadataObjectType.microPDF417,
    AVMetadataObjectType.microQR,
    AVMetadataObjectType.pdf417,
    AVMetadataObjectType.qr,
  ];

  static List<AVMetadataObjectType> get bodies => [
    AVMetadataObjectType.humanBody,
    AVMetadataObjectType.humanFullBody,
    AVMetadataObjectType.dogBody,
    AVMetadataObjectType.catBody,
  ];

  static List<AVMetadataObjectType> get faces => [AVMetadataObjectType.face];

  static List<AVMetadataObjectType> get saliency => [
    AVMetadataObjectType.salientObject,
  ];
}

abstract base class AVMetadataObject {
  final AVMetadataObjectType type;
  final DateTime time;
  final Duration duration;
  final Rect<double> bounds;

  const AVMetadataObject.impl({
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
  });
}

abstract base class AVMetadataBodyObject extends AVMetadataObject {
  final int bodyID;

  const AVMetadataBodyObject.impl({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.bodyID,
  }) : super.impl();
}

final class AVMetadataCatBodyObject extends AVMetadataBodyObject {
  const AVMetadataCatBodyObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required super.bodyID,
  }) : super.impl();
}

final class AVMetadataDogBodyObject extends AVMetadataBodyObject {
  const AVMetadataDogBodyObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required super.bodyID,
  }) : super.impl();
}

final class AVMetadataHumanBodyObject extends AVMetadataBodyObject {
  const AVMetadataHumanBodyObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required super.bodyID,
  }) : super.impl();
}

final class AVMetadataHumanFullBodyObject extends AVMetadataBodyObject {
  const AVMetadataHumanFullBodyObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required super.bodyID,
  }) : super.impl();
}

final class AVMetadataFaceObject extends AVMetadataObject {
  final int faceID;
  final bool hasRollAngle;
  final double rollAngle;
  final bool hasYawAngle;
  final double yawAngle;

  const AVMetadataFaceObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.faceID,
    required this.hasRollAngle,
    required this.rollAngle,
    required this.hasYawAngle,
    required this.yawAngle,
  }) : super.impl();
}

final class AVMetadataMachineReadableCodeObject extends AVMetadataObject {
  final List<Point<double>> corners;
  final String? stringValue;

  const AVMetadataMachineReadableCodeObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.corners,
    required this.stringValue,
  }) : super.impl();
}

final class AVMetadataSalientObject extends AVMetadataObject {
  final int objectID;

  const AVMetadataSalientObject({
    required super.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.objectID,
  }) : super.impl();
}
