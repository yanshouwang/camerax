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
    ..e<ScaleType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scaleType', $pb.PbFieldType.OE, defaultOrMaker: ScaleType.SCALE_TYPE_FILL_START, valueOf: ScaleType.valueOf, enumValues: ScaleType.values)
    ..hasRequiredFields = false
  ;

  CameraViewArguments._() : super();
  factory CameraViewArguments({
    ScaleType? scaleType,
  }) {
    final _result = create();
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
  ScaleType get scaleType => $_getN(0);
  @$pb.TagNumber(1)
  set scaleType(ScaleType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasScaleType() => $_has(0);
  @$pb.TagNumber(1)
  void clearScaleType() => clearField(1);
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

enum UseCase_UseCase {
  preview, 
  imageAnalysis, 
  imageCapture, 
  videoCapture, 
  notSet
}

class UseCase extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UseCase_UseCase> _UseCase_UseCaseByTag = {
    2 : UseCase_UseCase.preview,
    3 : UseCase_UseCase.imageAnalysis,
    4 : UseCase_UseCase.imageCapture,
    5 : UseCase_UseCase.videoCapture,
    0 : UseCase_UseCase.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UseCase', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Preview>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preview', subBuilder: Preview.create)
    ..aOM<ImageAnalysis>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageAnalysis', subBuilder: ImageAnalysis.create)
    ..aOM<ImageCapture>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ImageCapture', protoName: 'Image_capture', subBuilder: ImageCapture.create)
    ..aOM<VideoCapture>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'videoCapture', subBuilder: VideoCapture.create)
    ..hasRequiredFields = false
  ;

  UseCase._() : super();
  factory UseCase({
    $core.String? id,
    Preview? preview,
    ImageAnalysis? imageAnalysis,
    ImageCapture? imageCapture,
    VideoCapture? videoCapture,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (preview != null) {
      _result.preview = preview;
    }
    if (imageAnalysis != null) {
      _result.imageAnalysis = imageAnalysis;
    }
    if (imageCapture != null) {
      _result.imageCapture = imageCapture;
    }
    if (videoCapture != null) {
      _result.videoCapture = videoCapture;
    }
    return _result;
  }
  factory UseCase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UseCase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UseCase clone() => UseCase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UseCase copyWith(void Function(UseCase) updates) => super.copyWith((message) => updates(message as UseCase)) as UseCase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UseCase create() => UseCase._();
  UseCase createEmptyInstance() => create();
  static $pb.PbList<UseCase> createRepeated() => $pb.PbList<UseCase>();
  @$core.pragma('dart2js:noInline')
  static UseCase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UseCase>(create);
  static UseCase? _defaultInstance;

  UseCase_UseCase whichUseCase() => _UseCase_UseCaseByTag[$_whichOneof(0)]!;
  void clearUseCase() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Preview get preview => $_getN(1);
  @$pb.TagNumber(2)
  set preview(Preview v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreview() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreview() => clearField(2);
  @$pb.TagNumber(2)
  Preview ensurePreview() => $_ensure(1);

  @$pb.TagNumber(3)
  ImageAnalysis get imageAnalysis => $_getN(2);
  @$pb.TagNumber(3)
  set imageAnalysis(ImageAnalysis v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageAnalysis() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageAnalysis() => clearField(3);
  @$pb.TagNumber(3)
  ImageAnalysis ensureImageAnalysis() => $_ensure(2);

  @$pb.TagNumber(4)
  ImageCapture get imageCapture => $_getN(3);
  @$pb.TagNumber(4)
  set imageCapture(ImageCapture v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasImageCapture() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageCapture() => clearField(4);
  @$pb.TagNumber(4)
  ImageCapture ensureImageCapture() => $_ensure(3);

  @$pb.TagNumber(5)
  VideoCapture get videoCapture => $_getN(4);
  @$pb.TagNumber(5)
  set videoCapture(VideoCapture v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVideoCapture() => $_has(4);
  @$pb.TagNumber(5)
  void clearVideoCapture() => clearField(5);
  @$pb.TagNumber(5)
  VideoCapture ensureVideoCapture() => $_ensure(4);
}

class Preview extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Preview', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'viewId', $pb.PbFieldType.O3, protoName: 'viewId')
    ..hasRequiredFields = false
  ;

  Preview._() : super();
  factory Preview({
    $core.int? viewId,
  }) {
    final _result = create();
    if (viewId != null) {
      _result.viewId = viewId;
    }
    return _result;
  }
  factory Preview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Preview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Preview clone() => Preview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Preview copyWith(void Function(Preview) updates) => super.copyWith((message) => updates(message as Preview)) as Preview; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Preview create() => Preview._();
  Preview createEmptyInstance() => create();
  static $pb.PbList<Preview> createRepeated() => $pb.PbList<Preview>();
  @$core.pragma('dart2js:noInline')
  static Preview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Preview>(create);
  static Preview? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get viewId => $_getIZ(0);
  @$pb.TagNumber(1)
  set viewId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasViewId() => $_has(0);
  @$pb.TagNumber(1)
  void clearViewId() => clearField(1);
}

class ImageAnalysis extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageAnalysis', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ImageAnalysis._() : super();
  factory ImageAnalysis() => create();
  factory ImageAnalysis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageAnalysis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageAnalysis clone() => ImageAnalysis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageAnalysis copyWith(void Function(ImageAnalysis) updates) => super.copyWith((message) => updates(message as ImageAnalysis)) as ImageAnalysis; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageAnalysis create() => ImageAnalysis._();
  ImageAnalysis createEmptyInstance() => create();
  static $pb.PbList<ImageAnalysis> createRepeated() => $pb.PbList<ImageAnalysis>();
  @$core.pragma('dart2js:noInline')
  static ImageAnalysis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageAnalysis>(create);
  static ImageAnalysis? _defaultInstance;
}

class ImageCapture extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageCapture', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ImageCapture._() : super();
  factory ImageCapture() => create();
  factory ImageCapture.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageCapture.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageCapture clone() => ImageCapture()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageCapture copyWith(void Function(ImageCapture) updates) => super.copyWith((message) => updates(message as ImageCapture)) as ImageCapture; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageCapture create() => ImageCapture._();
  ImageCapture createEmptyInstance() => create();
  static $pb.PbList<ImageCapture> createRepeated() => $pb.PbList<ImageCapture>();
  @$core.pragma('dart2js:noInline')
  static ImageCapture getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageCapture>(create);
  static ImageCapture? _defaultInstance;
}

class VideoCapture extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VideoCapture', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  VideoCapture._() : super();
  factory VideoCapture() => create();
  factory VideoCapture.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoCapture.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoCapture clone() => VideoCapture()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoCapture copyWith(void Function(VideoCapture) updates) => super.copyWith((message) => updates(message as VideoCapture)) as VideoCapture; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VideoCapture create() => VideoCapture._();
  VideoCapture createEmptyInstance() => create();
  static $pb.PbList<VideoCapture> createRepeated() => $pb.PbList<VideoCapture>();
  @$core.pragma('dart2js:noInline')
  static VideoCapture getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoCapture>(create);
  static VideoCapture? _defaultInstance;
}

class Camera extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Camera', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messages'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  Camera._() : super();
  factory Camera({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Camera.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Camera.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Camera clone() => Camera()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Camera copyWith(void Function(Camera) updates) => super.copyWith((message) => updates(message as Camera)) as Camera; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Camera create() => Camera._();
  Camera createEmptyInstance() => create();
  static $pb.PbList<Camera> createRepeated() => $pb.PbList<Camera>();
  @$core.pragma('dart2js:noInline')
  static Camera getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Camera>(create);
  static Camera? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

