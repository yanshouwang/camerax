import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'av_capture_impl.dart';

base mixin AVMetadataObjectImpl on AVMetadataObject {
  AVMetadataObjectProxyApi get api;

  @override
  Future<AVMetadataObjectType> getType() => api.getType().then((e) => e.impl);
  @override
  Future<DateTime> getTime() =>
      api.getTime().then((e) => DateTime.fromMillisecondsSinceEpoch(e));
  @override
  Future<Duration> getDuration() =>
      api.getDuration().then((e) => Duration(milliseconds: e));
  @override
  Future<Rect<double>> getBounds() => api.getBounds().then((e) => e.impl);
  @override
  Future<bool> isFixedFocus() => api.isFixedFocus();
  @override
  Future<AVCaptureDeviceCinematicVideoFocusMode> getCinematicVideoFocusMode() =>
      api.getCinematicVideoFocusMode().then((e) => e.impl);
  @override
  Future<int> getGroupID() => api.getGroupID();
  @override
  Future<int> getObjectID() => api.getObjectID();
}

base mixin AVMetadataBodyObjectImpl
    on AVMetadataBodyObject, AVMetadataObjectImpl {
  @override
  AVMetadataBodyObjectProxyApi get api;

  @override
  Future<int> getBodyID() => api.getBodyID();
}

final class AVMetadataCatHeadObjectImpl extends AVMetadataCatHeadObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataCatHeadObjectProxyApi api;

  AVMetadataCatHeadObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataDogHeadObjectImpl extends AVMetadataDogHeadObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataDogHeadObjectProxyApi api;

  AVMetadataDogHeadObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataCatBodyObjectImpl extends AVMetadataCatBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataCatBodyObjectProxyApi api;

  AVMetadataCatBodyObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataDogBodyObjectImpl extends AVMetadataDogBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataDogBodyObjectProxyApi api;

  AVMetadataDogBodyObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataHumanBodyObjectImpl extends AVMetadataHumanBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataHumanBodyObjectProxyApi api;

  AVMetadataHumanBodyObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataHumanFullBodyObjectImpl
    extends AVMetadataHumanFullBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataHumanFullBodyObjectProxyApi api;

  AVMetadataHumanFullBodyObjectImpl.internal(this.api) : super.impl();
}

final class AVMetadataFaceObjectImpl extends AVMetadataFaceObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataFaceObjectProxyApi api;

  AVMetadataFaceObjectImpl.internal(this.api) : super.impl();

  @override
  Future<int> getFaceID() => api.getFaceID();
  @override
  Future<bool> hasRollAngle() => api.hasRollAngle();
  @override
  Future<double> getRollAngle() => api.getRollAngle();
  @override
  Future<bool> hasYawAngle() => api.hasYawAngle();
  @override
  Future<double> getYawAngle() => api.getYawAngle();
}

final class AVMetadataMachineReadableCodeObjectImpl
    extends AVMetadataMachineReadableCodeObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataMachineReadableCodeObjectProxyApi api;

  AVMetadataMachineReadableCodeObjectImpl.internal(this.api) : super.impl();

  @override
  Future<List<Point<double>>> getCorners() =>
      api.getCorners().then((e) => e.map((e) => e.impl).toList());
  @override
  Future<String?> getStringValue() => api.getStringValue();
}

