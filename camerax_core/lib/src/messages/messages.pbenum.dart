///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ScaleType extends $pb.ProtobufEnum {
  static const ScaleType SCALE_TYPE_FILL_START = ScaleType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FILL_START');
  static const ScaleType SCALE_TYPE_FILL_CENTER = ScaleType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FILL_CENTER');
  static const ScaleType SCALE_TYPE_FILL_END = ScaleType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FILL_END');
  static const ScaleType SCALE_TYPE_FIT_START = ScaleType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FIT_START');
  static const ScaleType SCALE_TYPE_FIT_CENTER = ScaleType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FIT_CENTER');
  static const ScaleType SCALE_TYPE_FIT_END = ScaleType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCALE_TYPE_FIT_END');

  static const $core.List<ScaleType> values = <ScaleType> [
    SCALE_TYPE_FILL_START,
    SCALE_TYPE_FILL_CENTER,
    SCALE_TYPE_FILL_END,
    SCALE_TYPE_FIT_START,
    SCALE_TYPE_FIT_CENTER,
    SCALE_TYPE_FIT_END,
  ];

  static final $core.Map<$core.int, ScaleType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ScaleType? valueOf($core.int value) => _byValue[value];

  const ScaleType._($core.int v, $core.String n) : super(v, n);
}

class CameraFacing extends $pb.ProtobufEnum {
  static const CameraFacing CAMERA_FACING_BACK = CameraFacing._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAMERA_FACING_BACK');
  static const CameraFacing CAMERA_FACING_FRONT = CameraFacing._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAMERA_FACING_FRONT');

  static const $core.List<CameraFacing> values = <CameraFacing> [
    CAMERA_FACING_BACK,
    CAMERA_FACING_FRONT,
  ];

  static final $core.Map<$core.int, CameraFacing> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CameraFacing? valueOf($core.int value) => _byValue[value];

  const CameraFacing._($core.int v, $core.String n) : super(v, n);
}

