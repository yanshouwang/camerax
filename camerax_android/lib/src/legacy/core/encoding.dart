import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension EncodingArgs on $interface.Encoding {
  $native.Encoding get obj {
    switch (this) {
      case $interface.Encoding.unspecified:
        return $native.Encoding.unspecified;
      case $interface.Encoding.sdr:
        return $native.Encoding.sdr;
      case $interface.Encoding.hdrUnspecified:
        return $native.Encoding.hdrUnspecified;
      case $interface.Encoding.hlg:
        return $native.Encoding.hlg;
      case $interface.Encoding.hdr10:
        return $native.Encoding.hdr10;
      case $interface.Encoding.hdr10Plus:
        return $native.Encoding.hdr10Plus;
      case $interface.Encoding.dolbyVision:
        return $native.Encoding.dolbyVision;
    }
  }
}

extension EncodingObj on $native.Encoding {
  $interface.Encoding get args {
    switch (this) {
      case $native.Encoding.unspecified:
        return $interface.Encoding.unspecified;
      case $native.Encoding.sdr:
        return $interface.Encoding.sdr;
      case $native.Encoding.hdrUnspecified:
        return $interface.Encoding.hdrUnspecified;
      case $native.Encoding.hlg:
        return $interface.Encoding.hlg;
      case $native.Encoding.hdr10:
        return $interface.Encoding.hdr10;
      case $native.Encoding.hdr10Plus:
        return $interface.Encoding.hdr10Plus;
      case $native.Encoding.dolbyVision:
        return $interface.Encoding.dolbyVision;
    }
  }
}
