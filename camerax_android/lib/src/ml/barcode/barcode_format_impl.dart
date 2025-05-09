import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BarcodeFormatX on BarcodeFormat {
  BarcodeFormatApi get api {
    switch (this) {
      case BarcodeFormat.unknown:
        return BarcodeFormatApi.unknown;
      case BarcodeFormat.all:
        return BarcodeFormatApi.all;
      case BarcodeFormat.code128:
        return BarcodeFormatApi.code128;
      case BarcodeFormat.code39:
        return BarcodeFormatApi.code39;
      case BarcodeFormat.code93:
        return BarcodeFormatApi.code93;
      case BarcodeFormat.codabar:
        return BarcodeFormatApi.codabar;
      case BarcodeFormat.dataMatrix:
        return BarcodeFormatApi.dataMatrix;
      case BarcodeFormat.ean13:
        return BarcodeFormatApi.ean13;
      case BarcodeFormat.ean8:
        return BarcodeFormatApi.ean8;
      case BarcodeFormat.itf:
        return BarcodeFormatApi.itf;
      case BarcodeFormat.qrCode:
        return BarcodeFormatApi.qrCode;
      case BarcodeFormat.upcA:
        return BarcodeFormatApi.upcA;
      case BarcodeFormat.upcE:
        return BarcodeFormatApi.upcE;
      case BarcodeFormat.pdf417:
        return BarcodeFormatApi.pdf417;
      case BarcodeFormat.aztec:
        return BarcodeFormatApi.aztec;
    }
  }
}

extension BarcodeFormatApiX on BarcodeFormatApi {
  BarcodeFormat get impl {
    switch (this) {
      case BarcodeFormatApi.unknown:
        return BarcodeFormat.unknown;
      case BarcodeFormatApi.all:
        return BarcodeFormat.all;
      case BarcodeFormatApi.code128:
        return BarcodeFormat.code128;
      case BarcodeFormatApi.code39:
        return BarcodeFormat.code39;
      case BarcodeFormatApi.code93:
        return BarcodeFormat.code93;
      case BarcodeFormatApi.codabar:
        return BarcodeFormat.codabar;
      case BarcodeFormatApi.dataMatrix:
        return BarcodeFormat.dataMatrix;
      case BarcodeFormatApi.ean13:
        return BarcodeFormat.ean13;
      case BarcodeFormatApi.ean8:
        return BarcodeFormat.ean8;
      case BarcodeFormatApi.itf:
        return BarcodeFormat.itf;
      case BarcodeFormatApi.qrCode:
        return BarcodeFormat.qrCode;
      case BarcodeFormatApi.upcA:
        return BarcodeFormat.upcA;
      case BarcodeFormatApi.upcE:
        return BarcodeFormat.upcE;
      case BarcodeFormatApi.pdf417:
        return BarcodeFormat.pdf417;
      case BarcodeFormatApi.aztec:
        return BarcodeFormat.aztec;
    }
  }
}
