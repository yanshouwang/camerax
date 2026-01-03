import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class AVMetadataObjectImpl implements AVMetadataObject {
  AVMetadataObjectProxyApi get api;

  @override
  bool get isFixedFocus => throw UnimplementedError();
  @override
  AVCaptureDeviceCinematicVideoFocusMode get cinematicVideoFocusMode =>
      throw UnimplementedError();
  @override
  int get groupID => throw UnimplementedError();
  @override
  int get objectID => throw UnimplementedError();
}

abstract base class AVMetadataBodyObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataBodyObject {
  @override
  AVMetadataBodyObjectProxyApi get api;
}

final class AVMetadataCatHeadObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataCatHeadObject {
  @override
  final AVMetadataCatHeadObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;

  AVMetadataCatHeadObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
  });
}

final class AVMetadataDogHeadObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataDogHeadObject {
  @override
  final AVMetadataDogHeadObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;

  AVMetadataDogHeadObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
  });
}

final class AVMetadataCatBodyObjectImpl extends AVMetadataBodyObjectImpl
    implements AVMetadataCatBodyObject {
  @override
  final AVMetadataCatBodyObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int bodyID;

  AVMetadataCatBodyObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.bodyID,
  });
}

final class AVMetadataDogBodyObjectImpl extends AVMetadataBodyObjectImpl
    implements AVMetadataDogBodyObject {
  @override
  final AVMetadataDogBodyObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int bodyID;

  AVMetadataDogBodyObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.bodyID,
  });
}

final class AVMetadataHumanBodyObjectImpl extends AVMetadataBodyObjectImpl
    implements AVMetadataHumanBodyObject {
  @override
  final AVMetadataHumanBodyObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int bodyID;

  AVMetadataHumanBodyObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.bodyID,
  });
}

final class AVMetadataHumanFullBodyObjectImpl extends AVMetadataBodyObjectImpl
    implements AVMetadataHumanFullBodyObject {
  @override
  final AVMetadataHumanFullBodyObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int bodyID;

  AVMetadataHumanFullBodyObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.bodyID,
  });
}

final class AVMetadataFaceObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataFaceObject {
  @override
  final AVMetadataFaceObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int faceID;
  @override
  final bool hasRollAngle;
  @override
  final double rollAngle;
  @override
  final bool hasYawAngle;
  @override
  final double yawAngle;

  AVMetadataFaceObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.faceID,
    required this.hasRollAngle,
    required this.rollAngle,
    required this.hasYawAngle,
    required this.yawAngle,
  });
}

final class AVMetadataMachineReadableCodeObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataMachineReadableCodeObject {
  @override
  final AVMetadataMachineReadableCodeObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final List<Point<double>> corners;
  @override
  final String? stringValue;

  AVMetadataMachineReadableCodeObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.corners,
    required this.stringValue,
  });
}

final class AVMetadataSalientObjectImpl extends AVMetadataObjectImpl
    implements AVMetadataSalientObject {
  @override
  final AVMetadataSalientObjectProxyApi api;
  @override
  final AVMetadataObjectType type;
  @override
  final DateTime time;
  @override
  final Duration duration;
  @override
  final Rect<double> bounds;
  @override
  final int objectID;

  AVMetadataSalientObjectImpl.internal(
    this.api, {
    required this.type,
    required this.time,
    required this.duration,
    required this.bounds,
    required this.objectID,
  });
}

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];

  VisionObjectType? get visionObjectTypeOrNull {
    switch (this) {
      case AVMetadataObjectType.codabar:
        return VisionObjectType.codabar;
      case AVMetadataObjectType.code39:
        return VisionObjectType.code39;
      case AVMetadataObjectType.code39Mod43:
        return null;
      case AVMetadataObjectType.code93:
        return VisionObjectType.code93;
      case AVMetadataObjectType.code128:
        return VisionObjectType.code128;
      case AVMetadataObjectType.ean8:
        return VisionObjectType.ean8;
      case AVMetadataObjectType.ean13:
        return VisionObjectType.ean13;
      case AVMetadataObjectType.gs1DataBar:
      // return VisionObjectType.gs1DataBar;
      case AVMetadataObjectType.gs1DataBarExpanded:
      // return VisionObjectType.gs1DataBarExpanded;
      case AVMetadataObjectType.gs1DataBarLimited:
      // return VisionObjectType.gs1DataBarLimited;
      case AVMetadataObjectType.interleaved2of5:
        // return VisionObjectType.interleaved2of5;
        return null;
      case AVMetadataObjectType.itf14:
        return VisionObjectType.itf14;
      case AVMetadataObjectType.upce:
        return VisionObjectType.upce;
      case AVMetadataObjectType.aztec:
        return VisionObjectType.aztec;
      case AVMetadataObjectType.dataMatrix:
        return VisionObjectType.dataMatrix;
      case AVMetadataObjectType.microPDF417:
      // return VisionObjectType.microPDF417;
      case AVMetadataObjectType.microQR:
        // return VisionObjectType.microQR;
        return null;
      case AVMetadataObjectType.pdf417:
        return VisionObjectType.pdf417;
      case AVMetadataObjectType.qr:
        return VisionObjectType.qr;
      case AVMetadataObjectType.humanBody:
      // return VisionObjectType.humanBody;
      case AVMetadataObjectType.humanFullBody:
      // return VisionObjectType.humanFullBody;
      case AVMetadataObjectType.dogHead:
      // return VisionObjectType.dogHead;
      case AVMetadataObjectType.dogBody:
      // return VisionObjectType.dogBody;
      case AVMetadataObjectType.catHead:
      // return VisionObjectType.catHead;
      case AVMetadataObjectType.catBody:
        // return VisionObjectType.catBody;
        return null;
      case AVMetadataObjectType.face:
        return VisionObjectType.face;
      case AVMetadataObjectType.salientObject:
        // return VisionObjectType.salientObject;
        return null;
    }
  }
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];
}

