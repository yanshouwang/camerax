// Autogenerated by jnigen. DO NOT EDIT!

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: camel_case_extensions
// ignore_for_file: camel_case_types
// ignore_for_file: constant_identifier_names
// ignore_for_file: doc_directive_unknown
// ignore_for_file: file_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: only_throw_errors
// ignore_for_file: overridden_fields
// ignore_for_file: prefer_double_quotes
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: use_super_parameters

import 'dart:ffi' as ffi;
import 'dart:isolate' show ReceivePort;

import 'package:jni/internal_helpers_for_jnigen.dart';
import 'package:jni/jni.dart' as jni;

import '../../../android/util/Size.dart' as size_;

import '../core/DynamicRange.dart' as dynamicrange_;

import 'FallbackStrategy.dart' as fallbackstrategy_;

import 'Quality.dart' as quality_;

/// from: androidx.camera.video.QualitySelector
class QualitySelector extends jni.JObject {
  @override
  late final jni.JObjType<QualitySelector> $type = type;

  QualitySelector.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/QualitySelector');

  /// The type which includes information such as the signature of this class.
  static const type = $QualitySelectorType();
  static final _id_getSupportedQualities = _class.staticMethodId(
    r'getSupportedQualities',
    r'(Landroidx/camera/core/CameraInfo;)Ljava/util/List;',
  );

  static final _getSupportedQualities = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.util.List getSupportedQualities(androidx.camera.core.CameraInfo cameraInfo)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JList<quality_.Quality> getSupportedQualities(
    jni.JObject cameraInfo,
  ) {
    return _getSupportedQualities(
            _class.reference.pointer,
            _id_getSupportedQualities as jni.JMethodIDPtr,
            cameraInfo.reference.pointer)
        .object(const jni.JListType(quality_.$QualityType()));
  }

  static final _id_isQualitySupported = _class.staticMethodId(
    r'isQualitySupported',
    r'(Landroidx/camera/core/CameraInfo;Landroidx/camera/video/Quality;)Z',
  );

  static final _isQualitySupported = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticBooleanMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public boolean isQualitySupported(androidx.camera.core.CameraInfo cameraInfo, androidx.camera.video.Quality quality)
  static bool isQualitySupported(
    jni.JObject cameraInfo,
    quality_.Quality quality,
  ) {
    return _isQualitySupported(
            _class.reference.pointer,
            _id_isQualitySupported as jni.JMethodIDPtr,
            cameraInfo.reference.pointer,
            quality.reference.pointer)
        .boolean;
  }

  static final _id_getResolution = _class.staticMethodId(
    r'getResolution',
    r'(Landroidx/camera/core/CameraInfo;Landroidx/camera/video/Quality;)Landroid/util/Size;',
  );

  static final _getResolution = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public android.util.Size getResolution(androidx.camera.core.CameraInfo cameraInfo, androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static size_.Size getResolution(
    jni.JObject cameraInfo,
    quality_.Quality quality,
  ) {
    return _getResolution(
            _class.reference.pointer,
            _id_getResolution as jni.JMethodIDPtr,
            cameraInfo.reference.pointer,
            quality.reference.pointer)
        .object(const size_.$SizeType());
  }

  static final _id_getQualityToResolutionMap = _class.staticMethodId(
    r'getQualityToResolutionMap',
    r'(Landroidx/camera/video/VideoCapabilities;Landroidx/camera/core/DynamicRange;)Ljava/util/Map;',
  );

  static final _getQualityToResolutionMap = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public java.util.Map getQualityToResolutionMap(androidx.camera.video.VideoCapabilities videoCapabilities, androidx.camera.core.DynamicRange dynamicRange)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JMap<quality_.Quality, size_.Size> getQualityToResolutionMap(
    jni.JObject videoCapabilities,
    dynamicrange_.DynamicRange dynamicRange,
  ) {
    return _getQualityToResolutionMap(
            _class.reference.pointer,
            _id_getQualityToResolutionMap as jni.JMethodIDPtr,
            videoCapabilities.reference.pointer,
            dynamicRange.reference.pointer)
        .object(const jni.JMapType(quality_.$QualityType(), size_.$SizeType()));
  }

  static final _id_from = _class.staticMethodId(
    r'from',
    r'(Landroidx/camera/video/Quality;)Landroidx/camera/video/QualitySelector;',
  );

  static final _from = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.QualitySelector from(androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static QualitySelector from(
    quality_.Quality quality,
  ) {
    return _from(_class.reference.pointer, _id_from as jni.JMethodIDPtr,
            quality.reference.pointer)
        .object(const $QualitySelectorType());
  }

  static final _id_from1 = _class.staticMethodId(
    r'from',
    r'(Landroidx/camera/video/Quality;Landroidx/camera/video/FallbackStrategy;)Landroidx/camera/video/QualitySelector;',
  );

  static final _from1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.QualitySelector from(androidx.camera.video.Quality quality, androidx.camera.video.FallbackStrategy fallbackStrategy)
  /// The returned object must be released after use, by calling the [release] method.
  static QualitySelector from1(
    quality_.Quality quality,
    fallbackstrategy_.FallbackStrategy fallbackStrategy,
  ) {
    return _from1(_class.reference.pointer, _id_from1 as jni.JMethodIDPtr,
            quality.reference.pointer, fallbackStrategy.reference.pointer)
        .object(const $QualitySelectorType());
  }

  static final _id_fromOrderedList = _class.staticMethodId(
    r'fromOrderedList',
    r'(Ljava/util/List;)Landroidx/camera/video/QualitySelector;',
  );

  static final _fromOrderedList = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.QualitySelector fromOrderedList(java.util.List list)
  /// The returned object must be released after use, by calling the [release] method.
  static QualitySelector fromOrderedList(
    jni.JList<quality_.Quality> list,
  ) {
    return _fromOrderedList(_class.reference.pointer,
            _id_fromOrderedList as jni.JMethodIDPtr, list.reference.pointer)
        .object(const $QualitySelectorType());
  }

  static final _id_fromOrderedList1 = _class.staticMethodId(
    r'fromOrderedList',
    r'(Ljava/util/List;Landroidx/camera/video/FallbackStrategy;)Landroidx/camera/video/QualitySelector;',
  );

  static final _fromOrderedList1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.QualitySelector fromOrderedList(java.util.List list, androidx.camera.video.FallbackStrategy fallbackStrategy)
  /// The returned object must be released after use, by calling the [release] method.
  static QualitySelector fromOrderedList1(
    jni.JList<quality_.Quality> list,
    fallbackstrategy_.FallbackStrategy fallbackStrategy,
  ) {
    return _fromOrderedList1(
            _class.reference.pointer,
            _id_fromOrderedList1 as jni.JMethodIDPtr,
            list.reference.pointer,
            fallbackStrategy.reference.pointer)
        .object(const $QualitySelectorType());
  }

  static final _id_toString1 = _class.instanceMethodId(
    r'toString',
    r'()Ljava/lang/String;',
  );

  static final _toString1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public java.lang.String toString()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JString toString1() {
    return _toString1(reference.pointer, _id_toString1 as jni.JMethodIDPtr)
        .object(const jni.JStringType());
  }
}

final class $QualitySelectorType extends jni.JObjType<QualitySelector> {
  const $QualitySelectorType();

  @override
  String get signature => r'Landroidx/camera/video/QualitySelector;';

  @override
  QualitySelector fromReference(jni.JReference reference) =>
      QualitySelector.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($QualitySelectorType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($QualitySelectorType) &&
        other is $QualitySelectorType;
  }
}
