import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension QualityArgs on $interface.Quality {
  $native.Quality get obj {
    switch (this) {
      case $interface.Quality.fhd:
        return $native.Quality.fhd;
      case $interface.Quality.hd:
        return $native.Quality.hd;
      case $interface.Quality.highest:
        return $native.Quality.highest;
      case $interface.Quality.lowest:
        return $native.Quality.lowest;
      case $interface.Quality.sd:
        return $native.Quality.sd;
      case $interface.Quality.uhd:
        return $native.Quality.uhd;
    }
  }
}

extension QualityObj on $native.Quality {
  $interface.Quality get args {
    if (this == $native.Quality.fhd) {
      return $interface.Quality.fhd;
    }
    if (this == $native.Quality.hd) {
      return $interface.Quality.hd;
    }
    if (this == $native.Quality.highest) {
      return $interface.Quality.highest;
    }
    if (this == $native.Quality.lowest) {
      return $interface.Quality.lowest;
    }
    if (this == $native.Quality.sd) {
      return $interface.Quality.sd;
    }
    if (this == $native.Quality.uhd) {
      return $interface.Quality.uhd;
    }
    throw ArgumentError.value(this);
  }
}
