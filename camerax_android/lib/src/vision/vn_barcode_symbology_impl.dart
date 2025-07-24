import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension VNBarcodeSymbologyX on VNBarcodeSymbology {
  BarcodeFormatApi get api {
    switch (this) {
      case VNBarcodeSymbology.aztec:
        return BarcodeFormatApi.aztec;
      case VNBarcodeSymbology.codabar:
        return BarcodeFormatApi.codabar;
      case VNBarcodeSymbology.code39:
      case VNBarcodeSymbology.code39Checksum:
      case VNBarcodeSymbology.code39FullASCII:
      case VNBarcodeSymbology.code39FullASCIIChecksum:
        return BarcodeFormatApi.code39;
      case VNBarcodeSymbology.code93:
      case VNBarcodeSymbology.code93i:
        return BarcodeFormatApi.code93;
      case VNBarcodeSymbology.code128:
        return BarcodeFormatApi.code128;
      case VNBarcodeSymbology.dataMatrix:
        return BarcodeFormatApi.dataMatrix;
      case VNBarcodeSymbology.ean8:
        return BarcodeFormatApi.ean8;
      case VNBarcodeSymbology.ean13:
        return BarcodeFormatApi.ean13;
      case VNBarcodeSymbology.gs1DataBar:
      case VNBarcodeSymbology.gs1DataBarExpanded:
      case VNBarcodeSymbology.gs1DataBarLimited:
      case VNBarcodeSymbology.i2of5:
      case VNBarcodeSymbology.i2of5Checksum:
        return BarcodeFormatApi.unknown;
      case VNBarcodeSymbology.itf14:
        return BarcodeFormatApi.itf;
      case VNBarcodeSymbology.microPDF417:
        return BarcodeFormatApi.pdf417;
      case VNBarcodeSymbology.microQR:
        return BarcodeFormatApi.qrCode;
      case VNBarcodeSymbology.msiPlessey:
        return BarcodeFormatApi.unknown;
      case VNBarcodeSymbology.pdf417:
        return BarcodeFormatApi.pdf417;
      case VNBarcodeSymbology.qr:
        return BarcodeFormatApi.qrCode;
      case VNBarcodeSymbology.upce:
        return BarcodeFormatApi.upcE;
    }
  }
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  VNBarcodeSymbology? get impl {
    switch (this) {
      case BarcodeFormatApi.unknown:
      case BarcodeFormatApi.all:
        return null;
      case BarcodeFormatApi.code128:
        return VNBarcodeSymbology.code128;
      case BarcodeFormatApi.code39:
        return VNBarcodeSymbology.code39;
      case BarcodeFormatApi.code93:
        return VNBarcodeSymbology.code93;
      case BarcodeFormatApi.codabar:
        return VNBarcodeSymbology.codabar;
      case BarcodeFormatApi.dataMatrix:
        return VNBarcodeSymbology.dataMatrix;
      case BarcodeFormatApi.ean13:
        return VNBarcodeSymbology.ean13;
      case BarcodeFormatApi.ean8:
        return VNBarcodeSymbology.ean8;
      case BarcodeFormatApi.itf:
        return VNBarcodeSymbology.itf14;
      case BarcodeFormatApi.qrCode:
        return VNBarcodeSymbology.qr;
      case BarcodeFormatApi.upcA:
        return null;
      case BarcodeFormatApi.upcE:
        return VNBarcodeSymbology.upce;
      case BarcodeFormatApi.pdf417:
        return VNBarcodeSymbology.pdf417;
      case BarcodeFormatApi.aztec:
        return VNBarcodeSymbology.aztec;
    }
  }
}
