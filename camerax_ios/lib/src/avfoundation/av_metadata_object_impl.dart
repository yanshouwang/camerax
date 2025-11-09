import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin AVMetadataObjectImpl on AVMetadataObject {
  AVMetadataObjectProxyApi get api;
}

base mixin AVMetadataBodyObjectImpl
    on AVMetadataBodyObject, AVMetadataObjectImpl {
  @override
  AVMetadataBodyObjectProxyApi get api;
}

final class AVMetadataCatBodyObjectImpl extends AVMetadataCatBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataCatBodyObjectProxyApi api;

  AVMetadataCatBodyObjectImpl.internal(this.api) : super.impl();

  @override
  int get bodyID => api.bodyID;

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

final class AVMetadataDogBodyObjectImpl extends AVMetadataDogBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataDogBodyObjectProxyApi api;

  AVMetadataDogBodyObjectImpl.internal(this.api) : super.impl();

  @override
  int get bodyID => api.bodyID;

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

final class AVMetadataHumanBodyObjectImpl extends AVMetadataHumanBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataHumanBodyObjectProxyApi api;

  AVMetadataHumanBodyObjectImpl.internal(this.api) : super.impl();

  @override
  int get bodyID => api.bodyID;

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

final class AVMetadataHumanFullBodyObjectImpl
    extends AVMetadataHumanFullBodyObject
    with AVMetadataObjectImpl, AVMetadataBodyObjectImpl {
  @override
  final AVMetadataHumanFullBodyObjectProxyApi api;

  AVMetadataHumanFullBodyObjectImpl.internal(this.api) : super.impl();

  @override
  int get bodyID => api.bodyID;

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

final class AVMetadataFaceObjectImpl extends AVMetadataFaceObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataFaceObjectProxyApi api;

  AVMetadataFaceObjectImpl.internal(this.api) : super.impl();

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  int get faceID => api.faceID;

  @override
  bool get hasRollAngle => api.hasRollAngle;

  @override
  bool get hasYawAngle => api.hasYawAngle;

  @override
  double get rollAngle => api.rollAngle;

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;

  @override
  double get yawAngle => api.yawAngle;
}

final class AVMetadataMachineReadableCodeObjectImpl
    extends AVMetadataMachineReadableCodeObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataMachineReadableCodeObjectProxyApi api;

  AVMetadataMachineReadableCodeObjectImpl.internal(this.api) : super.impl();

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  List<Point<double>> get corners => api.corners.map((e) => e.impl).toList();

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  String? get stringValue => api.stringValue;

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

final class AVMetadataSalientObjectImpl extends AVMetadataSalientObject
    with AVMetadataObjectImpl {
  @override
  final AVMetadataSalientObjectProxyApi api;

  AVMetadataSalientObjectImpl.internal(this.api) : super.impl();

  @override
  Rect<double> get bounds => api.bounds.impl;

  @override
  Duration get duration => Duration(milliseconds: api.duration);

  @override
  int get objectID => api.objectID;

  @override
  DateTime get time => DateTime.fromMillisecondsSinceEpoch(api.time);

  @override
  AVMetadataObjectType get type => api.type.impl;
}

extension AVMetadataObjectTypeX on AVMetadataObjectType {
  AVMetadataObjectTypeApi get api => AVMetadataObjectTypeApi.values[index];
}

extension AVMetadataObjectTypeApiX on AVMetadataObjectTypeApi {
  AVMetadataObjectType get impl => AVMetadataObjectType.values[index];
}

extension AVMetadataObjectProxyApiX on AVMetadataObjectProxyApi {
  AVMetadataObject get impl {
    final api = this;
    if (api is AVMetadataCatBodyObjectProxyApi) {
      return AVMetadataCatBodyObjectImpl.internal(api);
    }
    if (api is AVMetadataDogBodyObjectProxyApi) {
      return AVMetadataDogBodyObjectImpl.internal(api);
    }
    if (api is AVMetadataHumanBodyObjectProxyApi) {
      return AVMetadataHumanBodyObjectImpl.internal(api);
    }
    if (api is AVMetadataHumanFullBodyObjectProxyApi) {
      return AVMetadataHumanFullBodyObjectImpl.internal(api);
    }
    if (api is AVMetadataFaceObjectProxyApi) {
      return AVMetadataFaceObjectImpl.internal(api);
    }
    if (api is AVMetadataMachineReadableCodeObjectProxyApi) {
      return AVMetadataMachineReadableCodeObjectImpl.internal(api);
    }
    if (api is AVMetadataSalientObjectProxyApi) {
      return AVMetadataSalientObjectImpl.internal(api);
    }
    throw TypeError();
  }
}
