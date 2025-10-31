import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension UseCaseX on CameraControllerUseCase {
  UseCaseApi get api {
    switch (this) {
      case CameraControllerUseCase.imageCapture:
        return UseCaseApi.imageCapture;
      case CameraControllerUseCase.imageAnalysis:
        return UseCaseApi.imageAnalysis;
      case CameraControllerUseCase.videoCapture:
        return UseCaseApi.videoCapture;
    }
  }
}