extension AVMetadataObjectX on AVMetadataObject {
  VisionObject? get visionObjectOrNull {
    final object = this;
    if (object is AVMetadataMachineReadableCodeObject) {
      return VisionMachineReadableCodeObjectAVImpl.internal(object);
    }
    if (object is AVMetadataFaceObject) {
      return VisionFaceObjectAVImpl.internal(object);
    }
    return null;
  }
}

extension AVMetadataObjectProxyApiX on AVMetadataObjectProxyApi {
  Future<AVMetadataObject> impl() async {
    final api = this;
    final type = await api.getType().then((e) => e.impl);
    final time = await api.getTime().then(
      (e) => DateTime.fromMillisecondsSinceEpoch(e),
    );
    final duration = await api.getDuration().then(
      (e) => Duration(milliseconds: e),
    );
    final bounds = await api.getBounds().then((e) => e.impl);
    if (api is AVMetadataCatHeadObjectProxyApi) {
      return AVMetadataCatHeadObjectImpl.internal(
        api,
        type: type,
        time: time,
        duration: duration,
        bounds: bounds,
      );
    }
    if (api is AVMetadataDogHeadObjectProxyApi) {
      return AVMetadataDogHeadObjectImpl.internal(
        api,
        type: type,
        time: time,
        duration: duration,
        bounds: bounds,
      );
    }
    if (api is AVMetadataBodyObjectProxyApi) {
      final bodyID = await api.getBodyID();
      if (api is AVMetadataCatBodyObjectProxyApi) {
        return AVMetadataCatBodyObjectImpl.internal(
          api,
          type: type,
          time: time,
          duration: duration,
          bounds: bounds,
          bodyID: bodyID,
        );
      }
      if (api is AVMetadataDogBodyObjectProxyApi) {
        return AVMetadataDogBodyObjectImpl.internal(
          api,
          type: type,
          time: time,
          duration: duration,
          bounds: bounds,
          bodyID: bodyID,
        );
      }
      if (api is AVMetadataHumanBodyObjectProxyApi) {
        return AVMetadataHumanBodyObjectImpl.internal(
          api,
          type: type,
          time: time,
          duration: duration,
          bounds: bounds,
          bodyID: bodyID,
        );
      }
      if (api is AVMetadataHumanFullBodyObjectProxyApi) {
        return AVMetadataHumanFullBodyObjectImpl.internal(
          api,
          type: type,
          time: time,
          duration: duration,
          bounds: bounds,
          bodyID: bodyID,
        );
      }
      throw TypeError();
    }
    if (api is AVMetadataFaceObjectProxyApi) {
      final faceID = await api.getFaceID();
      final hasRollAngle = await api.hasRollAngle();
      final rollAngle = await api.getRollAngle();
      final hasYawAngle = await api.hasYawAngle();
      final yawAngle = await api.getYawAngle();
      return AVMetadataFaceObjectImpl.internal(
        api,
        type: type,
        time: time,
        duration: duration,
        bounds: bounds,
        faceID: faceID,
        hasRollAngle: hasRollAngle,
        rollAngle: rollAngle,
        hasYawAngle: hasYawAngle,
        yawAngle: yawAngle,
      );
    }
    if (api is AVMetadataMachineReadableCodeObjectProxyApi) {
      final corners = await api.getCorners().then(
        (e) => e.map((e1) => e1.impl).toList(),
      );
      final stringValue = await api.getStringValue();
      return AVMetadataMachineReadableCodeObjectImpl.internal(
        api,
        type: type,
        time: time,
        duration: duration,
        bounds: bounds,
        corners: corners,
        stringValue: stringValue,
      );
    }
    if (api is AVMetadataSalientObjectProxyApi) {
      final objectID = await api.getObjectID();
      return AVMetadataSalientObjectImpl.internal(
        api,
        type: type,
        time: time,
        duration: duration,
        bounds: bounds,
        objectID: objectID,
      );
    }
    throw TypeError();
  }
}
