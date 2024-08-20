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

import 'Quality.dart' as quality_;

/// from: androidx.camera.video.FallbackStrategy
class FallbackStrategy extends jni.JObject {
  @override
  late final jni.JObjType<FallbackStrategy> $type = type;

  FallbackStrategy.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/FallbackStrategy');

  /// The type which includes information such as the signature of this class.
  static const type = $FallbackStrategyType();
  static final _id_higherQualityOrLowerThan = _class.staticMethodId(
    r'higherQualityOrLowerThan',
    r'(Landroidx/camera/video/Quality;)Landroidx/camera/video/FallbackStrategy;',
  );

  static final _higherQualityOrLowerThan = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.FallbackStrategy higherQualityOrLowerThan(androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static FallbackStrategy higherQualityOrLowerThan(
    quality_.Quality quality,
  ) {
    return _higherQualityOrLowerThan(
            _class.reference.pointer,
            _id_higherQualityOrLowerThan as jni.JMethodIDPtr,
            quality.reference.pointer)
        .object(const $FallbackStrategyType());
  }

  static final _id_higherQualityThan = _class.staticMethodId(
    r'higherQualityThan',
    r'(Landroidx/camera/video/Quality;)Landroidx/camera/video/FallbackStrategy;',
  );

  static final _higherQualityThan = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.FallbackStrategy higherQualityThan(androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static FallbackStrategy higherQualityThan(
    quality_.Quality quality,
  ) {
    return _higherQualityThan(
            _class.reference.pointer,
            _id_higherQualityThan as jni.JMethodIDPtr,
            quality.reference.pointer)
        .object(const $FallbackStrategyType());
  }

  static final _id_lowerQualityOrHigherThan = _class.staticMethodId(
    r'lowerQualityOrHigherThan',
    r'(Landroidx/camera/video/Quality;)Landroidx/camera/video/FallbackStrategy;',
  );

  static final _lowerQualityOrHigherThan = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.FallbackStrategy lowerQualityOrHigherThan(androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static FallbackStrategy lowerQualityOrHigherThan(
    quality_.Quality quality,
  ) {
    return _lowerQualityOrHigherThan(
            _class.reference.pointer,
            _id_lowerQualityOrHigherThan as jni.JMethodIDPtr,
            quality.reference.pointer)
        .object(const $FallbackStrategyType());
  }

  static final _id_lowerQualityThan = _class.staticMethodId(
    r'lowerQualityThan',
    r'(Landroidx/camera/video/Quality;)Landroidx/camera/video/FallbackStrategy;',
  );

  static final _lowerQualityThan = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public androidx.camera.video.FallbackStrategy lowerQualityThan(androidx.camera.video.Quality quality)
  /// The returned object must be released after use, by calling the [release] method.
  static FallbackStrategy lowerQualityThan(
    quality_.Quality quality,
  ) {
    return _lowerQualityThan(_class.reference.pointer,
            _id_lowerQualityThan as jni.JMethodIDPtr, quality.reference.pointer)
        .object(const $FallbackStrategyType());
  }
}

final class $FallbackStrategyType extends jni.JObjType<FallbackStrategy> {
  const $FallbackStrategyType();

  @override
  String get signature => r'Landroidx/camera/video/FallbackStrategy;';

  @override
  FallbackStrategy fromReference(jni.JReference reference) =>
      FallbackStrategy.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($FallbackStrategyType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($FallbackStrategyType) &&
        other is $FallbackStrategyType;
  }
}
