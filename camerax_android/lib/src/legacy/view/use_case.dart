import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension UseCaseArgs on $interface.UseCase {
  $native.UseCase get obj {
    switch (this) {
      case $interface.UseCase.imageCapture:
        return $native.UseCase.imageCapture;
      case $interface.UseCase.imageAnalysis:
        return $native.UseCase.imageAnalysis;
      case $interface.UseCase.videoCapture:
        return $native.UseCase.videoCapture;
    }
  }
}
