import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BarcodeFormatX on BarcodeFormat {
  List<VNBarcodeSymbologyApi> get api {
    switch (this) {
      case BarcodeFormat.unknown:
        return [];
      case BarcodeFormat.all:
        return VNBarcodeSymbologyApi.values;
      case BarcodeFormat.code128:
        return [VNBarcodeSymbologyApi.code128];
      case BarcodeFormat.code39:
        return [
          VNBarcodeSymbologyApi.code39,
          VNBarcodeSymbologyApi.code39Checksum,
          VNBarcodeSymbologyApi.code39FullASCII,
          VNBarcodeSymbologyApi.code39FullASCIIChecksum,
        ];
      case BarcodeFormat.code93:
        return [VNBarcodeSymbologyApi.code93, VNBarcodeSymbologyApi.code93i];
      case BarcodeFormat.codabar:
        return [VNBarcodeSymbologyApi.codabar];
      case BarcodeFormat.dataMatrix:
        return [VNBarcodeSymbologyApi.dataMatrix];
      case BarcodeFormat.ean13:
        return [VNBarcodeSymbologyApi.ean13];
      case BarcodeFormat.ean8:
        return [VNBarcodeSymbologyApi.ean8];
      case BarcodeFormat.itf:
        return [VNBarcodeSymbologyApi.itf14];
      case BarcodeFormat.qrCode:
        return [VNBarcodeSymbologyApi.qr, VNBarcodeSymbologyApi.microQR];
      case BarcodeFormat.upcA:
        return [];
      case BarcodeFormat.upcE:
        return [VNBarcodeSymbologyApi.upce];
      case BarcodeFormat.pdf417:
        return [
          VNBarcodeSymbologyApi.pdf417,
          VNBarcodeSymbologyApi.microPDF417,
        ];
      case BarcodeFormat.aztec:
        return [VNBarcodeSymbologyApi.aztec];
    }
  }
}

extension VNBarcodeSymbologyApiX on VNBarcodeSymbologyApi {
  BarcodeFormat get impl {
    switch (this) {
      case VNBarcodeSymbologyApi.aztec:
        return BarcodeFormat.aztec;
      case VNBarcodeSymbologyApi.codabar:
        return BarcodeFormat.codabar;
      case VNBarcodeSymbologyApi.code39:
      case VNBarcodeSymbologyApi.code39Checksum:
      case VNBarcodeSymbologyApi.code39FullASCII:
      case VNBarcodeSymbologyApi.code39FullASCIIChecksum:
        return BarcodeFormat.code39;
      case VNBarcodeSymbologyApi.code93:
      case VNBarcodeSymbologyApi.code93i:
        return BarcodeFormat.code93;
      case VNBarcodeSymbologyApi.code128:
        return BarcodeFormat.code128;
      case VNBarcodeSymbologyApi.dataMatrix:
        return BarcodeFormat.dataMatrix;
      case VNBarcodeSymbologyApi.ean8:
        return BarcodeFormat.ean8;
      case VNBarcodeSymbologyApi.ean13:
        return BarcodeFormat.ean13;
      case VNBarcodeSymbologyApi.gs1DataBar:
      case VNBarcodeSymbologyApi.gs1DataBarExpanded:
      case VNBarcodeSymbologyApi.gs1DataBarLimited:
      case VNBarcodeSymbologyApi.i2of5:
      case VNBarcodeSymbologyApi.i2of5Checksum:
        return BarcodeFormat.unknown;
      case VNBarcodeSymbologyApi.itf14:
        return BarcodeFormat.itf;
      case VNBarcodeSymbologyApi.microPDF417:
        return BarcodeFormat.pdf417;
      case VNBarcodeSymbologyApi.microQR:
        return BarcodeFormat.qrCode;
      case VNBarcodeSymbologyApi.msiPlessey:
        return BarcodeFormat.unknown;
      case VNBarcodeSymbologyApi.pdf417:
        return BarcodeFormat.pdf417;
      case VNBarcodeSymbologyApi.qr:
        return BarcodeFormat.qrCode;
      case VNBarcodeSymbologyApi.upce:
        return BarcodeFormat.upcE;
    }
  }
}
