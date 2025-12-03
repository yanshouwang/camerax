import 'dart:async';

import 'package:camerax_ios/src/vision.dart';
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
    final codesCompleter = Completer<List<VisionMachineReadableCodeObject>>();
    final facesCompleter = Completer<List<VisionFaceObject>>();
    final requests = <VNRequest>[];
    final symbologies = types.map((e) => e.symbologyOrNull).nonNulls.toList();
    if (symbologies.isEmpty) {
      codesCompleter.complete([]);
    } else {
      final request = VNDetectBarcodesRequest(
        completionHandler: (request, error) async {
          if (error == null) {
            final objects = await request.getResults().then(
              (e) => e
                  ?.map((e1) => e1.visionObjectOrNull)
                  .whereType<VisionMachineReadableCodeObject>()
                  .toList(),
            );
            codesCompleter.complete(objects ?? []);
          } else {
            codesCompleter.completeError(error);
          }
        },
      );
      await request.setPreferBackgroundProcessing(true);
      await request.setSymbologies(symbologies);
      requests.add(request);
    }
    if (types.contains(VisionObjectType.face)) {
      final request = VNDetectFaceRectanglesRequest(
        completionHandler: (request, error) async {
          if (error == null) {
            final objects = await request.getResults().then(
              (e) => e
                  ?.map((e1) => e1.visionObjectOrNull)
                  .whereType<VisionFaceObject>()
                  .toList(),
            );
            facesCompleter.complete(objects ?? []);
          } else {
            facesCompleter.completeError(error);
          }
        },
      );
      await request.setPreferBackgroundProcessing(true);
      requests.add(request);
    } else {
      facesCompleter.complete([]);
    }
    await image.handler.perform(requests);
    final codes = await codesCompleter.future;
    final faces = await facesCompleter.future;
    return [...codes, ...faces];
  }
}