final class AVMetadataSalientObjectImpl extends AVMetadataSalientObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataSalientObjectProxyApi api;

  AVMetadataSalientObjectImpl.internal(this.api) : super.impl();
}

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];

  VisionObjectType get vimpl {
    switch (this) {
      case AVMetadataObjectTypeApi.codabar:
        return VisionObjectType.codabar;
      case AVMetadataObjectTypeApi.code39:
        return VisionObjectType.code39;
      case AVMetadataObjectTypeApi.code39Mod43:
        throw ArgumentError.value(this);
      case AVMetadataObjectTypeApi.code93:
        return VisionObjectType.code93;
      case AVMetadataObjectTypeApi.code128:
        return VisionObjectType.code128;
      case AVMetadataObjectTypeApi.ean8:
        return VisionObjectType.ean8;
      case AVMetadataObjectTypeApi.ean13:
        return VisionObjectType.ean13;
      case AVMetadataObjectTypeApi.gs1DataBar:
      // return VisionObjectType.gs1DataBar;
      case AVMetadataObjectTypeApi.gs1DataBarExpanded:
      // return VisionObjectType.gs1DataBarExpanded;
      case AVMetadataObjectTypeApi.gs1DataBarLimited:
      // return VisionObjectType.gs1DataBarLimited;
      case AVMetadataObjectTypeApi.interleaved2of5:
        // return VisionObjectType.interleaved2of5;
        throw ArgumentError.value(this);
      case AVMetadataObjectTypeApi.itf14:
        return VisionObjectType.itf14;
      case AVMetadataObjectTypeApi.upce:
        return VisionObjectType.upce;
      case AVMetadataObjectTypeApi.aztec:
        return VisionObjectType.aztec;
      case AVMetadataObjectTypeApi.dataMatrix:
        return VisionObjectType.dataMatrix;
      case AVMetadataObjectTypeApi.microPDF417:
      // return VisionObjectType.microPDF417;
      case AVMetadataObjectTypeApi.microQR:
        // return VisionObjectType.microQR;
        throw ArgumentError.value(this);
      case AVMetadataObjectTypeApi.pdf417:
        return VisionObjectType.pdf417;
      case AVMetadataObjectTypeApi.qr:
        return VisionObjectType.qr;
      case AVMetadataObjectTypeApi.humanBody:
      // return VisionObjectType.humanBody;
      case AVMetadataObjectTypeApi.humanFullBody:
      // return VisionObjectType.humanFullBody;
      case AVMetadataObjectTypeApi.dogHead:
      // return VisionObjectType.dogHead;
      case AVMetadataObjectTypeApi.dogBody:
      // return VisionObjectType.dogBody;
      case AVMetadataObjectTypeApi.catHead:
      // return VisionObjectType.catHead;
      case AVMetadataObjectTypeApi.catBody:
        // return VisionObjectType.catBody;
        throw ArgumentError.value(this);
      case AVMetadataObjectTypeApi.face:
        return VisionObjectType.face;
      case AVMetadataObjectTypeApi.salientObject:
        // return VisionObjectType.salientObject;
        throw ArgumentError.value(this);
    }
  }
}

extension AVMetadataObjectProxyApiX on AVMetadataObjectProxyApi {
  AVMetadataObject get impl {
    final api = this;
    if (api is AVMetadataCatHeadObjectProxyApi) {
      return AVMetadataCatHeadObjectImpl.internal(api);
    } else if (api is AVMetadataDogHeadObjectProxyApi) {
      return AVMetadataDogHeadObjectImpl.internal(api);
    } else if (api is AVMetadataCatBodyObjectProxyApi) {
      return AVMetadataCatBodyObjectImpl.internal(api);
    } else if (api is AVMetadataDogBodyObjectProxyApi) {
      return AVMetadataDogBodyObjectImpl.internal(api);
    } else if (api is AVMetadataHumanBodyObjectProxyApi) {
      return AVMetadataHumanBodyObjectImpl.internal(api);
    } else if (api is AVMetadataHumanFullBodyObjectProxyApi) {
      return AVMetadataHumanFullBodyObjectImpl.internal(api);
    } else if (api is AVMetadataFaceObjectProxyApi) {
      return AVMetadataFaceObjectImpl.internal(api);
    } else if (api is AVMetadataMachineReadableCodeObjectProxyApi) {
      return AVMetadataMachineReadableCodeObjectImpl.internal(api);
    } else if (api is AVMetadataSalientObjectProxyApi) {
      return AVMetadataSalientObjectImpl.internal(api);
    } else {
      throw TypeError();
    }
  }

  Future<VisionObject> vimpl() async {
    final api = this;
    final type = await api.getType().then((e) => e.vimpl);
    final bounds = await api.getBounds().then((e) => e.impl);
    if (api is AVMetadataFaceObjectProxyApi) {
      final id = await api.getFaceID();
      final rollAngle = await api.hasRollAngle()
          ? await api.getRollAngle()
          : null;
      final yawAngle = await api.hasYawAngle() ? await api.getYawAngle() : null;
      return VisionFaceObjectImpl.internal(
        api,
        type,
        bounds,
        id,
        rollAngle,
        yawAngle,
      );
    } else if (api is AVMetadataMachineReadableCodeObjectProxyApi) {
      final corners = await api.getCorners().then(
        (e) => e.map((e1) => e1.impl).toList(),
      );
      final value = await api.getStringValue();
      return VisionMachineReadableCodeObjectImpl.internal(
        api,
        type,
        bounds,
        corners,
        value,
      );
    } else {
      throw TypeError();
    }
  }
}
