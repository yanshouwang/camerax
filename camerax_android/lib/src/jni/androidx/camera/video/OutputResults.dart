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

import '../../../android/net/Uri.dart' as uri_;

/// from: androidx.camera.video.OutputResults
class OutputResults extends jni.JObject {
  @override
  late final jni.JObjType<OutputResults> $type = type;

  OutputResults.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/OutputResults');

  /// The type which includes information such as the signature of this class.
  static const type = $OutputResultsType();
  static final _id_new0 = _class.constructorId(
    r'()V',
  );

  static final _new0 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_NewObject')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public void <init>()
  /// The returned object must be released after use, by calling the [release] method.
  factory OutputResults() {
    return OutputResults.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr)
            .reference);
  }

  static final _id_getOutputUri = _class.instanceMethodId(
    r'getOutputUri',
    r'()Landroid/net/Uri;',
  );

  static final _getOutputUri = ProtectedJniExtensions.lookup<
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

  /// from: public abstract android.net.Uri getOutputUri()
  /// The returned object must be released after use, by calling the [release] method.
  uri_.Uri getOutputUri() {
    return _getOutputUri(
            reference.pointer, _id_getOutputUri as jni.JMethodIDPtr)
        .object(const uri_.$UriType());
  }
}

final class $OutputResultsType extends jni.JObjType<OutputResults> {
  const $OutputResultsType();

  @override
  String get signature => r'Landroidx/camera/video/OutputResults;';

  @override
  OutputResults fromReference(jni.JReference reference) =>
      OutputResults.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($OutputResultsType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($OutputResultsType) &&
        other is $OutputResultsType;
  }
}