///
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

enum Command_Arguments {
  cameraControllerBindArguments,
  cameraControllerUnbindArguments,
  cameraControllerTorchArguments,
  cameraControllerZoomArguments,
  cameraControllerLinearZoomArguments,
  cameraControllerFocusAutomaticallyArguments,
  cameraControllerFocusManuallyArguments,
  cameraControllerCaptureToMemoryArguments,
  imageProxyCloseArguments,
  notSet
}

class Command extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Command_Arguments> _Command_ArgumentsByTag =
      {
    2: Command_Arguments.cameraControllerBindArguments,
    3: Command_Arguments.cameraControllerUnbindArguments,
    4: Command_Arguments.cameraControllerTorchArguments,
    5: Command_Arguments.cameraControllerZoomArguments,
    6: Command_Arguments.cameraControllerLinearZoomArguments,
    7: Command_Arguments.cameraControllerFocusAutomaticallyArguments,
    8: Command_Arguments.cameraControllerFocusManuallyArguments,
    9: Command_Arguments.cameraControllerCaptureToMemoryArguments,
    10: Command_Arguments.imageProxyCloseArguments,
    0: Command_Arguments.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Command',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9, 10])
    ..e<CommandCategory>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        $pb.PbFieldType.OE,
        defaultOrMaker: CommandCategory.COMMAND_CATEGORY_GET_QUARTER_TURNS,
        valueOf: CommandCategory.valueOf,
        enumValues: CommandCategory.values)
    ..aOM<CameraControllerBindCommandArguments>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerBindArguments',
        subBuilder: CameraControllerBindCommandArguments.create)
    ..aOM<CameraControllerUnbindCommandArguments>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerUnbindArguments',
        subBuilder: CameraControllerUnbindCommandArguments.create)
    ..aOM<CameraControllerTorchCommandArguments>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerTorchArguments',
        subBuilder: CameraControllerTorchCommandArguments.create)
    ..aOM<CameraControllerZoomCommandArguments>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerZoomArguments',
        subBuilder: CameraControllerZoomCommandArguments.create)
    ..aOM<CameraControllerLinearZoomCommandArguments>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerLinearZoomArguments',
        subBuilder: CameraControllerLinearZoomCommandArguments.create)
    ..aOM<CameraControllerFocusAutomaticallyCommandArguments>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerFocusAutomaticallyArguments',
        subBuilder: CameraControllerFocusAutomaticallyCommandArguments.create)
    ..aOM<CameraControllerFocusManuallyCommandArguments>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerFocusManuallyArguments',
        subBuilder: CameraControllerFocusManuallyCommandArguments.create)
    ..aOM<CameraControllerCaptureToMemoryCommandArguments>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerCaptureToMemoryArguments',
        subBuilder: CameraControllerCaptureToMemoryCommandArguments.create)
    ..aOM<ImageProxyCloseCommandArguments>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageProxyCloseArguments',
        subBuilder: ImageProxyCloseCommandArguments.create)
    ..hasRequiredFields = false;

  Command._() : super();
  factory Command({
    CommandCategory? category,
    CameraControllerBindCommandArguments? cameraControllerBindArguments,
    CameraControllerUnbindCommandArguments? cameraControllerUnbindArguments,
    CameraControllerTorchCommandArguments? cameraControllerTorchArguments,
    CameraControllerZoomCommandArguments? cameraControllerZoomArguments,
    CameraControllerLinearZoomCommandArguments?
        cameraControllerLinearZoomArguments,
    CameraControllerFocusAutomaticallyCommandArguments?
        cameraControllerFocusAutomaticallyArguments,
    CameraControllerFocusManuallyCommandArguments?
        cameraControllerFocusManuallyArguments,
    CameraControllerCaptureToMemoryCommandArguments?
        cameraControllerCaptureToMemoryArguments,
    ImageProxyCloseCommandArguments? imageProxyCloseArguments,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (cameraControllerBindArguments != null) {
      _result.cameraControllerBindArguments = cameraControllerBindArguments;
    }
    if (cameraControllerUnbindArguments != null) {
      _result.cameraControllerUnbindArguments = cameraControllerUnbindArguments;
    }
    if (cameraControllerTorchArguments != null) {
      _result.cameraControllerTorchArguments = cameraControllerTorchArguments;
    }
    if (cameraControllerZoomArguments != null) {
      _result.cameraControllerZoomArguments = cameraControllerZoomArguments;
    }
    if (cameraControllerLinearZoomArguments != null) {
      _result.cameraControllerLinearZoomArguments =
          cameraControllerLinearZoomArguments;
    }
    if (cameraControllerFocusAutomaticallyArguments != null) {
      _result.cameraControllerFocusAutomaticallyArguments =
          cameraControllerFocusAutomaticallyArguments;
    }
    if (cameraControllerFocusManuallyArguments != null) {
      _result.cameraControllerFocusManuallyArguments =
          cameraControllerFocusManuallyArguments;
    }
    if (cameraControllerCaptureToMemoryArguments != null) {
      _result.cameraControllerCaptureToMemoryArguments =
          cameraControllerCaptureToMemoryArguments;
    }
    if (imageProxyCloseArguments != null) {
      _result.imageProxyCloseArguments = imageProxyCloseArguments;
    }
    return _result;
  }
  factory Command.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Command.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Command clone() => Command()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Command copyWith(void Function(Command) updates) =>
      super.copyWith((message) => updates(message as Command))
          as Command; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Command create() => Command._();
  Command createEmptyInstance() => create();
  static $pb.PbList<Command> createRepeated() => $pb.PbList<Command>();
  @$core.pragma('dart2js:noInline')
  static Command getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Command>(create);
  static Command? _defaultInstance;

  Command_Arguments whichArguments() =>
      _Command_ArgumentsByTag[$_whichOneof(0)]!;
  void clearArguments() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  CommandCategory get category => $_getN(0);
  @$pb.TagNumber(1)
  set category(CommandCategory v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  CameraControllerBindCommandArguments get cameraControllerBindArguments =>
      $_getN(1);
  @$pb.TagNumber(2)
  set cameraControllerBindArguments(CameraControllerBindCommandArguments v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCameraControllerBindArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraControllerBindArguments() => clearField(2);
  @$pb.TagNumber(2)
  CameraControllerBindCommandArguments ensureCameraControllerBindArguments() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  CameraControllerUnbindCommandArguments get cameraControllerUnbindArguments =>
      $_getN(2);
  @$pb.TagNumber(3)
  set cameraControllerUnbindArguments(
      CameraControllerUnbindCommandArguments v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCameraControllerUnbindArguments() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraControllerUnbindArguments() => clearField(3);
  @$pb.TagNumber(3)
  CameraControllerUnbindCommandArguments
      ensureCameraControllerUnbindArguments() => $_ensure(2);

  @$pb.TagNumber(4)
  CameraControllerTorchCommandArguments get cameraControllerTorchArguments =>
      $_getN(3);
  @$pb.TagNumber(4)
  set cameraControllerTorchArguments(CameraControllerTorchCommandArguments v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCameraControllerTorchArguments() => $_has(3);
  @$pb.TagNumber(4)
  void clearCameraControllerTorchArguments() => clearField(4);
  @$pb.TagNumber(4)
  CameraControllerTorchCommandArguments
      ensureCameraControllerTorchArguments() => $_ensure(3);

  @$pb.TagNumber(5)
  CameraControllerZoomCommandArguments get cameraControllerZoomArguments =>
      $_getN(4);
  @$pb.TagNumber(5)
  set cameraControllerZoomArguments(CameraControllerZoomCommandArguments v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCameraControllerZoomArguments() => $_has(4);
  @$pb.TagNumber(5)
  void clearCameraControllerZoomArguments() => clearField(5);
  @$pb.TagNumber(5)
  CameraControllerZoomCommandArguments ensureCameraControllerZoomArguments() =>
      $_ensure(4);

  @$pb.TagNumber(6)
  CameraControllerLinearZoomCommandArguments
      get cameraControllerLinearZoomArguments => $_getN(5);
  @$pb.TagNumber(6)
  set cameraControllerLinearZoomArguments(
      CameraControllerLinearZoomCommandArguments v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCameraControllerLinearZoomArguments() => $_has(5);
  @$pb.TagNumber(6)
  void clearCameraControllerLinearZoomArguments() => clearField(6);
  @$pb.TagNumber(6)
  CameraControllerLinearZoomCommandArguments
      ensureCameraControllerLinearZoomArguments() => $_ensure(5);

  @$pb.TagNumber(7)
  CameraControllerFocusAutomaticallyCommandArguments
      get cameraControllerFocusAutomaticallyArguments => $_getN(6);
  @$pb.TagNumber(7)
  set cameraControllerFocusAutomaticallyArguments(
      CameraControllerFocusAutomaticallyCommandArguments v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCameraControllerFocusAutomaticallyArguments() => $_has(6);
  @$pb.TagNumber(7)
  void clearCameraControllerFocusAutomaticallyArguments() => clearField(7);
  @$pb.TagNumber(7)
  CameraControllerFocusAutomaticallyCommandArguments
      ensureCameraControllerFocusAutomaticallyArguments() => $_ensure(6);

  @$pb.TagNumber(8)
  CameraControllerFocusManuallyCommandArguments
      get cameraControllerFocusManuallyArguments => $_getN(7);
  @$pb.TagNumber(8)
  set cameraControllerFocusManuallyArguments(
      CameraControllerFocusManuallyCommandArguments v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCameraControllerFocusManuallyArguments() => $_has(7);
  @$pb.TagNumber(8)
  void clearCameraControllerFocusManuallyArguments() => clearField(8);
  @$pb.TagNumber(8)
  CameraControllerFocusManuallyCommandArguments
      ensureCameraControllerFocusManuallyArguments() => $_ensure(7);

  @$pb.TagNumber(9)
  CameraControllerCaptureToMemoryCommandArguments
      get cameraControllerCaptureToMemoryArguments => $_getN(8);
  @$pb.TagNumber(9)
  set cameraControllerCaptureToMemoryArguments(
      CameraControllerCaptureToMemoryCommandArguments v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCameraControllerCaptureToMemoryArguments() => $_has(8);
  @$pb.TagNumber(9)
  void clearCameraControllerCaptureToMemoryArguments() => clearField(9);
  @$pb.TagNumber(9)
  CameraControllerCaptureToMemoryCommandArguments
      ensureCameraControllerCaptureToMemoryArguments() => $_ensure(8);

  @$pb.TagNumber(10)
  ImageProxyCloseCommandArguments get imageProxyCloseArguments => $_getN(9);
  @$pb.TagNumber(10)
  set imageProxyCloseArguments(ImageProxyCloseCommandArguments v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasImageProxyCloseArguments() => $_has(9);
  @$pb.TagNumber(10)
  void clearImageProxyCloseArguments() => clearField(10);
  @$pb.TagNumber(10)
  ImageProxyCloseCommandArguments ensureImageProxyCloseArguments() =>
      $_ensure(9);
}

class CameraControllerBindCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerBindCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..hasRequiredFields = false;

  CameraControllerBindCommandArguments._() : super();
  factory CameraControllerBindCommandArguments({
    CameraSelector? selector,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    return _result;
  }
  factory CameraControllerBindCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerBindCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerBindCommandArguments clone() =>
      CameraControllerBindCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerBindCommandArguments copyWith(
          void Function(CameraControllerBindCommandArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerBindCommandArguments))
          as CameraControllerBindCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerBindCommandArguments create() =>
      CameraControllerBindCommandArguments._();
  CameraControllerBindCommandArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerBindCommandArguments> createRepeated() =>
      $pb.PbList<CameraControllerBindCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerBindCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerBindCommandArguments>(create);
  static CameraControllerBindCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);
}

class CameraControllerUnbindCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerUnbindCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..hasRequiredFields = false;

  CameraControllerUnbindCommandArguments._() : super();
  factory CameraControllerUnbindCommandArguments({
    CameraSelector? selector,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    return _result;
  }
  factory CameraControllerUnbindCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerUnbindCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerUnbindCommandArguments clone() =>
      CameraControllerUnbindCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerUnbindCommandArguments copyWith(
          void Function(CameraControllerUnbindCommandArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerUnbindCommandArguments))
          as CameraControllerUnbindCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerUnbindCommandArguments create() =>
      CameraControllerUnbindCommandArguments._();
  CameraControllerUnbindCommandArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerUnbindCommandArguments> createRepeated() =>
      $pb.PbList<CameraControllerUnbindCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerUnbindCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerUnbindCommandArguments>(create);
  static CameraControllerUnbindCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);
}

class CameraControllerTorchCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerTorchCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..hasRequiredFields = false;

  CameraControllerTorchCommandArguments._() : super();
  factory CameraControllerTorchCommandArguments({
    CameraSelector? selector,
    $core.bool? state,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory CameraControllerTorchCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerTorchCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerTorchCommandArguments clone() =>
      CameraControllerTorchCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerTorchCommandArguments copyWith(
          void Function(CameraControllerTorchCommandArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerTorchCommandArguments))
          as CameraControllerTorchCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerTorchCommandArguments create() =>
      CameraControllerTorchCommandArguments._();
  CameraControllerTorchCommandArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerTorchCommandArguments> createRepeated() =>
      $pb.PbList<CameraControllerTorchCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerTorchCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerTorchCommandArguments>(create);
  static CameraControllerTorchCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get state => $_getBF(1);
  @$pb.TagNumber(2)
  set state($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class CameraControllerZoomCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerZoomCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  CameraControllerZoomCommandArguments._() : super();
  factory CameraControllerZoomCommandArguments({
    CameraSelector? selector,
    $core.double? value,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory CameraControllerZoomCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerZoomCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerZoomCommandArguments clone() =>
      CameraControllerZoomCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerZoomCommandArguments copyWith(
          void Function(CameraControllerZoomCommandArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerZoomCommandArguments))
          as CameraControllerZoomCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerZoomCommandArguments create() =>
      CameraControllerZoomCommandArguments._();
  CameraControllerZoomCommandArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerZoomCommandArguments> createRepeated() =>
      $pb.PbList<CameraControllerZoomCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerZoomCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerZoomCommandArguments>(create);
  static CameraControllerZoomCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class CameraControllerLinearZoomCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerLinearZoomCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  CameraControllerLinearZoomCommandArguments._() : super();
  factory CameraControllerLinearZoomCommandArguments({
    CameraSelector? selector,
    $core.double? value,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory CameraControllerLinearZoomCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerLinearZoomCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerLinearZoomCommandArguments clone() =>
      CameraControllerLinearZoomCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerLinearZoomCommandArguments copyWith(
          void Function(CameraControllerLinearZoomCommandArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerLinearZoomCommandArguments))
          as CameraControllerLinearZoomCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerLinearZoomCommandArguments create() =>
      CameraControllerLinearZoomCommandArguments._();
  CameraControllerLinearZoomCommandArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerLinearZoomCommandArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerLinearZoomCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerLinearZoomCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerLinearZoomCommandArguments>(create);
  static CameraControllerLinearZoomCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class CameraControllerFocusAutomaticallyCommandArguments
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerFocusAutomaticallyCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..hasRequiredFields = false;

  CameraControllerFocusAutomaticallyCommandArguments._() : super();
  factory CameraControllerFocusAutomaticallyCommandArguments({
    CameraSelector? selector,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    return _result;
  }
  factory CameraControllerFocusAutomaticallyCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerFocusAutomaticallyCommandArguments.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerFocusAutomaticallyCommandArguments clone() =>
      CameraControllerFocusAutomaticallyCommandArguments()
        ..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerFocusAutomaticallyCommandArguments copyWith(
          void Function(CameraControllerFocusAutomaticallyCommandArguments)
              updates) =>
      super.copyWith((message) => updates(
              message as CameraControllerFocusAutomaticallyCommandArguments))
          as CameraControllerFocusAutomaticallyCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerFocusAutomaticallyCommandArguments create() =>
      CameraControllerFocusAutomaticallyCommandArguments._();
  CameraControllerFocusAutomaticallyCommandArguments createEmptyInstance() =>
      create();
  static $pb.PbList<CameraControllerFocusAutomaticallyCommandArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerFocusAutomaticallyCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerFocusAutomaticallyCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerFocusAutomaticallyCommandArguments>(create);
  static CameraControllerFocusAutomaticallyCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);
}

class CameraControllerFocusManuallyCommandArguments
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerFocusManuallyCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'x',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'y',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  CameraControllerFocusManuallyCommandArguments._() : super();
  factory CameraControllerFocusManuallyCommandArguments({
    CameraSelector? selector,
    $core.double? width,
    $core.double? height,
    $core.double? x,
    $core.double? y,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory CameraControllerFocusManuallyCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerFocusManuallyCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerFocusManuallyCommandArguments clone() =>
      CameraControllerFocusManuallyCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerFocusManuallyCommandArguments copyWith(
          void Function(CameraControllerFocusManuallyCommandArguments)
              updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerFocusManuallyCommandArguments))
          as CameraControllerFocusManuallyCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerFocusManuallyCommandArguments create() =>
      CameraControllerFocusManuallyCommandArguments._();
  CameraControllerFocusManuallyCommandArguments createEmptyInstance() =>
      create();
  static $pb.PbList<CameraControllerFocusManuallyCommandArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerFocusManuallyCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerFocusManuallyCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerFocusManuallyCommandArguments>(create);
  static CameraControllerFocusManuallyCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.double get width => $_getN(1);
  @$pb.TagNumber(2)
  set width($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get height => $_getN(2);
  @$pb.TagNumber(3)
  set height($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get x => $_getN(3);
  @$pb.TagNumber(4)
  set x($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasX() => $_has(3);
  @$pb.TagNumber(4)
  void clearX() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get y => $_getN(4);
  @$pb.TagNumber(5)
  set y($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasY() => $_has(4);
  @$pb.TagNumber(5)
  void clearY() => clearField(5);
}

class CameraControllerCaptureToMemoryCommandArguments
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerCaptureToMemoryCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..hasRequiredFields = false;

  CameraControllerCaptureToMemoryCommandArguments._() : super();
  factory CameraControllerCaptureToMemoryCommandArguments({
    CameraSelector? selector,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    return _result;
  }
  factory CameraControllerCaptureToMemoryCommandArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerCaptureToMemoryCommandArguments.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerCaptureToMemoryCommandArguments clone() =>
      CameraControllerCaptureToMemoryCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerCaptureToMemoryCommandArguments copyWith(
          void Function(CameraControllerCaptureToMemoryCommandArguments)
              updates) =>
      super.copyWith((message) => updates(
              message as CameraControllerCaptureToMemoryCommandArguments))
          as CameraControllerCaptureToMemoryCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerCaptureToMemoryCommandArguments create() =>
      CameraControllerCaptureToMemoryCommandArguments._();
  CameraControllerCaptureToMemoryCommandArguments createEmptyInstance() =>
      create();
  static $pb.PbList<CameraControllerCaptureToMemoryCommandArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerCaptureToMemoryCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerCaptureToMemoryCommandArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerCaptureToMemoryCommandArguments>(create);
  static CameraControllerCaptureToMemoryCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);
}

class ImageProxyCloseCommandArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImageProxyCloseCommandArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..hasRequiredFields = false;

  ImageProxyCloseCommandArguments._() : super();
  factory ImageProxyCloseCommandArguments({
    CameraSelector? selector,
    $core.String? id,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ImageProxyCloseCommandArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImageProxyCloseCommandArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImageProxyCloseCommandArguments clone() =>
      ImageProxyCloseCommandArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImageProxyCloseCommandArguments copyWith(
          void Function(ImageProxyCloseCommandArguments) updates) =>
      super.copyWith(
              (message) => updates(message as ImageProxyCloseCommandArguments))
          as ImageProxyCloseCommandArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageProxyCloseCommandArguments create() =>
      ImageProxyCloseCommandArguments._();
  ImageProxyCloseCommandArguments createEmptyInstance() => create();
  static $pb.PbList<ImageProxyCloseCommandArguments> createRepeated() =>
      $pb.PbList<ImageProxyCloseCommandArguments>();
  @$core.pragma('dart2js:noInline')
  static ImageProxyCloseCommandArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageProxyCloseCommandArguments>(
          create);
  static ImageProxyCloseCommandArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

enum Reply_Arguments {
  getQuarterTurnsArguments,
  cameraControllerRequestPermissionArguments,
  cameraControllerBindArguments,
  cameraControllerCaptureToMemoryArguments,
  notSet
}

class Reply extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Reply_Arguments> _Reply_ArgumentsByTag = {
    1: Reply_Arguments.getQuarterTurnsArguments,
    2: Reply_Arguments.cameraControllerRequestPermissionArguments,
    3: Reply_Arguments.cameraControllerBindArguments,
    4: Reply_Arguments.cameraControllerCaptureToMemoryArguments,
    0: Reply_Arguments.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Reply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<GetQuarterTurnsReplyArguments>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'getQuarterTurnsArguments',
        subBuilder: GetQuarterTurnsReplyArguments.create)
    ..aOM<CameraControllerRequestPermissionReplyArguments>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerRequestPermissionArguments',
        subBuilder: CameraControllerRequestPermissionReplyArguments.create)
    ..aOM<CameraControllerBindReplyArguments>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerBindArguments',
        subBuilder: CameraControllerBindReplyArguments.create)
    ..aOM<CameraControllerCaptureToMemoryReplyArguments>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerCaptureToMemoryArguments',
        subBuilder: CameraControllerCaptureToMemoryReplyArguments.create)
    ..hasRequiredFields = false;

  Reply._() : super();
  factory Reply({
    GetQuarterTurnsReplyArguments? getQuarterTurnsArguments,
    CameraControllerRequestPermissionReplyArguments?
        cameraControllerRequestPermissionArguments,
    CameraControllerBindReplyArguments? cameraControllerBindArguments,
    CameraControllerCaptureToMemoryReplyArguments?
        cameraControllerCaptureToMemoryArguments,
  }) {
    final _result = create();
    if (getQuarterTurnsArguments != null) {
      _result.getQuarterTurnsArguments = getQuarterTurnsArguments;
    }
    if (cameraControllerRequestPermissionArguments != null) {
      _result.cameraControllerRequestPermissionArguments =
          cameraControllerRequestPermissionArguments;
    }
    if (cameraControllerBindArguments != null) {
      _result.cameraControllerBindArguments = cameraControllerBindArguments;
    }
    if (cameraControllerCaptureToMemoryArguments != null) {
      _result.cameraControllerCaptureToMemoryArguments =
          cameraControllerCaptureToMemoryArguments;
    }
    return _result;
  }
  factory Reply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Reply copyWith(void Function(Reply) updates) =>
      super.copyWith((message) => updates(message as Reply))
          as Reply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  Reply_Arguments whichArguments() => _Reply_ArgumentsByTag[$_whichOneof(0)]!;
  void clearArguments() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GetQuarterTurnsReplyArguments get getQuarterTurnsArguments => $_getN(0);
  @$pb.TagNumber(1)
  set getQuarterTurnsArguments(GetQuarterTurnsReplyArguments v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGetQuarterTurnsArguments() => $_has(0);
  @$pb.TagNumber(1)
  void clearGetQuarterTurnsArguments() => clearField(1);
  @$pb.TagNumber(1)
  GetQuarterTurnsReplyArguments ensureGetQuarterTurnsArguments() => $_ensure(0);

  @$pb.TagNumber(2)
  CameraControllerRequestPermissionReplyArguments
      get cameraControllerRequestPermissionArguments => $_getN(1);
  @$pb.TagNumber(2)
  set cameraControllerRequestPermissionArguments(
      CameraControllerRequestPermissionReplyArguments v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCameraControllerRequestPermissionArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearCameraControllerRequestPermissionArguments() => clearField(2);
  @$pb.TagNumber(2)
  CameraControllerRequestPermissionReplyArguments
      ensureCameraControllerRequestPermissionArguments() => $_ensure(1);

  @$pb.TagNumber(3)
  CameraControllerBindReplyArguments get cameraControllerBindArguments =>
      $_getN(2);
  @$pb.TagNumber(3)
  set cameraControllerBindArguments(CameraControllerBindReplyArguments v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCameraControllerBindArguments() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraControllerBindArguments() => clearField(3);
  @$pb.TagNumber(3)
  CameraControllerBindReplyArguments ensureCameraControllerBindArguments() =>
      $_ensure(2);

  @$pb.TagNumber(4)
  CameraControllerCaptureToMemoryReplyArguments
      get cameraControllerCaptureToMemoryArguments => $_getN(3);
  @$pb.TagNumber(4)
  set cameraControllerCaptureToMemoryArguments(
      CameraControllerCaptureToMemoryReplyArguments v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCameraControllerCaptureToMemoryArguments() => $_has(3);
  @$pb.TagNumber(4)
  void clearCameraControllerCaptureToMemoryArguments() => clearField(4);
  @$pb.TagNumber(4)
  CameraControllerCaptureToMemoryReplyArguments
      ensureCameraControllerCaptureToMemoryArguments() => $_ensure(3);
}

class GetQuarterTurnsReplyArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetQuarterTurnsReplyArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quarterTurns',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GetQuarterTurnsReplyArguments._() : super();
  factory GetQuarterTurnsReplyArguments({
    $core.int? quarterTurns,
  }) {
    final _result = create();
    if (quarterTurns != null) {
      _result.quarterTurns = quarterTurns;
    }
    return _result;
  }
  factory GetQuarterTurnsReplyArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetQuarterTurnsReplyArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetQuarterTurnsReplyArguments clone() =>
      GetQuarterTurnsReplyArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetQuarterTurnsReplyArguments copyWith(
          void Function(GetQuarterTurnsReplyArguments) updates) =>
      super.copyWith(
              (message) => updates(message as GetQuarterTurnsReplyArguments))
          as GetQuarterTurnsReplyArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetQuarterTurnsReplyArguments create() =>
      GetQuarterTurnsReplyArguments._();
  GetQuarterTurnsReplyArguments createEmptyInstance() => create();
  static $pb.PbList<GetQuarterTurnsReplyArguments> createRepeated() =>
      $pb.PbList<GetQuarterTurnsReplyArguments>();
  @$core.pragma('dart2js:noInline')
  static GetQuarterTurnsReplyArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetQuarterTurnsReplyArguments>(create);
  static GetQuarterTurnsReplyArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get quarterTurns => $_getIZ(0);
  @$pb.TagNumber(1)
  set quarterTurns($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQuarterTurns() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuarterTurns() => clearField(1);
}

class CameraControllerRequestPermissionReplyArguments
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerRequestPermissionReplyArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'granted')
    ..hasRequiredFields = false;

  CameraControllerRequestPermissionReplyArguments._() : super();
  factory CameraControllerRequestPermissionReplyArguments({
    $core.bool? granted,
  }) {
    final _result = create();
    if (granted != null) {
      _result.granted = granted;
    }
    return _result;
  }
  factory CameraControllerRequestPermissionReplyArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerRequestPermissionReplyArguments.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerRequestPermissionReplyArguments clone() =>
      CameraControllerRequestPermissionReplyArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerRequestPermissionReplyArguments copyWith(
          void Function(CameraControllerRequestPermissionReplyArguments)
              updates) =>
      super.copyWith((message) => updates(
              message as CameraControllerRequestPermissionReplyArguments))
          as CameraControllerRequestPermissionReplyArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerRequestPermissionReplyArguments create() =>
      CameraControllerRequestPermissionReplyArguments._();
  CameraControllerRequestPermissionReplyArguments createEmptyInstance() =>
      create();
  static $pb.PbList<CameraControllerRequestPermissionReplyArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerRequestPermissionReplyArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerRequestPermissionReplyArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerRequestPermissionReplyArguments>(create);
  static CameraControllerRequestPermissionReplyArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get granted => $_getBF(0);
  @$pb.TagNumber(1)
  set granted($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGranted() => $_has(0);
  @$pb.TagNumber(1)
  void clearGranted() => clearField(1);
}

class CameraControllerBindReplyArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerBindReplyArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraValue',
        subBuilder: CameraValue.create)
    ..hasRequiredFields = false;

  CameraControllerBindReplyArguments._() : super();
  factory CameraControllerBindReplyArguments({
    CameraValue? cameraValue,
  }) {
    final _result = create();
    if (cameraValue != null) {
      _result.cameraValue = cameraValue;
    }
    return _result;
  }
  factory CameraControllerBindReplyArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerBindReplyArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerBindReplyArguments clone() =>
      CameraControllerBindReplyArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerBindReplyArguments copyWith(
          void Function(CameraControllerBindReplyArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerBindReplyArguments))
          as CameraControllerBindReplyArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerBindReplyArguments create() =>
      CameraControllerBindReplyArguments._();
  CameraControllerBindReplyArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerBindReplyArguments> createRepeated() =>
      $pb.PbList<CameraControllerBindReplyArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerBindReplyArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraControllerBindReplyArguments>(
          create);
  static CameraControllerBindReplyArguments? _defaultInstance;

  @$pb.TagNumber(1)
  CameraValue get cameraValue => $_getN(0);
  @$pb.TagNumber(1)
  set cameraValue(CameraValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCameraValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearCameraValue() => clearField(1);
  @$pb.TagNumber(1)
  CameraValue ensureCameraValue() => $_ensure(0);
}

class CameraControllerCaptureToMemoryReplyArguments
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerCaptureToMemoryReplyArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<ImageProxy>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageProxy',
        protoName: 'imageProxy',
        subBuilder: ImageProxy.create)
    ..hasRequiredFields = false;

  CameraControllerCaptureToMemoryReplyArguments._() : super();
  factory CameraControllerCaptureToMemoryReplyArguments({
    ImageProxy? imageProxy,
  }) {
    final _result = create();
    if (imageProxy != null) {
      _result.imageProxy = imageProxy;
    }
    return _result;
  }
  factory CameraControllerCaptureToMemoryReplyArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerCaptureToMemoryReplyArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerCaptureToMemoryReplyArguments clone() =>
      CameraControllerCaptureToMemoryReplyArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerCaptureToMemoryReplyArguments copyWith(
          void Function(CameraControllerCaptureToMemoryReplyArguments)
              updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerCaptureToMemoryReplyArguments))
          as CameraControllerCaptureToMemoryReplyArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerCaptureToMemoryReplyArguments create() =>
      CameraControllerCaptureToMemoryReplyArguments._();
  CameraControllerCaptureToMemoryReplyArguments createEmptyInstance() =>
      create();
  static $pb.PbList<CameraControllerCaptureToMemoryReplyArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerCaptureToMemoryReplyArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerCaptureToMemoryReplyArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerCaptureToMemoryReplyArguments>(create);
  static CameraControllerCaptureToMemoryReplyArguments? _defaultInstance;

  @$pb.TagNumber(1)
  ImageProxy get imageProxy => $_getN(0);
  @$pb.TagNumber(1)
  set imageProxy(ImageProxy v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImageProxy() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageProxy() => clearField(1);
  @$pb.TagNumber(1)
  ImageProxy ensureImageProxy() => $_ensure(0);
}

enum Event_Arguments {
  quarterTurnsChangedArguments,
  cameraControllerImageProxiedArguments,
  notSet
}

class Event extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Event_Arguments> _Event_ArgumentsByTag = {
    2: Event_Arguments.quarterTurnsChangedArguments,
    3: Event_Arguments.cameraControllerImageProxiedArguments,
    0: Event_Arguments.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Event',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<EventCategory>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        $pb.PbFieldType.OE,
        defaultOrMaker: EventCategory.EVENT_CATEGORY_QUARTER_TURNS_CHANGED,
        valueOf: EventCategory.valueOf,
        enumValues: EventCategory.values)
    ..aOM<QuarterTurnsChangedEventArguments>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quarterTurnsChangedArguments',
        subBuilder: QuarterTurnsChangedEventArguments.create)
    ..aOM<CameraControllerImageProxiedEventArguments>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cameraControllerImageProxiedArguments',
        subBuilder: CameraControllerImageProxiedEventArguments.create)
    ..hasRequiredFields = false;

  Event._() : super();
  factory Event({
    EventCategory? category,
    QuarterTurnsChangedEventArguments? quarterTurnsChangedArguments,
    CameraControllerImageProxiedEventArguments?
        cameraControllerImageProxiedArguments,
  }) {
    final _result = create();
    if (category != null) {
      _result.category = category;
    }
    if (quarterTurnsChangedArguments != null) {
      _result.quarterTurnsChangedArguments = quarterTurnsChangedArguments;
    }
    if (cameraControllerImageProxiedArguments != null) {
      _result.cameraControllerImageProxiedArguments =
          cameraControllerImageProxiedArguments;
    }
    return _result;
  }
  factory Event.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) =>
      super.copyWith((message) => updates(message as Event))
          as Event; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  Event_Arguments whichArguments() => _Event_ArgumentsByTag[$_whichOneof(0)]!;
  void clearArguments() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  EventCategory get category => $_getN(0);
  @$pb.TagNumber(1)
  set category(EventCategory v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCategory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategory() => clearField(1);

  @$pb.TagNumber(2)
  QuarterTurnsChangedEventArguments get quarterTurnsChangedArguments =>
      $_getN(1);
  @$pb.TagNumber(2)
  set quarterTurnsChangedArguments(QuarterTurnsChangedEventArguments v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuarterTurnsChangedArguments() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuarterTurnsChangedArguments() => clearField(2);
  @$pb.TagNumber(2)
  QuarterTurnsChangedEventArguments ensureQuarterTurnsChangedArguments() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  CameraControllerImageProxiedEventArguments
      get cameraControllerImageProxiedArguments => $_getN(2);
  @$pb.TagNumber(3)
  set cameraControllerImageProxiedArguments(
      CameraControllerImageProxiedEventArguments v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCameraControllerImageProxiedArguments() => $_has(2);
  @$pb.TagNumber(3)
  void clearCameraControllerImageProxiedArguments() => clearField(3);
  @$pb.TagNumber(3)
  CameraControllerImageProxiedEventArguments
      ensureCameraControllerImageProxiedArguments() => $_ensure(2);
}

class QuarterTurnsChangedEventArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'QuarterTurnsChangedEventArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quarterTurns',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  QuarterTurnsChangedEventArguments._() : super();
  factory QuarterTurnsChangedEventArguments({
    $core.int? quarterTurns,
  }) {
    final _result = create();
    if (quarterTurns != null) {
      _result.quarterTurns = quarterTurns;
    }
    return _result;
  }
  factory QuarterTurnsChangedEventArguments.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory QuarterTurnsChangedEventArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  QuarterTurnsChangedEventArguments clone() =>
      QuarterTurnsChangedEventArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  QuarterTurnsChangedEventArguments copyWith(
          void Function(QuarterTurnsChangedEventArguments) updates) =>
      super.copyWith((message) =>
              updates(message as QuarterTurnsChangedEventArguments))
          as QuarterTurnsChangedEventArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuarterTurnsChangedEventArguments create() =>
      QuarterTurnsChangedEventArguments._();
  QuarterTurnsChangedEventArguments createEmptyInstance() => create();
  static $pb.PbList<QuarterTurnsChangedEventArguments> createRepeated() =>
      $pb.PbList<QuarterTurnsChangedEventArguments>();
  @$core.pragma('dart2js:noInline')
  static QuarterTurnsChangedEventArguments getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuarterTurnsChangedEventArguments>(
          create);
  static QuarterTurnsChangedEventArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get quarterTurns => $_getIZ(0);
  @$pb.TagNumber(1)
  set quarterTurns($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasQuarterTurns() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuarterTurns() => clearField(1);
}

class CameraControllerImageProxiedEventArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraControllerImageProxiedEventArguments',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<ImageProxy>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageProxy',
        subBuilder: ImageProxy.create)
    ..hasRequiredFields = false;

  CameraControllerImageProxiedEventArguments._() : super();
  factory CameraControllerImageProxiedEventArguments({
    ImageProxy? imageProxy,
  }) {
    final _result = create();
    if (imageProxy != null) {
      _result.imageProxy = imageProxy;
    }
    return _result;
  }
  factory CameraControllerImageProxiedEventArguments.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraControllerImageProxiedEventArguments.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraControllerImageProxiedEventArguments clone() =>
      CameraControllerImageProxiedEventArguments()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraControllerImageProxiedEventArguments copyWith(
          void Function(CameraControllerImageProxiedEventArguments) updates) =>
      super.copyWith((message) =>
              updates(message as CameraControllerImageProxiedEventArguments))
          as CameraControllerImageProxiedEventArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraControllerImageProxiedEventArguments create() =>
      CameraControllerImageProxiedEventArguments._();
  CameraControllerImageProxiedEventArguments createEmptyInstance() => create();
  static $pb.PbList<CameraControllerImageProxiedEventArguments>
      createRepeated() =>
          $pb.PbList<CameraControllerImageProxiedEventArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraControllerImageProxiedEventArguments getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CameraControllerImageProxiedEventArguments>(create);
  static CameraControllerImageProxiedEventArguments? _defaultInstance;

  @$pb.TagNumber(1)
  ImageProxy get imageProxy => $_getN(0);
  @$pb.TagNumber(1)
  set imageProxy(ImageProxy v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImageProxy() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageProxy() => clearField(1);
  @$pb.TagNumber(1)
  ImageProxy ensureImageProxy() => $_ensure(0);
}

class CameraSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraSelector',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..e<CameraFacing>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'facing',
        $pb.PbFieldType.OE,
        defaultOrMaker: CameraFacing.CAMERA_FACING_BACK,
        valueOf: CameraFacing.valueOf,
        enumValues: CameraFacing.values)
    ..hasRequiredFields = false;

  CameraSelector._() : super();
  factory CameraSelector({
    CameraFacing? facing,
  }) {
    final _result = create();
    if (facing != null) {
      _result.facing = facing;
    }
    return _result;
  }
  factory CameraSelector.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraSelector.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraSelector clone() => CameraSelector()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraSelector copyWith(void Function(CameraSelector) updates) =>
      super.copyWith((message) => updates(message as CameraSelector))
          as CameraSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraSelector create() => CameraSelector._();
  CameraSelector createEmptyInstance() => create();
  static $pb.PbList<CameraSelector> createRepeated() =>
      $pb.PbList<CameraSelector>();
  @$core.pragma('dart2js:noInline')
  static CameraSelector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraSelector>(create);
  static CameraSelector? _defaultInstance;

  @$pb.TagNumber(1)
  CameraFacing get facing => $_getN(0);
  @$pb.TagNumber(1)
  set facing(CameraFacing v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFacing() => $_has(0);
  @$pb.TagNumber(1)
  void clearFacing() => clearField(1);
}

class CameraValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CameraValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'textureId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'textureWidth',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'textureHeight',
        $pb.PbFieldType.O3)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'torchAvailable')
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zoomMinimum',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zoomMaximum',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  CameraValue._() : super();
  factory CameraValue({
    $core.int? textureId,
    $core.int? textureWidth,
    $core.int? textureHeight,
    $core.bool? torchAvailable,
    $core.double? zoomMinimum,
    $core.double? zoomMaximum,
  }) {
    final _result = create();
    if (textureId != null) {
      _result.textureId = textureId;
    }
    if (textureWidth != null) {
      _result.textureWidth = textureWidth;
    }
    if (textureHeight != null) {
      _result.textureHeight = textureHeight;
    }
    if (torchAvailable != null) {
      _result.torchAvailable = torchAvailable;
    }
    if (zoomMinimum != null) {
      _result.zoomMinimum = zoomMinimum;
    }
    if (zoomMaximum != null) {
      _result.zoomMaximum = zoomMaximum;
    }
    return _result;
  }
  factory CameraValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CameraValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CameraValue clone() => CameraValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CameraValue copyWith(void Function(CameraValue) updates) =>
      super.copyWith((message) => updates(message as CameraValue))
          as CameraValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraValue create() => CameraValue._();
  CameraValue createEmptyInstance() => create();
  static $pb.PbList<CameraValue> createRepeated() => $pb.PbList<CameraValue>();
  @$core.pragma('dart2js:noInline')
  static CameraValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CameraValue>(create);
  static CameraValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get textureId => $_getIZ(0);
  @$pb.TagNumber(1)
  set textureId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTextureId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTextureId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get textureWidth => $_getIZ(1);
  @$pb.TagNumber(2)
  set textureWidth($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTextureWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearTextureWidth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get textureHeight => $_getIZ(2);
  @$pb.TagNumber(3)
  set textureHeight($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTextureHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearTextureHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get torchAvailable => $_getBF(3);
  @$pb.TagNumber(4)
  set torchAvailable($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTorchAvailable() => $_has(3);
  @$pb.TagNumber(4)
  void clearTorchAvailable() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get zoomMinimum => $_getN(4);
  @$pb.TagNumber(5)
  set zoomMinimum($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasZoomMinimum() => $_has(4);
  @$pb.TagNumber(5)
  void clearZoomMinimum() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get zoomMaximum => $_getN(5);
  @$pb.TagNumber(6)
  set zoomMaximum($core.double v) {
    $_setDouble(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasZoomMaximum() => $_has(5);
  @$pb.TagNumber(6)
  void clearZoomMaximum() => clearField(6);
}

class ImageProxy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImageProxy',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'messages'),
      createEmptyInstance: create)
    ..aOM<CameraSelector>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selector',
        subBuilder: CameraSelector.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OY)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rotationDegrees',
        $pb.PbFieldType.O3,
        protoName: 'rotationDegrees')
    ..hasRequiredFields = false;

  ImageProxy._() : super();
  factory ImageProxy({
    CameraSelector? selector,
    $core.String? id,
    $core.List<$core.int>? data,
    $core.int? width,
    $core.int? height,
    $core.int? rotationDegrees,
  }) {
    final _result = create();
    if (selector != null) {
      _result.selector = selector;
    }
    if (id != null) {
      _result.id = id;
    }
    if (data != null) {
      _result.data = data;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (rotationDegrees != null) {
      _result.rotationDegrees = rotationDegrees;
    }
    return _result;
  }
  factory ImageProxy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImageProxy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImageProxy clone() => ImageProxy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImageProxy copyWith(void Function(ImageProxy) updates) =>
      super.copyWith((message) => updates(message as ImageProxy))
          as ImageProxy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageProxy create() => ImageProxy._();
  ImageProxy createEmptyInstance() => create();
  static $pb.PbList<ImageProxy> createRepeated() => $pb.PbList<ImageProxy>();
  @$core.pragma('dart2js:noInline')
  static ImageProxy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageProxy>(create);
  static ImageProxy? _defaultInstance;

  @$pb.TagNumber(1)
  CameraSelector get selector => $_getN(0);
  @$pb.TagNumber(1)
  set selector(CameraSelector v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelector() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelector() => clearField(1);
  @$pb.TagNumber(1)
  CameraSelector ensureSelector() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rotationDegrees => $_getIZ(5);
  @$pb.TagNumber(6)
  set rotationDegrees($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRotationDegrees() => $_has(5);
  @$pb.TagNumber(6)
  void clearRotationDegrees() => clearField(6);
}
