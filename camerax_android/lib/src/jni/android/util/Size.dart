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

/// from: android.util.Size
class Size extends jni.JObject {
  @override
  late final jni.JObjType<Size> $type = type;

  Size.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(r'android/util/Size');

  /// The type which includes information such as the signature of this class.
  static const type = $SizeType();
  static final _id_new0 = _class.constructorId(
    r'(II)V',
  );

  static final _new0 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
                  ffi.VarArgs<($Int32, $Int32)>)>>('globalEnv_NewObject')
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>, jni.JMethodIDPtr, int, int)>();

  /// from: public void <init>(int i, int i1)
  /// The returned object must be released after use, by calling the [release] method.
  factory Size(
    int i,
    int i1,
  ) {
    return Size.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr, i, i1)
            .reference);
  }

  static final _id_getWidth = _class.instanceMethodId(
    r'getWidth',
    r'()I',
  );

  static final _getWidth = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallIntMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public int getWidth()
  int getWidth() {
    return _getWidth(reference.pointer, _id_getWidth as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_getHeight = _class.instanceMethodId(
    r'getHeight',
    r'()I',
  );

  static final _getHeight = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallIntMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public int getHeight()
  int getHeight() {
    return _getHeight(reference.pointer, _id_getHeight as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_equals = _class.instanceMethodId(
    r'equals',
    r'(Ljava/lang/Object;)Z',
  );

  static final _equals = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallBooleanMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public boolean equals(java.lang.Object object)
  bool equals(
    jni.JObject object,
  ) {
    return _equals(reference.pointer, _id_equals as jni.JMethodIDPtr,
            object.reference.pointer)
        .boolean;
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

  static final _id_parseSize = _class.staticMethodId(
    r'parseSize',
    r'(Ljava/lang/String;)Landroid/util/Size;',
  );

  static final _parseSize = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public android.util.Size parseSize(java.lang.String string)
  /// The returned object must be released after use, by calling the [release] method.
  static Size parseSize(
    jni.JString string,
  ) {
    return _parseSize(_class.reference.pointer,
            _id_parseSize as jni.JMethodIDPtr, string.reference.pointer)
        .object(const $SizeType());
  }

  static final _id_hashCode1 = _class.instanceMethodId(
    r'hashCode',
    r'()I',
  );

  static final _hashCode1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallIntMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public int hashCode()
  int hashCode1() {
    return _hashCode1(reference.pointer, _id_hashCode1 as jni.JMethodIDPtr)
        .integer;
  }
}

final class $SizeType extends jni.JObjType<Size> {
  const $SizeType();

  @override
  String get signature => r'Landroid/util/Size;';

  @override
  Size fromReference(jni.JReference reference) => Size.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($SizeType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($SizeType) && other is $SizeType;
  }
}
