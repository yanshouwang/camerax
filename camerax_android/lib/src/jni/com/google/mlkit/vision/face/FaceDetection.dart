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

import 'FaceDetector.dart' as facedetector_;

import 'FaceDetectorOptions.dart' as facedetectoroptions_;

/// from: com.google.mlkit.vision.face.FaceDetection
class FaceDetection extends jni.JObject {
  @override
  late final jni.JObjType<FaceDetection> $type = type;

  FaceDetection.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'com/google/mlkit/vision/face/FaceDetection');

  /// The type which includes information such as the signature of this class.
  static const type = $FaceDetectionType();
  static final _id_getClient = _class.staticMethodId(
    r'getClient',
    r'()Lcom/google/mlkit/vision/face/FaceDetector;',
  );

  static final _getClient = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: static public com.google.mlkit.vision.face.FaceDetector getClient()
  /// The returned object must be released after use, by calling the [release] method.
  static facedetector_.FaceDetector getClient() {
    return _getClient(
            _class.reference.pointer, _id_getClient as jni.JMethodIDPtr)
        .object(const facedetector_.$FaceDetectorType());
  }

  static final _id_getClient1 = _class.staticMethodId(
    r'getClient',
    r'(Lcom/google/mlkit/vision/face/FaceDetectorOptions;)Lcom/google/mlkit/vision/face/FaceDetector;',
  );

  static final _getClient1 = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public com.google.mlkit.vision.face.FaceDetector getClient(com.google.mlkit.vision.face.FaceDetectorOptions faceDetectorOptions)
  /// The returned object must be released after use, by calling the [release] method.
  static facedetector_.FaceDetector getClient1(
    facedetectoroptions_.FaceDetectorOptions faceDetectorOptions,
  ) {
    return _getClient1(
            _class.reference.pointer,
            _id_getClient1 as jni.JMethodIDPtr,
            faceDetectorOptions.reference.pointer)
        .object(const facedetector_.$FaceDetectorType());
  }
}

final class $FaceDetectionType extends jni.JObjType<FaceDetection> {
  const $FaceDetectionType();

  @override
  String get signature => r'Lcom/google/mlkit/vision/face/FaceDetection;';

  @override
  FaceDetection fromReference(jni.JReference reference) =>
      FaceDetection.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($FaceDetectionType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($FaceDetectionType) &&
        other is $FaceDetectionType;
  }
}