import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension QualityArgs on $base.Quality {
  $native.Quality get obj {
    switch (this) {
      case $base.Quality.fhd:
        return $native.Quality.fhd;
      case $base.Quality.hd:
        return $native.Quality.hd;
      case $base.Quality.highest:
        return $native.Quality.highest;
      case $base.Quality.lowest:
        return $native.Quality.lowest;
      case $base.Quality.sd:
        return $native.Quality.sd;
      case $base.Quality.uhd:
        return $native.Quality.uhd;
    }
  }
}

extension QualityObj on $native.Quality {
  $base.Quality get args {
    if (this == $native.Quality.fhd) {
      return $base.Quality.fhd;
    }
    if (this == $native.Quality.hd) {
      return $base.Quality.hd;
    }
    if (this == $native.Quality.highest) {
      return $base.Quality.highest;
    }
    if (this == $native.Quality.lowest) {
      return $base.Quality.lowest;
    }
    if (this == $native.Quality.sd) {
      return $base.Quality.sd;
    }
    if (this == $native.Quality.uhd) {
      return $base.Quality.uhd;
    }
    throw ArgumentError.value(this);
  }
}
