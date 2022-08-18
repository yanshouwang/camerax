import 'package:camerax_core/camerax_core.dart' as core;

import 'camera_controller.dart';
import 'camera_selector.dart';
import 'use_case.dart';

abstract class CameraProvider {
  static Future<CameraController> bind({
    required CameraSelector cameraSelector,
    required List<UseCase> useCases,
  }) {
    return core.CameraProviderPigeon.instance
        .bind(
          selector: core.CameraSelector(
            facing: core.CameraFacing.valueOf(cameraSelector.facing.index),
          ),
          useCases: useCases.map((useCase) {
            return core.UseCase(
              id: useCase.hashCode.toString(),
              preview: useCase is Preview
                  ? core.Preview(
                      viewId: useCase.viewId,
                    )
                  : null,
              imageAnalysis:
                  useCase is ImageAnalysis ? core.ImageAnalysis() : null,
              imageCapture:
                  useCase is ImageCapture ? core.ImageCapture() : null,
              videoCapture:
                  useCase is VideoCapture ? core.VideoCapture() : null,
            );
          }).toList(),
        )
        .then((camera) => CameraController());
  }

  static Future<void> unbind({required List<UseCase> useCases}) {
    return core.CameraProviderPigeon.instance.unbind(
      useCases: useCases.map((useCase) {
        return core.UseCase(
          id: useCase.hashCode.toString(),
          preview: useCase is Preview
              ? core.Preview(
                  viewId: useCase.viewId,
                )
              : null,
          imageAnalysis: useCase is ImageAnalysis ? core.ImageAnalysis() : null,
          imageCapture: useCase is ImageCapture ? core.ImageCapture() : null,
          videoCapture: useCase is VideoCapture ? core.VideoCapture() : null,
        );
      }).toList(),
    );
  }

  static Future<void> unbindAll() {
    return core.CameraProviderPigeon.instance.unbindAll();
  }
}
