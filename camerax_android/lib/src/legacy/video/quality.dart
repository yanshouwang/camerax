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
    switch (this) {
      case $native.Quality.fhd:
        return $base.Quality.fhd;
      case $native.Quality.hd:
        return $base.Quality.hd;
      case $native.Quality.highest:
        return $base.Quality.highest;
      case $native.Quality.lowest:
        return $base.Quality.lowest;
      case $native.Quality.sd:
        return $base.Quality.sd;
      case $native.Quality.uhd:
        return $base.Quality.uhd;
    }
  }
}
