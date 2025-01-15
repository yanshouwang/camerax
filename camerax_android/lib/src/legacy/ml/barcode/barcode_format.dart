import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension BarcodeFormatArgs on $interface.BarcodeFormat {
  $native.BarcodeFormat get obj {
    switch (this) {
      case $interface.BarcodeFormat.unknown:
        return $native.BarcodeFormat.unknown;
      case $interface.BarcodeFormat.all:
        return $native.BarcodeFormat.all;
      case $interface.BarcodeFormat.code128:
        return $native.BarcodeFormat.code128;
      case $interface.BarcodeFormat.code39:
        return $native.BarcodeFormat.code39;
      case $interface.BarcodeFormat.code93:
        return $native.BarcodeFormat.code93;
      case $interface.BarcodeFormat.codabar:
        return $native.BarcodeFormat.codabar;
      case $interface.BarcodeFormat.dataMatrix:
        return $native.BarcodeFormat.dataMatrix;
      case $interface.BarcodeFormat.ean13:
        return $native.BarcodeFormat.ean13;
      case $interface.BarcodeFormat.ean8:
        return $native.BarcodeFormat.ean8;
      case $interface.BarcodeFormat.itf:
        return $native.BarcodeFormat.itf;
      case $interface.BarcodeFormat.qrCode:
        return $native.BarcodeFormat.qrCode;
      case $interface.BarcodeFormat.upcA:
        return $native.BarcodeFormat.upcA;
      case $interface.BarcodeFormat.upcE:
        return $native.BarcodeFormat.upcE;
      case $interface.BarcodeFormat.pdf417:
        return $native.BarcodeFormat.pdf417;
      case $interface.BarcodeFormat.aztec:
        return $native.BarcodeFormat.aztec;
    }
  }
}

extension BarcodeFormatObj on $native.BarcodeFormat {
  $interface.BarcodeFormat get args {
    switch (this) {
      case $native.BarcodeFormat.unknown:
        return $interface.BarcodeFormat.unknown;
      case $native.BarcodeFormat.all:
        return $interface.BarcodeFormat.all;
      case $native.BarcodeFormat.code128:
        return $interface.BarcodeFormat.code128;
      case $native.BarcodeFormat.code39:
        return $interface.BarcodeFormat.code39;
      case $native.BarcodeFormat.code93:
        return $interface.BarcodeFormat.code93;
      case $native.BarcodeFormat.codabar:
        return $interface.BarcodeFormat.codabar;
      case $native.BarcodeFormat.dataMatrix:
        return $interface.BarcodeFormat.dataMatrix;
      case $native.BarcodeFormat.ean13:
        return $interface.BarcodeFormat.ean13;
      case $native.BarcodeFormat.ean8:
        return $interface.BarcodeFormat.ean8;
      case $native.BarcodeFormat.itf:
        return $interface.BarcodeFormat.itf;
      case $native.BarcodeFormat.qrCode:
        return $interface.BarcodeFormat.qrCode;
      case $native.BarcodeFormat.upcA:
        return $interface.BarcodeFormat.upcA;
      case $native.BarcodeFormat.upcE:
        return $interface.BarcodeFormat.upcE;
      case $native.BarcodeFormat.pdf417:
        return $interface.BarcodeFormat.pdf417;
      case $native.BarcodeFormat.aztec:
        return $interface.BarcodeFormat.aztec;
    }
  }
}
