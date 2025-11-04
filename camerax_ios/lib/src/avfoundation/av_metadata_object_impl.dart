import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];
}

extension AVMetadataObjectApiX on AVMetadataObjectApi {
  AVMetadataObjectApi get impl {
    final api = this;
    if (api is AVMetadataCatBodyObjectApi) {
      return AVMetadataCatBodyObjectApi(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataDogBodyObjectApi) {
      return AVMetadataDogBodyObjectApi(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanBodyObjectApi) {
      return AVMetadataHumanBodyObjectApi(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataHumanFullBodyObjectApi) {
      return AVMetadataHumanFullBodyObjectApi(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        bodyID: api.bodyID,
      );
    }
    if (api is AVMetadataFaceObjectApi) {
      return AVMetadataFaceObjectApi(
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
      return AVMetadataMachineReadableCodeObjectApi(
        type: api.type.impl,
        time: DateTime.fromMillisecondsSinceEpoch(api.time),
        duration: Duration(milliseconds: api.time),
        bounds: api.bounds.impl,
        corners: api.corners.map((e) => e.impl).toList(),
        stringValue: api.stringValue,
      );
    }
    if (api is AVMetadataSalientObjectApi) {
      return AVMetadataSalientObjectApi(
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
