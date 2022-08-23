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

class CameraViewArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CameraViewArguments', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controllerId')
    ..e<ScaleType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scaleType', $pb.PbFieldType.OE, defaultOrMaker: ScaleType.SCALE_TYPE_FILL_START, valueOf: ScaleType.valueOf, enumValues: ScaleType.values)
    ..hasRequiredFields = false
  ;

  CameraViewArguments._() : super();
  factory CameraViewArguments({
    $core.String? controllerId,
    ScaleType? scaleType,
  }) {
    final _result = create();
    if (controllerId != null) {
      _result.controllerId = controllerId;
    }
    if (scaleType != null) {
      _result.scaleType = scaleType;
    }
    return _result;
  }
  factory CameraViewArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraViewArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraViewArguments clone() => CameraViewArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraViewArguments copyWith(void Function(CameraViewArguments) updates) => super.copyWith((message) => updates(message as CameraViewArguments)) as CameraViewArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraViewArguments create() => CameraViewArguments._();
  CameraViewArguments createEmptyInstance() => create();
  static $pb.PbList<CameraViewArguments> createRepeated() => $pb.PbList<CameraViewArguments>();
  @$core.pragma('dart2js:noInline')
  static CameraViewArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraViewArguments>(create);
  static CameraViewArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get controllerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set controllerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasControllerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearControllerId() => clearField(1);

  @$pb.TagNumber(2)
  ScaleType get scaleType => $_getN(1);
  @$pb.TagNumber(2)
  set scaleType(ScaleType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasScaleType() => $_has(1);
  @$pb.TagNumber(2)
  void clearScaleType() => clearField(2);
}

class CameraSelector extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CameraSelector', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..e<CameraFacing>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'facing', $pb.PbFieldType.OE, defaultOrMaker: CameraFacing.CAMERA_FACING_BACK, valueOf: CameraFacing.valueOf, enumValues: CameraFacing.values)
    ..hasRequiredFields = false
  ;

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
  factory CameraSelector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CameraSelector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CameraSelector clone() => CameraSelector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CameraSelector copyWith(void Function(CameraSelector) updates) => super.copyWith((message) => updates(message as CameraSelector)) as CameraSelector; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CameraSelector create() => CameraSelector._();
  CameraSelector createEmptyInstance() => create();
  static $pb.PbList<CameraSelector> createRepeated() => $pb.PbList<CameraSelector>();
  @$core.pragma('dart2js:noInline')
  static CameraSelector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CameraSelector>(create);
  static CameraSelector? _defaultInstance;

  @$pb.TagNumber(1)
  CameraFacing get facing => $_getN(0);
  @$pb.TagNumber(1)
  set facing(CameraFacing v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFacing() => $_has(0);
  @$pb.TagNumber(1)
  void clearFacing() => clearField(1);
}

class TorchStateArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TorchStateArguments', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..hasRequiredFields = false
  ;

  TorchStateArguments._() : super();
  factory TorchStateArguments({
    $core.String? id,
    $core.bool? state,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory TorchStateArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TorchStateArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TorchStateArguments clone() => TorchStateArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TorchStateArguments copyWith(void Function(TorchStateArguments) updates) => super.copyWith((message) => updates(message as TorchStateArguments)) as TorchStateArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TorchStateArguments create() => TorchStateArguments._();
  TorchStateArguments createEmptyInstance() => create();
  static $pb.PbList<TorchStateArguments> createRepeated() => $pb.PbList<TorchStateArguments>();
  @$core.pragma('dart2js:noInline')
  static TorchStateArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TorchStateArguments>(create);
  static TorchStateArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get state => $_getBF(1);
  @$pb.TagNumber(2)
  set state($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class MLMetadataObjectArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MLMetadataObjectArguments', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<MLMetadataObject>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mlObject', subBuilder: MLMetadataObject.create)
    ..hasRequiredFields = false
  ;

  MLMetadataObjectArguments._() : super();
  factory MLMetadataObjectArguments({
    $core.String? id,
    MLMetadataObject? mlObject,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (mlObject != null) {
      _result.mlObject = mlObject;
    }
    return _result;
  }
  factory MLMetadataObjectArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MLMetadataObjectArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MLMetadataObjectArguments clone() => MLMetadataObjectArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MLMetadataObjectArguments copyWith(void Function(MLMetadataObjectArguments) updates) => super.copyWith((message) => updates(message as MLMetadataObjectArguments)) as MLMetadataObjectArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MLMetadataObjectArguments create() => MLMetadataObjectArguments._();
  MLMetadataObjectArguments createEmptyInstance() => create();
  static $pb.PbList<MLMetadataObjectArguments> createRepeated() => $pb.PbList<MLMetadataObjectArguments>();
  @$core.pragma('dart2js:noInline')
  static MLMetadataObjectArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MLMetadataObjectArguments>(create);
  static MLMetadataObjectArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  MLMetadataObject get mlObject => $_getN(1);
  @$pb.TagNumber(2)
  set mlObject(MLMetadataObject v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMlObject() => $_has(1);
  @$pb.TagNumber(2)
  void clearMlObject() => clearField(2);
  @$pb.TagNumber(2)
  MLMetadataObject ensureMlObject() => $_ensure(1);
}

class MLMetadataObject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MLMetadataObject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..pc<Barcode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'barcodes', $pb.PbFieldType.PM, subBuilder: Barcode.create)
    ..hasRequiredFields = false
  ;

  MLMetadataObject._() : super();
  factory MLMetadataObject({
    $core.Iterable<Barcode>? barcodes,
  }) {
    final _result = create();
    if (barcodes != null) {
      _result.barcodes.addAll(barcodes);
    }
    return _result;
  }
  factory MLMetadataObject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MLMetadataObject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MLMetadataObject clone() => MLMetadataObject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MLMetadataObject copyWith(void Function(MLMetadataObject) updates) => super.copyWith((message) => updates(message as MLMetadataObject)) as MLMetadataObject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MLMetadataObject create() => MLMetadataObject._();
  MLMetadataObject createEmptyInstance() => create();
  static $pb.PbList<MLMetadataObject> createRepeated() => $pb.PbList<MLMetadataObject>();
  @$core.pragma('dart2js:noInline')
  static MLMetadataObject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MLMetadataObject>(create);
  static MLMetadataObject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Barcode> get barcodes => $_getList(0);
}

class Barcode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Barcode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOM<Rect>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boundingBox', subBuilder: Rect.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawValue')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Barcode._() : super();
  factory Barcode({
    Rect? boundingBox,
    $core.String? rawValue,
    $core.List<$core.int>? rawBytes,
  }) {
    final _result = create();
    if (boundingBox != null) {
      _result.boundingBox = boundingBox;
    }
    if (rawValue != null) {
      _result.rawValue = rawValue;
    }
    if (rawBytes != null) {
      _result.rawBytes = rawBytes;
    }
    return _result;
  }
  factory Barcode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Barcode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Barcode clone() => Barcode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Barcode copyWith(void Function(Barcode) updates) => super.copyWith((message) => updates(message as Barcode)) as Barcode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Barcode create() => Barcode._();
  Barcode createEmptyInstance() => create();
  static $pb.PbList<Barcode> createRepeated() => $pb.PbList<Barcode>();
  @$core.pragma('dart2js:noInline')
  static Barcode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Barcode>(create);
  static Barcode? _defaultInstance;

  @$pb.TagNumber(1)
  Rect get boundingBox => $_getN(0);
  @$pb.TagNumber(1)
  set boundingBox(Rect v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoundingBox() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoundingBox() => clearField(1);
  @$pb.TagNumber(1)
  Rect ensureBoundingBox() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get rawValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set rawValue($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRawValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get rawBytes => $_getN(2);
  @$pb.TagNumber(3)
  set rawBytes($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRawBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearRawBytes() => clearField(3);
}

class Rect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Rect', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'left', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'top', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'right', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bottom', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Rect._() : super();
  factory Rect({
    $core.int? left,
    $core.int? top,
    $core.int? right,
    $core.int? bottom,
  }) {
    final _result = create();
    if (left != null) {
      _result.left = left;
    }
    if (top != null) {
      _result.top = top;
    }
    if (right != null) {
      _result.right = right;
    }
    if (bottom != null) {
      _result.bottom = bottom;
    }
    return _result;
  }
  factory Rect.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Rect.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Rect clone() => Rect()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Rect copyWith(void Function(Rect) updates) => super.copyWith((message) => updates(message as Rect)) as Rect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rect create() => Rect._();
  Rect createEmptyInstance() => create();
  static $pb.PbList<Rect> createRepeated() => $pb.PbList<Rect>();
  @$core.pragma('dart2js:noInline')
  static Rect getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rect>(create);
  static Rect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get left => $_getIZ(0);
  @$pb.TagNumber(1)
  set left($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get top => $_getIZ(1);
  @$pb.TagNumber(2)
  set top($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTop() => $_has(1);
  @$pb.TagNumber(2)
  void clearTop() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get right => $_getIZ(2);
  @$pb.TagNumber(3)
  set right($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRight() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get bottom => $_getIZ(3);
  @$pb.TagNumber(4)
  set bottom($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBottom() => $_has(3);
  @$pb.TagNumber(4)
  void clearBottom() => clearField(4);
}

