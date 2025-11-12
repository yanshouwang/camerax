import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VisionObjectImpl on VisionObject {}

final class VisionFaceObjectImpl extends VisionFaceObject
    with VisionObjectImpl {
  final FaceProxyApi api;

  VisionFaceObjectImpl.internal(this.api) : super.impl();

  @override
  Rect<double> get bounds => api.boundingBox.vimpl;
  @override
  int get id => ArgumentError.checkNotNull(api.trackingId, 'trackingId');
  @override
  double? get rollAngle => api.headEulerAngleX;
  @override
  VisionObjectType get type => VisionObjectType.face;
  @override
  double? get yawAngle => api.headEulerAngleZ;
}

final class VisionMachineReadableCodeObjectImpl
    extends VisionMachineReadableCodeObject
    with VisionObjectImpl {
  final BarcodeProxyApi api;

  VisionMachineReadableCodeObjectImpl.internal(this.api) : super.impl();

  @override
  Rect<double> get bounds =>
      ArgumentError.checkNotNull(api.boundingBox, 'boundingBox').vimpl;
  @override
  List<Point<double>> get corners => ArgumentError.checkNotNull(
    api.cornerPoints,
    'cornerPoints',
  ).map((e) => e.vimpl).toList();
  @override
  String? get value => api.rawValue;
  @override
  VisionObjectType get type => api.format.vimpl;
}

extension VisionObjectTypeX on VisionObjectType {
  BarcodeFormatApi get api {
    switch (this) {
      case VisionObjectType.codabar:
        return BarcodeFormatApi.codabar;
      case VisionObjectType.code39:
        return BarcodeFormatApi.code39;
      // case VisionObjectType.code39Mod43:
      //   return BarcodeFormatApi.unknown;
      case VisionObjectType.code93:
        return BarcodeFormatApi.code93;
      case VisionObjectType.code128:
        return BarcodeFormatApi.code128;
      case VisionObjectType.ean8:
        return BarcodeFormatApi.ean8;
      case VisionObjectType.ean13:
        return BarcodeFormatApi.ean13;
      // case VisionObjectType.gs1DataBar:
      // case VisionObjectType.gs1DataBarExpanded:
      // case VisionObjectType.gs1DataBarLimited:
      // case VisionObjectType.interleaved2of5:
      //   return BarcodeFormat.unknown;
      case VisionObjectType.itf14:
        return BarcodeFormatApi.itf;
      case VisionObjectType.upce:
        return BarcodeFormatApi.upcE;
      case VisionObjectType.aztec:
        return BarcodeFormatApi.aztec;
      case VisionObjectType.dataMatrix:
        return BarcodeFormatApi.dataMatrix;
      // case VisionObjectType.microPDF417:
      // case VisionObjectType.microQR:
      //   return BarcodeFormat.unknown;
      case VisionObjectType.pdf417:
        return BarcodeFormatApi.pdf417;
      case VisionObjectType.qr:
        return BarcodeFormatApi.qrCode;
      // case VisionObjectType.humanBody:
      // case VisionObjectType.humanFullBody:
      // case VisionObjectType.dogBody:
      // case VisionObjectType.catBody:
      case VisionObjectType.face:
        // case VisionObjectType.salientObject:
        return BarcodeFormatApi.unknown;
    }
  }
}
