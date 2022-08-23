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

class ImageProxyArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageProxyArguments', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<ImageProxy>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageProxy', subBuilder: ImageProxy.create)
    ..hasRequiredFields = false
  ;

  ImageProxyArguments._() : super();
  factory ImageProxyArguments({
    $core.String? id,
    ImageProxy? imageProxy,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (imageProxy != null) {
      _result.imageProxy = imageProxy;
    }
    return _result;
  }
  factory ImageProxyArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageProxyArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageProxyArguments clone() => ImageProxyArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageProxyArguments copyWith(void Function(ImageProxyArguments) updates) => super.copyWith((message) => updates(message as ImageProxyArguments)) as ImageProxyArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageProxyArguments create() => ImageProxyArguments._();
  ImageProxyArguments createEmptyInstance() => create();
  static $pb.PbList<ImageProxyArguments> createRepeated() => $pb.PbList<ImageProxyArguments>();
  @$core.pragma('dart2js:noInline')
  static ImageProxyArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageProxyArguments>(create);
  static ImageProxyArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  ImageProxy get imageProxy => $_getN(1);
  @$pb.TagNumber(2)
  set imageProxy(ImageProxy v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageProxy() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageProxy() => clearField(2);
  @$pb.TagNumber(2)
  ImageProxy ensureImageProxy() => $_ensure(1);
}

class ImageProxy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageProxy', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  ImageProxy._() : super();
  factory ImageProxy({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory ImageProxy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageProxy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageProxy clone() => ImageProxy()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageProxy copyWith(void Function(ImageProxy) updates) => super.copyWith((message) => updates(message as ImageProxy)) as ImageProxy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageProxy create() => ImageProxy._();
  ImageProxy createEmptyInstance() => create();
  static $pb.PbList<ImageProxy> createRepeated() => $pb.PbList<ImageProxy>();
  @$core.pragma('dart2js:noInline')
  static ImageProxy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageProxy>(create);
  static ImageProxy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class MLRecognitionArguments extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MLRecognitionArguments', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..pc<MLMetadata>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recognition', $pb.PbFieldType.PM, subBuilder: MLMetadata.create)
    ..hasRequiredFields = false
  ;

  MLRecognitionArguments._() : super();
  factory MLRecognitionArguments({
    $core.String? id,
    $core.Iterable<MLMetadata>? recognition,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (recognition != null) {
      _result.recognition.addAll(recognition);
    }
    return _result;
  }
  factory MLRecognitionArguments.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MLRecognitionArguments.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MLRecognitionArguments clone() => MLRecognitionArguments()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MLRecognitionArguments copyWith(void Function(MLRecognitionArguments) updates) => super.copyWith((message) => updates(message as MLRecognitionArguments)) as MLRecognitionArguments; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MLRecognitionArguments create() => MLRecognitionArguments._();
  MLRecognitionArguments createEmptyInstance() => create();
  static $pb.PbList<MLRecognitionArguments> createRepeated() => $pb.PbList<MLRecognitionArguments>();
  @$core.pragma('dart2js:noInline')
  static MLRecognitionArguments getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MLRecognitionArguments>(create);
  static MLRecognitionArguments? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<MLMetadata> get recognition => $_getList(1);
}

enum MLMetadata_Metadata {
  barcode, 
  notSet
}

class MLMetadata extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MLMetadata_Metadata> _MLMetadata_MetadataByTag = {
    2 : MLMetadata_Metadata.barcode,
    0 : MLMetadata_Metadata.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MLMetadata', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..oo(0, [2])
    ..pc<Offset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'corners', $pb.PbFieldType.PM, subBuilder: Offset.create)
    ..aOM<Barcode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'barcode', subBuilder: Barcode.create)
    ..hasRequiredFields = false
  ;

  MLMetadata._() : super();
  factory MLMetadata({
    $core.Iterable<Offset>? corners,
    Barcode? barcode,
  }) {
    final _result = create();
    if (corners != null) {
      _result.corners.addAll(corners);
    }
    if (barcode != null) {
      _result.barcode = barcode;
    }
    return _result;
  }
  factory MLMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MLMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MLMetadata clone() => MLMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MLMetadata copyWith(void Function(MLMetadata) updates) => super.copyWith((message) => updates(message as MLMetadata)) as MLMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MLMetadata create() => MLMetadata._();
  MLMetadata createEmptyInstance() => create();
  static $pb.PbList<MLMetadata> createRepeated() => $pb.PbList<MLMetadata>();
  @$core.pragma('dart2js:noInline')
  static MLMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MLMetadata>(create);
  static MLMetadata? _defaultInstance;

  MLMetadata_Metadata whichMetadata() => _MLMetadata_MetadataByTag[$_whichOneof(0)]!;
  void clearMetadata() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.List<Offset> get corners => $_getList(0);

  @$pb.TagNumber(2)
  Barcode get barcode => $_getN(1);
  @$pb.TagNumber(2)
  set barcode(Barcode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBarcode() => $_has(1);
  @$pb.TagNumber(2)
  void clearBarcode() => clearField(2);
  @$pb.TagNumber(2)
  Barcode ensureBarcode() => $_ensure(1);
}

class Offset extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Offset', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dx', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dy', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Offset._() : super();
  factory Offset({
    $core.int? dx,
    $core.int? dy,
  }) {
    final _result = create();
    if (dx != null) {
      _result.dx = dx;
    }
    if (dy != null) {
      _result.dy = dy;
    }
    return _result;
  }
  factory Offset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Offset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Offset clone() => Offset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Offset copyWith(void Function(Offset) updates) => super.copyWith((message) => updates(message as Offset)) as Offset; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Offset create() => Offset._();
  Offset createEmptyInstance() => create();
  static $pb.PbList<Offset> createRepeated() => $pb.PbList<Offset>();
  @$core.pragma('dart2js:noInline')
  static Offset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Offset>(create);
  static Offset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dx => $_getIZ(0);
  @$pb.TagNumber(1)
  set dx($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDx() => $_has(0);
  @$pb.TagNumber(1)
  void clearDx() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get dy => $_getIZ(1);
  @$pb.TagNumber(2)
  set dy($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDy() => $_has(1);
  @$pb.TagNumber(2)
  void clearDy() => clearField(2);
}

class Barcode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Barcode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  Barcode._() : super();
  factory Barcode({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
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
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

