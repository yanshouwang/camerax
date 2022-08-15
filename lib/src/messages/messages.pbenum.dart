///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CommandCategory extends $pb.ProtobufEnum {
  static const CommandCategory COMMAND_CATEGORY_GET_QUARTER_TURNS =
      CommandCategory._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_GET_QUARTER_TURNS');
  static const CommandCategory
      COMMAND_CATEGORY_CAMERA_CONTROLLER_REQUEST_PERMISSION = CommandCategory._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_REQUEST_PERMISSION');
  static const CommandCategory COMMAND_CATEGORY_CAMERA_CONTROLLER_BIND =
      CommandCategory._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_BIND');
  static const CommandCategory COMMAND_CATEGORY_CAMERA_CONTROLLER_UNBIND =
      CommandCategory._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_UNBIND');
  static const CommandCategory COMMAND_CATEGORY_CAMERA_CONTROLLER_TORCH =
      CommandCategory._(
          4,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_TORCH');
  static const CommandCategory COMMAND_CATEGORY_CAMERA_CONTROLLER_ZOOM =
      CommandCategory._(
          5,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_ZOOM');
  static const CommandCategory COMMAND_CATEGORY_CAMERA_CONTROLLER_LINEAR_ZOOM =
      CommandCategory._(
          6,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_LINEAR_ZOOM');
  static const CommandCategory
      COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_AUTOMATICALLY =
      CommandCategory._(
          7,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_AUTOMATICALLY');
  static const CommandCategory
      COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_MANUALLY = CommandCategory._(
          8,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_MANUALLY');
  static const CommandCategory
      COMMAND_CATEGORY_CAMERA_CONTROLLER_CAPTURE_TO_MEMORY = CommandCategory._(
          9,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_CAMERA_CONTROLLER_CAPTURE_TO_MEMORY');
  static const CommandCategory COMMAND_CATEGORY_IMAGE_PROXY_CLOSE =
      CommandCategory._(
          10,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'COMMAND_CATEGORY_IMAGE_PROXY_CLOSE');

  static const $core.List<CommandCategory> values = <CommandCategory>[
    COMMAND_CATEGORY_GET_QUARTER_TURNS,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_REQUEST_PERMISSION,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_BIND,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_UNBIND,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_TORCH,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_ZOOM,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_LINEAR_ZOOM,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_AUTOMATICALLY,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_MANUALLY,
    COMMAND_CATEGORY_CAMERA_CONTROLLER_CAPTURE_TO_MEMORY,
    COMMAND_CATEGORY_IMAGE_PROXY_CLOSE,
  ];

  static final $core.Map<$core.int, CommandCategory> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CommandCategory? valueOf($core.int value) => _byValue[value];

  const CommandCategory._($core.int v, $core.String n) : super(v, n);
}

class EventCategory extends $pb.ProtobufEnum {
  static const EventCategory EVENT_CATEGORY_QUARTER_TURNS_CHANGED =
      EventCategory._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'EVENT_CATEGORY_QUARTER_TURNS_CHANGED');
  static const EventCategory EVENT_CATEGORY_CAMERA_CONTROLLER_IMAGE_PROXIED =
      EventCategory._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'EVENT_CATEGORY_CAMERA_CONTROLLER_IMAGE_PROXIED');

  static const $core.List<EventCategory> values = <EventCategory>[
    EVENT_CATEGORY_QUARTER_TURNS_CHANGED,
    EVENT_CATEGORY_CAMERA_CONTROLLER_IMAGE_PROXIED,
  ];

  static final $core.Map<$core.int, EventCategory> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static EventCategory? valueOf($core.int value) => _byValue[value];

  const EventCategory._($core.int v, $core.String n) : super(v, n);
}

class CameraFacing extends $pb.ProtobufEnum {
  static const CameraFacing CAMERA_FACING_BACK = CameraFacing._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CAMERA_FACING_BACK');
  static const CameraFacing CAMERA_FACING_FRONT = CameraFacing._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CAMERA_FACING_FRONT');

  static const $core.List<CameraFacing> values = <CameraFacing>[
    CAMERA_FACING_BACK,
    CAMERA_FACING_FRONT,
  ];

  static final $core.Map<$core.int, CameraFacing> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CameraFacing? valueOf($core.int value) => _byValue[value];

  const CameraFacing._($core.int v, $core.String n) : super(v, n);
}
