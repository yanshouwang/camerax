import 'package:camerax_platform_interface/src/common.dart';

import 'av_capture_device.dart';

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
  dogHead,
  dogBody,
  catHead,
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
    AVMetadataObjectType.dogHead,
    AVMetadataObjectType.dogBody,
    AVMetadataObjectType.catHead,
    AVMetadataObjectType.catBody,
  ];

  static List<AVMetadataObjectType> get faces => [AVMetadataObjectType.face];

  static List<AVMetadataObjectType> get saliency => [
    AVMetadataObjectType.salientObject,
  ];
}

abstract interface class AVMetadataObject {
  AVMetadataObjectType get type;
  DateTime get time;
  Duration get duration;
  Rect<double> get bounds;
  bool get isFixedFocus;
  AVCaptureDeviceCinematicVideoFocusMode get cinematicVideoFocusMode;
  int get groupID;
  int get objectID;
}

abstract interface class AVMetadataCatHeadObject implements AVMetadataObject {}

abstract interface class AVMetadataDogHeadObject implements AVMetadataObject {}

abstract interface class AVMetadataBodyObject implements AVMetadataObject {
  int get bodyID;
}

abstract interface class AVMetadataCatBodyObject
    implements AVMetadataBodyObject {}

abstract interface class AVMetadataDogBodyObject
    implements AVMetadataBodyObject {}

abstract interface class AVMetadataHumanBodyObject
    implements AVMetadataBodyObject {}

abstract interface class AVMetadataHumanFullBodyObject
    implements AVMetadataBodyObject {}

abstract interface class AVMetadataFaceObject implements AVMetadataObject {
  int get faceID;
  bool get hasRollAngle;
  double get rollAngle;
  bool get hasYawAngle;
  double get yawAngle;
}

abstract interface class AVMetadataMachineReadableCodeObject
    implements AVMetadataObject {
  List<Point<double>> get corners;
  String? get stringValue;
}

abstract interface class AVMetadataSalientObject implements AVMetadataObject {}
