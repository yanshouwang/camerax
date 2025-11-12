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

  Future<AVMetadataObjectType> getType();
  Future<DateTime> getTime();
  Future<Duration> getDuration();
  Future<Rect<double>> getBounds();
  Future<bool> isFixedFocus();
  Future<AVCaptureDeviceCinematicVideoFocusMode> getCinematicVideoFocusMode();
  Future<int> getGroupID();
  Future<int> getObjectID();
}

abstract base class AVMetadataCatHeadObject extends AVMetadataObject {
  AVMetadataCatHeadObject.impl() : super.impl();
}

abstract base class AVMetadataDogHeadObject extends AVMetadataObject {
  AVMetadataDogHeadObject.impl() : super.impl();
}

abstract base class AVMetadataBodyObject extends AVMetadataObject {
  AVMetadataBodyObject.impl() : super.impl();

  Future<int> getBodyID();
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

  Future<int> getFaceID();
  Future<bool> hasRollAngle();
  Future<double> getRollAngle();
  Future<bool> hasYawAngle();
  Future<double> getYawAngle();
}

abstract base class AVMetadataMachineReadableCodeObject
    extends AVMetadataObject {
  AVMetadataMachineReadableCodeObject.impl() : super.impl();

  Future<List<Point<double>>> getCorners();
  Future<String?> getStringValue();
}

abstract base class AVMetadataSalientObject extends AVMetadataObject {
  AVMetadataSalientObject.impl() : super.impl();
}
