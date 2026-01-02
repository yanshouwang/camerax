import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VisionObjectImpl implements VisionObject {
  Size<int>? get imageSize;
}

final class VisionMachineReadableCodeObjectImpl extends VisionObjectImpl
    implements VisionMachineReadableCodeObject {
  final Barcode barcode;
  @override
  final Size<int>? imageSize;

  VisionMachineReadableCodeObjectImpl.internal(
    this.barcode, {
    required this.imageSize,
  });

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

final class VisionFaceObjectImpl extends VisionObjectImpl
    implements VisionFaceObject {
  final Face face;
  @override
  final Size<int>? imageSize;

  VisionFaceObjectImpl.internal(this.face, {required this.imageSize});

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
  Barcode$Format? get formatOrNull {
    switch (this) {
      case VisionObjectType.codabar:
        return Barcode$Format.codabar;
      case VisionObjectType.code39:
        return Barcode$Format.code39;
      // case VisionObjectType.code39Mod43:
      //   return null;
      case VisionObjectType.code93:
        return Barcode$Format.code93;
      case VisionObjectType.code128:
        return Barcode$Format.code128;
      case VisionObjectType.ean8:
        return Barcode$Format.ean8;
      case VisionObjectType.ean13:
        return Barcode$Format.ean13;
      // case VisionObjectType.gs1DataBar:
      // case VisionObjectType.gs1DataBarExpanded:
      // case VisionObjectType.gs1DataBarLimited:
      // case VisionObjectType.interleaved2of5:
      //   return null;
      case VisionObjectType.itf14:
        return Barcode$Format.itf;
      case VisionObjectType.upce:
        return Barcode$Format.upcE;
      case VisionObjectType.aztec:
        return Barcode$Format.aztec;
      case VisionObjectType.dataMatrix:
        return Barcode$Format.dataMatrix;
      // case VisionObjectType.microPDF417:
      // case VisionObjectType.microQR:
      //   return null;
      case VisionObjectType.pdf417:
        return Barcode$Format.pdf417;
      case VisionObjectType.qr:
        return Barcode$Format.qrCode;
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
