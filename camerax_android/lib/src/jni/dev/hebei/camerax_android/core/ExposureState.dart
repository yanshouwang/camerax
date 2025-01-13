// Autogenerated by jnigen. DO NOT EDIT!

// ignore_for_file: annotate_overrides
// ignore_for_file: argument_type_not_assignable
// ignore_for_file: camel_case_extensions
// ignore_for_file: camel_case_types
// ignore_for_file: constant_identifier_names
// ignore_for_file: doc_directive_unknown
// ignore_for_file: file_names
// ignore_for_file: inference_failure_on_untyped_parameter
// ignore_for_file: invalid_internal_annotation
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: library_prefixes
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_library_prefixes
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: only_throw_errors
// ignore_for_file: overridden_fields
// ignore_for_file: prefer_double_quotes
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_non_null_assertion
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: use_super_parameters

import 'dart:core' show Object, String, bool, double, int;
import 'dart:core' as core$_;

import 'package:jni/_internal.dart' as jni$_;
import 'package:jni/jni.dart' as jni$_;

/// from: `dev.hebei.camerax_android.core.ExposureState`
class ExposureState extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<ExposureState> $type;

  @jni$_.internal
  ExposureState.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class =
      jni$_.JClass.forName(r'dev/hebei/camerax_android/core/ExposureState');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $ExposureState$NullableType();
  static const type = $ExposureState$Type();
  static final _id_new$ = _class.constructorId(
    r'(Landroidx/camera/core/ExposureState;)V',
  );

  static final _new$ = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public void <init>(androidx.camera.core.ExposureState exposureState)`
  /// The returned object must be released after use, by calling the [release] method.
  factory ExposureState(
    jni$_.JObject exposureState,
  ) {
    final _$exposureState = exposureState.reference;
    return ExposureState.fromReference(_new$(_class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr, _$exposureState.pointer)
        .reference);
  }

  static final _id_getExposureCompensationIndex = _class.instanceMethodId(
    r'getExposureCompensationIndex',
    r'()I',
  );

  static final _getExposureCompensationIndex =
      jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                    jni$_.Pointer<jni$_.Void>,
                    jni$_.JMethodIDPtr,
                  )>>('globalEnv_CallIntMethod')
          .asFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>();

  /// from: `public final int getExposureCompensationIndex()`
  int getExposureCompensationIndex() {
    return _getExposureCompensationIndex(reference.pointer,
            _id_getExposureCompensationIndex as jni$_.JMethodIDPtr)
        .integer;
  }

  static final _id_getExposureCompensationRange = _class.instanceMethodId(
    r'getExposureCompensationRange',
    r'()Landroid/util/Range;',
  );

  static final _getExposureCompensationRange =
      jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                    jni$_.Pointer<jni$_.Void>,
                    jni$_.JMethodIDPtr,
                  )>>('globalEnv_CallObjectMethod')
          .asFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>();

  /// from: `public final android.util.Range getExposureCompensationRange()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JObject getExposureCompensationRange() {
    return _getExposureCompensationRange(reference.pointer,
            _id_getExposureCompensationRange as jni$_.JMethodIDPtr)
        .object<jni$_.JObject>(const jni$_.JObjectType());
  }

  static final _id_getExposureCompensationStep = _class.instanceMethodId(
    r'getExposureCompensationStep',
    r'()Landroid/util/Rational;',
  );

  static final _getExposureCompensationStep =
      jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                    jni$_.Pointer<jni$_.Void>,
                    jni$_.JMethodIDPtr,
                  )>>('globalEnv_CallObjectMethod')
          .asFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>();

  /// from: `public final android.util.Rational getExposureCompensationStep()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JObject getExposureCompensationStep() {
    return _getExposureCompensationStep(reference.pointer,
            _id_getExposureCompensationStep as jni$_.JMethodIDPtr)
        .object<jni$_.JObject>(const jni$_.JObjectType());
  }

  static final _id_isExposureCompensationSupported = _class.instanceMethodId(
    r'isExposureCompensationSupported',
    r'()Z',
  );

  static final _isExposureCompensationSupported =
      jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                    jni$_.Pointer<jni$_.Void>,
                    jni$_.JMethodIDPtr,
                  )>>('globalEnv_CallBooleanMethod')
          .asFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>();

  /// from: `public final boolean isExposureCompensationSupported()`
  bool isExposureCompensationSupported() {
    return _isExposureCompensationSupported(reference.pointer,
            _id_isExposureCompensationSupported as jni$_.JMethodIDPtr)
        .boolean;
  }
}

final class $ExposureState$NullableType extends jni$_.JObjType<ExposureState?> {
  @jni$_.internal
  const $ExposureState$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature => r'Ldev/hebei/camerax_android/core/ExposureState;';

  @jni$_.internal
  @core$_.override
  ExposureState? fromReference(jni$_.JReference reference) => reference.isNull
      ? null
      : ExposureState.fromReference(
          reference,
        );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<ExposureState?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($ExposureState$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($ExposureState$NullableType) &&
        other is $ExposureState$NullableType;
  }
}

final class $ExposureState$Type extends jni$_.JObjType<ExposureState> {
  @jni$_.internal
  const $ExposureState$Type();

  @jni$_.internal
  @core$_.override
  String get signature => r'Ldev/hebei/camerax_android/core/ExposureState;';

  @jni$_.internal
  @core$_.override
  ExposureState fromReference(jni$_.JReference reference) =>
      ExposureState.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<ExposureState?> get nullableType =>
      const $ExposureState$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($ExposureState$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($ExposureState$Type) &&
        other is $ExposureState$Type;
  }
}