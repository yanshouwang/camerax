import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension UseCaseX on UseCase {
  UseCaseApi get api {
    switch (this) {
      case UseCase.imageCapture:
        return UseCaseApi.imageCapture;
      case UseCase.imageAnalysis:
        return UseCaseApi.imageAnalysis;
      case UseCase.videoCapture:
        return UseCaseApi.videoCapture;
    }
  }
}
