import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/ml/detector_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class BarcodeScannerImpl extends BarcodeScanner with DetectorImpl {
  @override
  final List<AVMetadataObjectTypeApi> typeApis;

  BarcodeScannerImpl.internal(this.typeApis) : super.impl();

  factory BarcodeScannerImpl({BarcodeScannerOptions? options}) {
    if (options is! BarcodeScannerOptionsImpl?) {
      throw TypeError();
    }
    final typeApis = options?.typeApis ?? BarcodeFormat.all.api;
    return BarcodeScannerImpl.internal(typeApis);
  }
}

final class BarcodeScannerOptionsImpl extends BarcodeScannerOptions {
  final List<AVMetadataObjectTypeApi>? typeApis;

  BarcodeScannerOptionsImpl.internal(this.typeApis) : super.impl();

  factory BarcodeScannerOptionsImpl({
    bool? enableAllPotentialBarcodes,
    List<BarcodeFormat>? formats,
    ZoomSuggestionOptions? zoomSuggestionOptions,
  }) {
    final typeApis =
        formats?.map((e) => e.api).expand((e) => e).toSet().toList();
    return BarcodeScannerOptionsImpl.internal(typeApis);
  }
}

extension BarcodeFormatX on BarcodeFormat {
  List<AVMetadataObjectTypeApi> get api {
    switch (this) {
      case BarcodeFormat.unknown:
        return [];
      case BarcodeFormat.all:
        return [
          // Barcodes
          AVMetadataObjectTypeApi.codabar,
          AVMetadataObjectTypeApi.code39,
          AVMetadataObjectTypeApi.code39Mod43,
          AVMetadataObjectTypeApi.code93,
          AVMetadataObjectTypeApi.code128,
          AVMetadataObjectTypeApi.ean8,
          AVMetadataObjectTypeApi.ean13,
          AVMetadataObjectTypeApi.gs1DataBar,
          AVMetadataObjectTypeApi.gs1DataBarExpanded,
          AVMetadataObjectTypeApi.gs1DataBarLimited,
          AVMetadataObjectTypeApi.interleaved2of5,
          AVMetadataObjectTypeApi.itf14,
          AVMetadataObjectTypeApi.upce,
          // 2D Codes
          AVMetadataObjectTypeApi.aztec,
          AVMetadataObjectTypeApi.dataMatrix,
          AVMetadataObjectTypeApi.microPDF417,
          AVMetadataObjectTypeApi.microQR,
          AVMetadataObjectTypeApi.pdf417,
          AVMetadataObjectTypeApi.qr,
        ];
      case BarcodeFormat.code128:
        return [AVMetadataObjectTypeApi.code128];
      case BarcodeFormat.code39:
        return [
          AVMetadataObjectTypeApi.code39,
          AVMetadataObjectTypeApi.code39Mod43,
        ];
      case BarcodeFormat.code93:
        return [AVMetadataObjectTypeApi.code93];
      case BarcodeFormat.codabar:
        return [AVMetadataObjectTypeApi.codabar];
      case BarcodeFormat.dataMatrix:
        return [AVMetadataObjectTypeApi.dataMatrix];
      case BarcodeFormat.ean13:
        return [AVMetadataObjectTypeApi.ean13];
      case BarcodeFormat.ean8:
        return [AVMetadataObjectTypeApi.ean8];
      case BarcodeFormat.itf:
        return [AVMetadataObjectTypeApi.itf14];
      case BarcodeFormat.qrCode:
        return [AVMetadataObjectTypeApi.qr, AVMetadataObjectTypeApi.microQR];
      case BarcodeFormat.upcA:
        return [];
      case BarcodeFormat.upcE:
        return [AVMetadataObjectTypeApi.upce];
      case BarcodeFormat.pdf417:
        return [
          AVMetadataObjectTypeApi.pdf417,
          AVMetadataObjectTypeApi.microPDF417,
        ];
      case BarcodeFormat.aztec:
        return [AVMetadataObjectTypeApi.aztec];
    }
  }
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  BarcodeFormat get impl {
    switch (this) {
      case AVMetadataObjectTypeApi.codabar:
        return BarcodeFormat.codabar;
      case AVMetadataObjectTypeApi.code39:
      case AVMetadataObjectTypeApi.code39Mod43:
        return BarcodeFormat.code39;
      case AVMetadataObjectTypeApi.code93:
        return BarcodeFormat.code93;
      case AVMetadataObjectTypeApi.code128:
        return BarcodeFormat.code128;
      case AVMetadataObjectTypeApi.ean8:
        return BarcodeFormat.ean8;
      case AVMetadataObjectTypeApi.ean13:
        return BarcodeFormat.ean13;
      case AVMetadataObjectTypeApi.gs1DataBar:
      case AVMetadataObjectTypeApi.gs1DataBarExpanded:
      case AVMetadataObjectTypeApi.gs1DataBarLimited:
      case AVMetadataObjectTypeApi.interleaved2of5:
        return BarcodeFormat.unknown;
      case AVMetadataObjectTypeApi.itf14:
        return BarcodeFormat.itf;
      case AVMetadataObjectTypeApi.upce:
        return BarcodeFormat.upcE;
      case AVMetadataObjectTypeApi.aztec:
        return BarcodeFormat.aztec;
      case AVMetadataObjectTypeApi.dataMatrix:
        return BarcodeFormat.dataMatrix;
      case AVMetadataObjectTypeApi.microPDF417:
        return BarcodeFormat.pdf417;
      case AVMetadataObjectTypeApi.microQR:
        return BarcodeFormat.qrCode;
      case AVMetadataObjectTypeApi.pdf417:
        return BarcodeFormat.pdf417;
      case AVMetadataObjectTypeApi.qr:
        return BarcodeFormat.qrCode;
      case AVMetadataObjectTypeApi.humanBody:
      case AVMetadataObjectTypeApi.humanFullBody:
      case AVMetadataObjectTypeApi.dogBody:
      case AVMetadataObjectTypeApi.catBody:
      case AVMetadataObjectTypeApi.face:
      case AVMetadataObjectTypeApi.salientObject:
        return BarcodeFormat.unknown;
    }
  }
}

extension AVMetadataMachineReadableCodeObjectApiX
    on AVMetadataMachineReadableCodeObjectApi {
  Barcode get impl {
    return Barcode(
      format: type.impl,
      boundingBox: bounds.impl,
      cornerPoints: corners.map((e) => e.impl).toList(),
      rawBytes: null,
      rawValue: stringValue,
      displayValue: stringValue,
      valueType: BarcodeValueType.unknown,
      calendarEvent: null,
      contactInfo: null,
      driverLicense: null,
      email: null,
      geoPoint: null,
      phone: null,
      sms: null,
      url: null,
      wifi: null,
    );
  }
}
