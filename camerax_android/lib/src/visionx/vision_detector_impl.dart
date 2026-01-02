import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionDetectorImpl implements VisionDetector {
  final List<VisionObjectType> types;

  VisionDetectorImpl.internal(this.types);

  @override
  Future<List<VisionObject>> detect(VisionImage image) async {
    final objects = <VisionObject>[];
    final imageSize = await image.inputImage.getSize();
    final formats = types.map((e) => e.formatOrNull).nonNulls.toList();
    if (formats.isNotEmpty) {
      final options = await BarcodeScannerOptions$Builder()
          .setBarcodeFormats(formats)
          .then((e) => e.build());
      final detector = BarcodeScanner.options(options);
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
      final options = await FaceDetectorOptions$Builder().enableTracking().then(
        (e) => e.build(),
      );
      final detector = FaceDetector.options(options);
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

final class VisionDetectorChannelImpl extends VisionDetectorChannel {
  @override
  VisionDetector create({List<VisionObjectType>? types}) {
    types ??= VisionObjectType.values;
    return VisionDetectorImpl.internal(types);
  }
}
