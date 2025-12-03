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

abstract base class AVMetadataObject {
  AVMetadataObject.impl();

  AVMetadataObjectType get type;
  DateTime get time;
  Duration get duration;
  Rect<double> get bounds;
  bool get isFixedFocus;
  AVCaptureDeviceCinematicVideoFocusMode get cinematicVideoFocusMode;
  int get groupID;
  int get objectID;
}

abstract base class AVMetadataCatHeadObject extends AVMetadataObject {
  AVMetadataCatHeadObject.impl() : super.impl();
}

abstract base class AVMetadataDogHeadObject extends AVMetadataObject {
  AVMetadataDogHeadObject.impl() : super.impl();
}

abstract base class AVMetadataBodyObject extends AVMetadataObject {
  AVMetadataBodyObject.impl() : super.impl();

  int get bodyID;
}

abstract base class AVMetadataCatBodyObject extends AVMetadataBodyObject {
  AVMetadataCatBodyObject.impl() : super.impl();
}

abstract base class AVMetadataDogBodyObject extends AVMetadataBodyObject {
  AVMetadataDogBodyObject.impl() : super.impl();
}

abstract base class AVMetadataHumanBodyObject extends AVMetadataBodyObject {
  AVMetadataHumanBodyObject.impl() : super.impl();
}

abstract base class AVMetadataHumanFullBodyObject extends AVMetadataBodyObject {
  AVMetadataHumanFullBodyObject.impl() : super.impl();
}

abstract base class AVMetadataFaceObject extends AVMetadataObject {
  AVMetadataFaceObject.impl() : super.impl();

  int get faceID;
  bool get hasRollAngle;
  double get rollAngle;
  bool get hasYawAngle;
  double get yawAngle;
}

abstract base class AVMetadataMachineReadableCodeObject
    extends AVMetadataObject {
  AVMetadataMachineReadableCodeObject.impl() : super.impl();

  List<Point<double>> get corners;
  String? get stringValue;
}

abstract base class AVMetadataSalientObject extends AVMetadataObject {
  AVMetadataSalientObject.impl() : super.impl();
}
