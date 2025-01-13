import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension BarcodeFormatArgs on $base.BarcodeFormat {
  $native.BarcodeFormat get obj {
    switch (this) {
      case $base.BarcodeFormat.unknown:
        return $native.BarcodeFormat.unknown;
      case $base.BarcodeFormat.all:
        return $native.BarcodeFormat.all;
      case $base.BarcodeFormat.code128:
        return $native.BarcodeFormat.code128;
      case $base.BarcodeFormat.code39:
        return $native.BarcodeFormat.code39;
      case $base.BarcodeFormat.code93:
        return $native.BarcodeFormat.code93;
      case $base.BarcodeFormat.codabar:
        return $native.BarcodeFormat.codabar;
      case $base.BarcodeFormat.dataMatrix:
        return $native.BarcodeFormat.dataMatrix;
      case $base.BarcodeFormat.ean13:
        return $native.BarcodeFormat.ean13;
      case $base.BarcodeFormat.ean8:
        return $native.BarcodeFormat.ean8;
      case $base.BarcodeFormat.itf:
        return $native.BarcodeFormat.itf;
      case $base.BarcodeFormat.qrCode:
        return $native.BarcodeFormat.qrCode;
      case $base.BarcodeFormat.upcA:
        return $native.BarcodeFormat.upcA;
      case $base.BarcodeFormat.upcE:
        return $native.BarcodeFormat.upcE;
      case $base.BarcodeFormat.pdf417:
        return $native.BarcodeFormat.pdf417;
      case $base.BarcodeFormat.aztec:
        return $native.BarcodeFormat.aztec;
    }
  }
}

extension BarcodeFormatObj on $native.BarcodeFormat {
  $base.BarcodeFormat get args {
    switch (this) {
      case $native.BarcodeFormat.unknown:
        return $base.BarcodeFormat.unknown;
      case $native.BarcodeFormat.all:
        return $base.BarcodeFormat.all;
      case $native.BarcodeFormat.code128:
        return $base.BarcodeFormat.code128;
      case $native.BarcodeFormat.code39:
        return $base.BarcodeFormat.code39;
      case $native.BarcodeFormat.code93:
        return $base.BarcodeFormat.code93;
      case $native.BarcodeFormat.codabar:
        return $base.BarcodeFormat.codabar;
      case $native.BarcodeFormat.dataMatrix:
        return $base.BarcodeFormat.dataMatrix;
      case $native.BarcodeFormat.ean13:
        return $base.BarcodeFormat.ean13;
      case $native.BarcodeFormat.ean8:
        return $base.BarcodeFormat.ean8;
      case $native.BarcodeFormat.itf:
        return $base.BarcodeFormat.itf;
      case $native.BarcodeFormat.qrCode:
        return $base.BarcodeFormat.qrCode;
      case $native.BarcodeFormat.upcA:
        return $base.BarcodeFormat.upcA;
      case $native.BarcodeFormat.upcE:
        return $base.BarcodeFormat.upcE;
      case $native.BarcodeFormat.pdf417:
        return $base.BarcodeFormat.pdf417;
      case $native.BarcodeFormat.aztec:
        return $base.BarcodeFormat.aztec;
    }
  }
}
