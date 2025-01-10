import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension UseCaseArgs on $base.UseCase {
  $native.UseCase get obj {
    switch (this) {
      case $base.UseCase.imageCapture:
        return $native.UseCase.imageCapture;
      case $base.UseCase.imageAnalysis:
        return $native.UseCase.imageAnalysis;
      case $base.UseCase.videoCapture:
        return $native.UseCase.videoCapture;
    }
  }
}
