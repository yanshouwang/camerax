import 'package:camerax_platform_interface/src/common.dart';

enum VisionObjectType {
  codabar,
  code39,
  // code39Mod43,
  code93,
  code128,
  ean8,
  ean13,
  // gs1DataBar,
  // gs1DataBarExpanded,
  // gs1DataBarLimited,
  // interleaved2of5,
  itf14,
  upce,
  aztec,
  dataMatrix,
  // microPdf417,
  // microQr,
  pdf417,
  qr,
  // humanBody,
  // humanFullBody,
  // dogBody,
  // catBody,
  // catHead,
  // catBody,
  face;
  // salientObject;

  static List<VisionObjectType> get barcodes => [
    VisionObjectType.codabar,
    VisionObjectType.code39,
    // VisionObjectType.code39Mod43,
    VisionObjectType.code93,
    VisionObjectType.code128,
    VisionObjectType.ean8,
    VisionObjectType.ean13,
    // VisionObjectType.gs1DataBar,
    // VisionObjectType.gs1DataBarExpanded,
    // VisionObjectType.gs1DataBarLimited,
    // VisionObjectType.interleaved2of5,
    VisionObjectType.itf14,
    VisionObjectType.upce,
  ];

  static List<VisionObjectType> get towDimensionalCodes => [
    VisionObjectType.aztec,
    VisionObjectType.dataMatrix,
    // VisionObjectType.microPdf417,
    // VisionObjectType.microQr,
    VisionObjectType.pdf417,
    VisionObjectType.qr,
  ];

  // static List<VisionObjectType> get bodies => [
  //   VisionObjectType.humanBody,
  //   VisionObjectType.humanFullBody,
  //   VisionObjectType.dogBody,
  //   VisionObjectType.catBody,
  //   VisionObjectType.catHead,
  //   VisionObjectType.catBody,
  // ];

  static List<VisionObjectType> get faces => [VisionObjectType.face];

  // static List<VisionObjectType> get saliency => [
  //   VisionObjectType.salientObject,
  // ];
}

abstract base class VisionObject {
  VisionObject.impl();

  VisionObjectType get type;
  Rect<double> get bounds;
}

abstract base class VisionFaceObject extends VisionObject {
  VisionFaceObject.impl() : super.impl();

  int? get id;
  double? get roll;
  double? get yaw;
  double? get pitch;
}

abstract base class VisionMachineReadableCodeObject extends VisionObject {
  VisionMachineReadableCodeObject.impl() : super.impl();

  List<Point<double>> get corners;
  String? get value;
}
