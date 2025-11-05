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

abstract base class AVMetadataObjectApi {
  AVMetadataObjectApi.impl();

  AVMetadataObjectType get type;
  DateTime get time;
  Duration get duration;
  Rect<double> get bounds;
}

abstract base class AVMetadataBodyObjectApi extends AVMetadataObjectApi {
  AVMetadataBodyObjectApi.impl() : super.impl();

  int get bodyID;
}

abstract base class AVMetadataCatBodyObjectApi extends AVMetadataBodyObjectApi {
  AVMetadataCatBodyObjectApi.impl() : super.impl();
}

abstract base class AVMetadataDogBodyObjectApi extends AVMetadataBodyObjectApi {
  AVMetadataDogBodyObjectApi.impl() : super.impl();
}

abstract base class AVMetadataHumanBodyObjectApi
    extends AVMetadataBodyObjectApi {
  AVMetadataHumanBodyObjectApi.impl() : super.impl();
}

abstract base class AVMetadataHumanFullBodyObjectApi
    extends AVMetadataBodyObjectApi {
  AVMetadataHumanFullBodyObjectApi.impl() : super.impl();
}

abstract base class AVMetadataFaceObjectApi extends AVMetadataObjectApi {
  AVMetadataFaceObjectApi.impl() : super.impl();

  int get faceID;
  bool get hasRollAngle;
  double get rollAngle;
  bool get hasYawAngle;
  double get yawAngle;
}

abstract base class AVMetadataMachineReadableCodeObjectApi
    extends AVMetadataObjectApi {
  AVMetadataMachineReadableCodeObjectApi.impl() : super.impl();

  List<Point<double>> get corners;
  String? get stringValue;
}

abstract base class AVMetadataSalientObjectApi extends AVMetadataObjectApi {
  AVMetadataSalientObjectApi.impl() : super.impl();

  int get objectID;
}
