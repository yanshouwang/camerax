import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];
}

extension AVMetadataObjectApiX on AVMetadataObject {
  AVMetadataObject get impl {
    final api = this;
    if (api is AVMetadataCatBodyObject) {
      return AVMetadataCatBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataDogBodyObject) {
      return AVMetadataDogBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanBodyObject) {
      return AVMetadataHumanBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanFullBodyObject) {
      return AVMetadataHumanFullBodyObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataFaceObject) {
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
    if (api is AVMetadataMachineReadableCodeObject) {
      return AVMetadataMachineReadableCodeObject(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        corners: api.corners.map((e) => e.impl).toList(),
        stringValue: api.stringValue,
      );
    }
    if (api is AVMetadataSalientObject) {
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
