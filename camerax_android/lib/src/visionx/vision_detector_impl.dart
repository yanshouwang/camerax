import 'package:camerax_android/src/ml.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vision_image_impl.dart';
import 'vision_object_impl.dart';

final class VisionDetectorImpl extends VisionDetector {
  final List<VisionObjectType> types;

  VisionDetectorImpl.internal(this.types) : super.impl();

  factory VisionDetectorImpl({List<VisionObjectType>? types}) {
    types ??= VisionObjectType.values;
    return VisionDetectorImpl.internal(types);
  }

  @override
  Future<List<VisionObject>> detect(VisionImage image) async {
    final objects = <VisionObject>[];
    final imageSize = await image.inputImage.getSize();
    final formats = types.map((e) => e.formatOrNull).nonNulls.toList();
    if (formats.isNotEmpty) {
      final detector = BarcodeScanner.options(
        BarcodeScannerOptions(formats: formats),
      );
      final codeObjects = await detector
          .process(image.inputImage)
          .then(
            (e) => e
                .map(
                  (e1) =>
                      e1.visionMachineReadableCodeObject(imageSize: imageSize),
                )
                .toList(),
          );
      objects.addAll(codeObjects);
    }
    if (types.contains(VisionObjectType.face)) {
      final detector = FaceDetector.options(
        FaceDetectorOptions(enableTracking: false),
      );
      final faceObjects = await detector
          .process(image.inputImage)
          .then(
            (e) => e
                .map((e1) => e1.visionFaceObject(imageSize: imageSize))
                .toList(),
          );
      objects.addAll(faceObjects);
    }
    return objects;
  }
}
