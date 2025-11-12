import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VisionObjectImpl on VisionObject {}

final class VisionFaceObjectImpl extends VisionFaceObject
    with VisionObjectImpl {
  final AVMetadataFaceObjectProxyApi api;

  @override
  final VisionObjectType type;
  @override
  final Rect<double> bounds;
  @override
  final int id;
  @override
  final double? rollAngle;
  @override
  final double? yawAngle;

  VisionFaceObjectImpl.internal(
    this.api,
    this.type,
    this.bounds,
    this.id,
    this.rollAngle,
    this.yawAngle,
  ) : super.impl();
}

final class VisionMachineReadableCodeObjectImpl
    extends VisionMachineReadableCodeObject
    with VisionObjectImpl {
  final AVMetadataMachineReadableCodeObjectProxyApi api;

  @override
  final VisionObjectType type;
  @override
  final Rect<double> bounds;
  @override
  final List<Point<double>> corners;
  @override
  final String? value;

  VisionMachineReadableCodeObjectImpl.internal(
    this.api,
    this.type,
    this.bounds,
    this.corners,
    this.value,
  ) : super.impl();
}

extension VisionObjectTypeX on VisionObjectType {
  AVMetadataObjectTypeApi get api {
    switch (this) {
      case VisionObjectType.codabar:
        return AVMetadataObjectTypeApi.codabar;
      case VisionObjectType.code39:
        return AVMetadataObjectTypeApi.code39;
      // case VisionObjectType.code39Mod43:
      // return AVMetadataObjectTypeApi.code39Mod43;
      case VisionObjectType.code93:
        return AVMetadataObjectTypeApi.code93;
      case VisionObjectType.code128:
        return AVMetadataObjectTypeApi.code128;
      case VisionObjectType.ean8:
        return AVMetadataObjectTypeApi.ean8;
      case VisionObjectType.ean13:
        return AVMetadataObjectTypeApi.ean13;
      // case VisionObjectType.gs1DataBar:
      // return AVMetadataObjectTypeApi.gs1DataBar;
      // case VisionObjectType.gs1DataBarExpanded:
      // return AVMetadataObjectTypeApi.gs1DataBarExpanded;
      // case VisionObjectType.gs1DataBarLimited:
      // return AVMetadataObjectTypeApi.gs1DataBarLimited;
      // case VisionObjectType.interleaved2of5:
      // return AVMetadataObjectTypeApi.interleaved2of5;
      case VisionObjectType.itf14:
        return AVMetadataObjectTypeApi.itf14;
      case VisionObjectType.upce:
        return AVMetadataObjectTypeApi.upce;
      case VisionObjectType.aztec:
        return AVMetadataObjectTypeApi.aztec;
      case VisionObjectType.dataMatrix:
        return AVMetadataObjectTypeApi.dataMatrix;
      // case VisionObjectType.microPDF417:
      // return AVMetadataObjectTypeApi.microPDF417;
      // case VisionObjectType.microQR:
      // return AVMetadataObjectTypeApi.microQR;
      case VisionObjectType.pdf417:
        return AVMetadataObjectTypeApi.pdf417;
      case VisionObjectType.qr:
        return AVMetadataObjectTypeApi.qr;
      // case VisionObjectType.humanBody:
      // return AVMetadataObjectTypeApi.humanBody;
      // case VisionObjectType.humanFullBody:
      // return AVMetadataObjectTypeApi.humanFullBody;
      // case VisionObjectType.dogBody:
      // return AVMetadataObjectTypeApi.dogBody;
      // case VisionObjectType.catBody:
      // return AVMetadataObjectTypeApi.catBody;
      case VisionObjectType.face:
        return AVMetadataObjectTypeApi.face;
      // case VisionObjectType.salientObject:
      // return AVMetadataObjectTypeApi.salientObject;
    }
  }
}
