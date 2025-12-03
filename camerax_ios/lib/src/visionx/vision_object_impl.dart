import 'package:camerax_ios/src/avfoundation.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VisionObjectAVImpl on VisionObject {
  AVMetadataObject get object;

  @override
  VisionObjectType get type =>
      ArgumentError.checkNotNull(object.type.visionObjectTypeOrNull, 'type');

  @override
  Rect<double> get bounds => object.bounds;
}

base mixin VisionObjectVNImpl on VisionObject {
  VNDetectedObjectObservation get observation;

  @override
  Rect<double> get bounds => observation.boundingBox.vnFixed;
}

final class VisionMachineReadableCodeObjectAVImpl
    extends VisionMachineReadableCodeObject
    with VisionObjectAVImpl {
  @override
  final AVMetadataMachineReadableCodeObject object;

  VisionMachineReadableCodeObjectAVImpl.internal(this.object) : super.impl();

  @override
  List<Point<double>> get corners => object.corners;

  @override
  String? get value => object.stringValue;
}

final class VisionMachineReadableCodeObjectVNImpl
    extends VisionMachineReadableCodeObject
    with VisionObjectVNImpl {
  @override
  final VNBarcodeObservation observation;

  VisionMachineReadableCodeObjectVNImpl.internal(this.observation)
    : super.impl();

  @override
  List<Point<double>> get corners => [
    observation.topLeft.vnFixed,
    observation.topRight.vnFixed,
    observation.bottomRight.vnFixed,
    observation.bottomLeft.vnFixed,
  ];

  @override
  VisionObjectType get type => ArgumentError.checkNotNull(
    observation.symbology.visionObjectTypeOrNull,
    'symbology',
  );

  @override
  String? get value => observation.payloadStringValue;
}

final class VisionFaceObjectAVImpl extends VisionFaceObject
    with VisionObjectAVImpl {
  @override
  final AVMetadataFaceObject object;

  VisionFaceObjectAVImpl.internal(this.object) : super.impl();

  @override
  int? get id => object.faceID;

  @override
  double? get pitch => null;

  @override
  double? get roll => object.hasRollAngle ? object.rollAngle : null;

  @override
  double? get yaw => object.hasYawAngle ? object.yawAngle : null;
}

final class VisionFaceObjectVNImpl extends VisionFaceObject
    with VisionObjectVNImpl {
  @override
  final VNFaceObservation observation;

  VisionFaceObjectVNImpl.internal(this.observation) : super.impl();

  @override
  int? get id => null;

  @override
  double? get pitch => observation.pitch;

  @override
  double? get roll => observation.roll;

  @override
  VisionObjectType get type => VisionObjectType.face;

  @override
  double? get yaw => observation.yaw;
}

extension VisionObjectTypeX on VisionObjectType {
  AVMetadataObjectType get avMetadataObjectType {
    switch (this) {
      case VisionObjectType.codabar:
        return AVMetadataObjectType.codabar;
      case VisionObjectType.code39:
        return AVMetadataObjectType.code39;
      // case VisionObjectType.code39Mod43:
      // return AVMetadataObjectTypeApi.code39Mod43;
      case VisionObjectType.code93:
        return AVMetadataObjectType.code93;
      case VisionObjectType.code128:
        return AVMetadataObjectType.code128;
      case VisionObjectType.ean8:
        return AVMetadataObjectType.ean8;
      case VisionObjectType.ean13:
        return AVMetadataObjectType.ean13;
      // case VisionObjectType.gs1DataBar:
      // return AVMetadataObjectTypeApi.gs1DataBar;
      // case VisionObjectType.gs1DataBarExpanded:
      // return AVMetadataObjectTypeApi.gs1DataBarExpanded;
      // case VisionObjectType.gs1DataBarLimited:
      // return AVMetadataObjectTypeApi.gs1DataBarLimited;
      // case VisionObjectType.interleaved2of5:
      // return AVMetadataObjectTypeApi.interleaved2of5;
      case VisionObjectType.itf14:
        return AVMetadataObjectType.itf14;
      case VisionObjectType.upce:
        return AVMetadataObjectType.upce;
      case VisionObjectType.aztec:
        return AVMetadataObjectType.aztec;
      case VisionObjectType.dataMatrix:
        return AVMetadataObjectType.dataMatrix;
      // case VisionObjectType.microPDF417:
      // return AVMetadataObjectTypeApi.microPDF417;
      // case VisionObjectType.microQR:
      // return AVMetadataObjectTypeApi.microQR;
      case VisionObjectType.pdf417:
        return AVMetadataObjectType.pdf417;
      case VisionObjectType.qr:
        return AVMetadataObjectType.qr;
      // case VisionObjectType.humanBody:
      // return AVMetadataObjectTypeApi.humanBody;
      // case VisionObjectType.humanFullBody:
      // return AVMetadataObjectTypeApi.humanFullBody;
      // case VisionObjectType.dogBody:
      // return AVMetadataObjectTypeApi.dogBody;
      // case VisionObjectType.catBody:
      // return AVMetadataObjectTypeApi.catBody;
      case VisionObjectType.face:
        return AVMetadataObjectType.face;
      // case VisionObjectType.salientObject:
      // return AVMetadataObjectTypeApi.salientObject;
    }
  }

  VNBarcodeSymbology? get symbologyOrNull {
    switch (this) {
      case VisionObjectType.codabar:
        return VNBarcodeSymbology.codabar;
      case VisionObjectType.code39:
        return VNBarcodeSymbology.code39;
      case VisionObjectType.code93:
        return VNBarcodeSymbology.code93;
      case VisionObjectType.code128:
        return VNBarcodeSymbology.code128;
      case VisionObjectType.ean8:
        return VNBarcodeSymbology.ean8;
      case VisionObjectType.ean13:
        return VNBarcodeSymbology.ean13;
      case VisionObjectType.itf14:
        return VNBarcodeSymbology.itf14;
      case VisionObjectType.upce:
        return VNBarcodeSymbology.upce;
      case VisionObjectType.aztec:
        return VNBarcodeSymbology.aztec;
      case VisionObjectType.dataMatrix:
        return VNBarcodeSymbology.dataMatrix;
      case VisionObjectType.pdf417:
        return VNBarcodeSymbology.pdf417;
      case VisionObjectType.qr:
        return VNBarcodeSymbology.qr;
      case VisionObjectType.face:
        return null;
    }
  }
}
