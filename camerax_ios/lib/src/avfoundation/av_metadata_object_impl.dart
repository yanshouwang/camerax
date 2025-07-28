import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];
}

extension AVMetadataObjectApiX on AVMetadataObjectApi {
  AVMetadataObject get impl {
    final api = this;
    if (api is AVMetadataCatBodyObjectApi) {
      return AVMetadataCatBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataDogBodyObjectApi) {
      return AVMetadataDogBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanBodyObjectApi) {
      return AVMetadataHumanBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanFullBodyObjectApi) {
      return AVMetadataHumanFullBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataFaceObjectApi) {
      return AVMetadataFaceObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        faceID: api.faceID,
        hasRollAngle: api.hasRollAngle,
        rollAngle: api.rollAngle,
        hasYawAngle: api.hasYawAngle,
        yawAngle: api.yawAngle,
      );
    }
    if (api is AVMetadataMachineReadableCodeObjectApi) {
      return AVMetadataMachineReadableCodeObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        corners: api.corners.map((e) => e.impl).toList(),
        stringValue: api.stringValue,
      );
    }
    if (api is AVMetadataSalientObjectApi) {
      return AVMetadataSalientObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        objectID: api.objectID,
      );
    }
    throw TypeError();
  }
}
