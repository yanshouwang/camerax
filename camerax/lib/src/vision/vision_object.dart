import 'dart:ui' as ui;

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  BarcodeFormatApi get barcodeFormatApi {
    switch (this) {
      case AVMetadataObjectType.codabar:
        return BarcodeFormatApi.codabar;
      case AVMetadataObjectType.code39:
        return BarcodeFormatApi.code39;
      case AVMetadataObjectType.code39Mod43:
        return BarcodeFormatApi.unknown;
      case AVMetadataObjectType.code93:
        return BarcodeFormatApi.code93;
      case AVMetadataObjectType.code128:
        return BarcodeFormatApi.code128;
      case AVMetadataObjectType.ean8:
        return BarcodeFormatApi.ean8;
      case AVMetadataObjectType.ean13:
        return BarcodeFormatApi.ean13;
      case AVMetadataObjectType.gs1DataBar:
      case AVMetadataObjectType.gs1DataBarExpanded:
      case AVMetadataObjectType.gs1DataBarLimited:
      case AVMetadataObjectType.interleaved2of5:
        return BarcodeFormatApi.unknown;
      case AVMetadataObjectType.itf14:
        return BarcodeFormatApi.itf;
      case AVMetadataObjectType.upce:
        return BarcodeFormatApi.upcE;
      case AVMetadataObjectType.aztec:
        return BarcodeFormatApi.aztec;
      case AVMetadataObjectType.dataMatrix:
        return BarcodeFormatApi.dataMatrix;
      case AVMetadataObjectType.microPDF417:
      case AVMetadataObjectType.microQR:
        return BarcodeFormatApi.unknown;
      case AVMetadataObjectType.pdf417:
        return BarcodeFormatApi.pdf417;
      case AVMetadataObjectType.qr:
        return BarcodeFormatApi.qrCode;
      case AVMetadataObjectType.humanBody:
      case AVMetadataObjectType.humanFullBody:
      case AVMetadataObjectType.dogBody:
      case AVMetadataObjectType.catBody:
      case AVMetadataObjectType.face:
      case AVMetadataObjectType.salientObject:
        return BarcodeFormatApi.unknown;
    }
  }
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  AVMetadataObjectType? get impl {
    switch (this) {
      case BarcodeFormatApi.unknown:
      case BarcodeFormatApi.all:
        return null;
      case BarcodeFormatApi.code128:
        return AVMetadataObjectType.code128;
      case BarcodeFormatApi.code39:
        return AVMetadataObjectType.code39;
      case BarcodeFormatApi.code93:
        return AVMetadataObjectType.code93;
      case BarcodeFormatApi.codabar:
        return AVMetadataObjectType.codabar;
      case BarcodeFormatApi.dataMatrix:
        return AVMetadataObjectType.dataMatrix;
      case BarcodeFormatApi.ean13:
        return AVMetadataObjectType.ean13;
      case BarcodeFormatApi.ean8:
        return AVMetadataObjectType.ean8;
      case BarcodeFormatApi.itf:
        return AVMetadataObjectType.itf14;
      case BarcodeFormatApi.qrCode:
        return AVMetadataObjectType.qr;
      case BarcodeFormatApi.upcA:
        return null;
      case BarcodeFormatApi.upcE:
        return AVMetadataObjectType.upce;
      case BarcodeFormatApi.pdf417:
        return AVMetadataObjectType.pdf417;
      case BarcodeFormatApi.aztec:
        return AVMetadataObjectType.aztec;
    }
  }
}

extension BarcodeApiX on BarcodeApi {
  AVMetadataMachineReadableCodeObject? implOf(int timestamp) {
    final format = this.format;
    final boundingBox = this.boundingBox;
    final cornerPoints = this.cornerPoints;
    final type = format.impl;
    if (type == null || boundingBox == null || cornerPoints == null) {
      return null;
    }
    return AVMetadataMachineReadableCodeObject(
      type: type,
      time: DateTime.fromMillisecondsSinceEpoch(timestamp),
      duration: Duration.zero,
      bounds: boundingBox.impl,
      corners: cornerPoints.map((e) => e.impl).toList(),
      stringValue: rawValue,
    );
  }
}

extension FaceApiX on FaceApi {
  AVMetadataFaceObject? implOf(int timestamp) {
    final trackingId = this.trackingId;
    if (trackingId == null) {
      return null;
    }
    return AVMetadataFaceObject(
      type: AVMetadataObjectType.face,
      time: DateTime.fromMillisecondsSinceEpoch(timestamp),
      duration: Duration.zero,
      bounds: boundingBox.impl,
      faceID: trackingId,
      hasRollAngle: true,
      rollAngle: headEulerAngleX, // X
      hasYawAngle: true,
      yawAngle: headEulerAngleZ, // Z
    );
  }
}

extension on PointApi {
  Point<double> get impl {
    final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final x = this.x / ratio;
    final y = this.y / ratio;
    return Point(x, y);
  }
}

extension on RectApi {
  Rect<double> get impl {
    final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final left = this.left / ratio;
    final top = this.top / ratio;
    final right = this.right / ratio;
    final bottom = this.bottom / ratio;
    return Rect(left, top, right, bottom);
  }
}
