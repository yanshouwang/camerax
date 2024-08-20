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

import '../../../android/content/ContentResolver.dart' as contentresolver_;

import '../../../android/content/ContentValues.dart' as contentvalues_;

import '../../../android/net/Uri.dart' as uri_;

/// from: dev.hebei.camerax_android.MyMediaStoreOutputOptions$MyBuilder
class MyMediaStoreOutputOptions_MyBuilder extends jni.JObject {
  @override
  late final jni.JObjType<MyMediaStoreOutputOptions_MyBuilder> $type = type;

  MyMediaStoreOutputOptions_MyBuilder.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'dev/hebei/camerax_android/MyMediaStoreOutputOptions$MyBuilder');

  /// The type which includes information such as the signature of this class.
  static const type = $MyMediaStoreOutputOptions_MyBuilderType();
  static final _id_new0 = _class.constructorId(
    r'(Landroid/content/ContentResolver;Landroid/net/Uri;)V',
  );

  static final _new0 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_NewObject')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public void <init>(android.content.ContentResolver contentResolver, android.net.Uri uri)
  /// The returned object must be released after use, by calling the [release] method.
  factory MyMediaStoreOutputOptions_MyBuilder(
    contentresolver_.ContentResolver contentResolver,
    uri_.Uri uri,
  ) {
    return MyMediaStoreOutputOptions_MyBuilder.fromReference(_new0(
            _class.reference.pointer,
            _id_new0 as jni.JMethodIDPtr,
            contentResolver.reference.pointer,
            uri.reference.pointer)
        .reference);
  }

  static final _id_setContentValues = _class.instanceMethodId(
    r'setContentValues',
    r'(Landroid/content/ContentValues;)Ldev/hebei/camerax_android/MyMediaStoreOutputOptions$MyBuilder;',
  );

  static final _setContentValues = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public final dev.hebei.camerax_android.MyMediaStoreOutputOptions$MyBuilder setContentValues(android.content.ContentValues contentValues)
  /// The returned object must be released after use, by calling the [release] method.
  MyMediaStoreOutputOptions_MyBuilder setContentValues(
    contentvalues_.ContentValues contentValues,
  ) {
    return _setContentValues(
            reference.pointer,
            _id_setContentValues as jni.JMethodIDPtr,
            contentValues.reference.pointer)
        .object(const $MyMediaStoreOutputOptions_MyBuilderType());
  }

  static final _id_build = _class.instanceMethodId(
    r'build',
    r'()Landroidx/camera/video/MediaStoreOutputOptions;',
  );

  static final _build = ProtectedJniExtensions.lookup<
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

  /// from: public final androidx.camera.video.MediaStoreOutputOptions build()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject build() {
    return _build(reference.pointer, _id_build as jni.JMethodIDPtr)
        .object(const jni.JObjectType());
  }
}

final class $MyMediaStoreOutputOptions_MyBuilderType
    extends jni.JObjType<MyMediaStoreOutputOptions_MyBuilder> {
  const $MyMediaStoreOutputOptions_MyBuilderType();

  @override
  String get signature =>
      r'Ldev/hebei/camerax_android/MyMediaStoreOutputOptions$MyBuilder;';

  @override
  MyMediaStoreOutputOptions_MyBuilder fromReference(jni.JReference reference) =>
      MyMediaStoreOutputOptions_MyBuilder.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyMediaStoreOutputOptions_MyBuilderType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyMediaStoreOutputOptions_MyBuilderType) &&
        other is $MyMediaStoreOutputOptions_MyBuilderType;
  }
}

/// from: dev.hebei.camerax_android.MyMediaStoreOutputOptions
class MyMediaStoreOutputOptions extends jni.JObject {
  @override
  late final jni.JObjType<MyMediaStoreOutputOptions> $type = type;

  MyMediaStoreOutputOptions.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'dev/hebei/camerax_android/MyMediaStoreOutputOptions');

  /// The type which includes information such as the signature of this class.
  static const type = $MyMediaStoreOutputOptionsType();
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
  factory MyMediaStoreOutputOptions() {
    return MyMediaStoreOutputOptions.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr)
            .reference);
  }
}

final class $MyMediaStoreOutputOptionsType
    extends jni.JObjType<MyMediaStoreOutputOptions> {
  const $MyMediaStoreOutputOptionsType();

  @override
  String get signature =>
      r'Ldev/hebei/camerax_android/MyMediaStoreOutputOptions;';

  @override
  MyMediaStoreOutputOptions fromReference(jni.JReference reference) =>
      MyMediaStoreOutputOptions.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyMediaStoreOutputOptionsType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyMediaStoreOutputOptionsType) &&
        other is $MyMediaStoreOutputOptionsType;
  }
}