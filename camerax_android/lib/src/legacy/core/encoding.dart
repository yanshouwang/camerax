import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension EncodingArgs on $base.Encoding {
  $native.Encoding get obj {
    switch (this) {
      case $base.Encoding.unspecified:
        return $native.Encoding.unspecified;
      case $base.Encoding.sdr:
        return $native.Encoding.sdr;
      case $base.Encoding.hdrUnspecified:
        return $native.Encoding.hdrUnspecified;
      case $base.Encoding.hlg:
        return $native.Encoding.hlg;
      case $base.Encoding.hdr10:
        return $native.Encoding.hdr10;
      case $base.Encoding.hdr10Plus:
        return $native.Encoding.hdr10Plus;
      case $base.Encoding.dolbyVision:
        return $native.Encoding.dolbyVision;
    }
  }
}

extension EncodingObj on $native.Encoding {
  $base.Encoding get args {
    switch (this) {
      case $native.Encoding.unspecified:
        return $base.Encoding.unspecified;
      case $native.Encoding.sdr:
        return $base.Encoding.sdr;
      case $native.Encoding.hdrUnspecified:
        return $base.Encoding.hdrUnspecified;
      case $native.Encoding.hlg:
        return $base.Encoding.hlg;
      case $native.Encoding.hdr10:
        return $base.Encoding.hdr10;
      case $native.Encoding.hdr10Plus:
        return $base.Encoding.hdr10Plus;
      case $native.Encoding.dolbyVision:
        return $base.Encoding.dolbyVision;
    }
  }
}
