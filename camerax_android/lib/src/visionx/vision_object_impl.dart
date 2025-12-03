import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VisionObjectImpl on VisionObject {
  Size<int>? get imageSize;
}

final class VisionMachineReadableCodeObjectImpl
    extends VisionMachineReadableCodeObject
    with VisionObjectImpl {
  final Barcode barcode;
  @override
  final Size<int>? imageSize;

  VisionMachineReadableCodeObjectImpl.internal(
    this.barcode, {
    required this.imageSize,
  }) : super.impl();

  @override
  Rect<double> get bounds => ArgumentError.checkNotNull(
    barcode.boundingBox,
    'boundingBox',
  ).vision(imageSize);

  @override
  List<Point<double>> get corners => ArgumentError.checkNotNull(
    barcode.cornerPoints,
    'cornerPoints',
  ).map((e) => e.vision(imageSize)).toList();

  @override
  String? get value => barcode.rawValue;

  @override
  VisionObjectType get type => ArgumentError.checkNotNull(
    barcode.format.visionObjectTypeOrNull,
    'format',
  );
}

final class VisionFaceObjectImpl extends VisionFaceObject
    with VisionObjectImpl {
  final Face face;
  @override
  final Size<int>? imageSize;

  VisionFaceObjectImpl.internal(this.face, {required this.imageSize})
    : super.impl();

  @override
  Rect<double> get bounds => face.boundingBox.vision(imageSize);
  @override
  int get id => ArgumentError.checkNotNull(face.trackingId, 'trackingId');
  @override
  double? get roll => face.headEulerAngleX;
  @override
  VisionObjectType get type => VisionObjectType.face;
  @override
  double? get yaw => face.headEulerAngleZ;
  @override
  double? get pitch => face.headEulerAngleY;
}

extension VisionObjectTypeX on VisionObjectType {
  BarcodeFormat? get formatOrNull {
    switch (this) {
      case VisionObjectType.codabar:
        return BarcodeFormat.codabar;
      case VisionObjectType.code39:
        return BarcodeFormat.code39;
      // case VisionObjectType.code39Mod43:
      //   return null;
      case VisionObjectType.code93:
        return BarcodeFormat.code93;
      case VisionObjectType.code128:
        return BarcodeFormat.code128;
      case VisionObjectType.ean8:
        return BarcodeFormat.ean8;
      case VisionObjectType.ean13:
        return BarcodeFormat.ean13;
      // case VisionObjectType.gs1DataBar:
      // case VisionObjectType.gs1DataBarExpanded:
      // case VisionObjectType.gs1DataBarLimited:
      // case VisionObjectType.interleaved2of5:
      //   return null;
      case VisionObjectType.itf14:
        return BarcodeFormat.itf;
      case VisionObjectType.upce:
        return BarcodeFormat.upcE;
      case VisionObjectType.aztec:
        return BarcodeFormat.aztec;
      case VisionObjectType.dataMatrix:
        return BarcodeFormat.dataMatrix;
      // case VisionObjectType.microPDF417:
      // case VisionObjectType.microQR:
      //   return null;
      case VisionObjectType.pdf417:
        return BarcodeFormat.pdf417;
      case VisionObjectType.qr:
        return BarcodeFormat.qrCode;
      // case VisionObjectType.humanBody:
      // case VisionObjectType.humanFullBody:
      // case VisionObjectType.dogBody:
      // case VisionObjectType.catBody:
      case VisionObjectType.face:
        // case VisionObjectType.salientObject:
        return null;
    }
  }
}
