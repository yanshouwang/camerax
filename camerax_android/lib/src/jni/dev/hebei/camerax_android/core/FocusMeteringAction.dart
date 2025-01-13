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

import 'MeteringPoint.dart' as meteringpoint$_;

/// from: `dev.hebei.camerax_android.core.FocusMeteringAction$Builder`
class FocusMeteringAction$Builder extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<FocusMeteringAction$Builder> $type;

  @jni$_.internal
  FocusMeteringAction$Builder.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'dev/hebei/camerax_android/core/FocusMeteringAction$Builder');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $FocusMeteringAction$Builder$NullableType();
  static const type = $FocusMeteringAction$Builder$Type();
  static final _id_new$ = _class.constructorId(
    r'(Landroidx/camera/core/FocusMeteringAction$Builder;)V',
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

  /// from: `public void <init>(androidx.camera.core.FocusMeteringAction$Builder builder)`
  /// The returned object must be released after use, by calling the [release] method.
  factory FocusMeteringAction$Builder(
    jni$_.JObject builder,
  ) {
    final _$builder = builder.reference;
    return FocusMeteringAction$Builder.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            _$builder.pointer)
        .reference);
  }

  static final _id_new$1 = _class.constructorId(
    r'(Ldev/hebei/camerax_android/core/MeteringPoint;)V',
  );

  static final _new$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public void <init>(dev.hebei.camerax_android.core.MeteringPoint meteringPoint)`
  /// The returned object must be released after use, by calling the [release] method.
  factory FocusMeteringAction$Builder.new$1(
    meteringpoint$_.MeteringPoint meteringPoint,
  ) {
    final _$meteringPoint = meteringPoint.reference;
    return FocusMeteringAction$Builder.fromReference(_new$1(
            _class.reference.pointer,
            _id_new$1 as jni$_.JMethodIDPtr,
            _$meteringPoint.pointer)
        .reference);
  }

  static final _id_new$2 = _class.constructorId(
    r'(Ldev/hebei/camerax_android/core/MeteringPoint;I)V',
  );

  static final _new$2 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_
                          .VarArgs<(jni$_.Pointer<jni$_.Void>, jni$_.Int32)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>, int)>();

  /// from: `public void <init>(dev.hebei.camerax_android.core.MeteringPoint meteringPoint, int i)`
  /// The returned object must be released after use, by calling the [release] method.
  factory FocusMeteringAction$Builder.new$2(
    meteringpoint$_.MeteringPoint meteringPoint,
    int i,
  ) {
    final _$meteringPoint = meteringPoint.reference;
    return FocusMeteringAction$Builder.fromReference(_new$2(
            _class.reference.pointer,
            _id_new$2 as jni$_.JMethodIDPtr,
            _$meteringPoint.pointer,
            i)
        .reference);
  }

  static final _id_addPoint = _class.instanceMethodId(
    r'addPoint',
    r'(Ldev/hebei/camerax_android/core/MeteringPoint;)Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;',
  );

  static final _addPoint = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_.VarArgs<(jni$_.Pointer<jni$_.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final dev.hebei.camerax_android.core.FocusMeteringAction$Builder addPoint(dev.hebei.camerax_android.core.MeteringPoint meteringPoint)`
  /// The returned object must be released after use, by calling the [release] method.
  FocusMeteringAction$Builder addPoint(
    meteringpoint$_.MeteringPoint meteringPoint,
  ) {
    final _$meteringPoint = meteringPoint.reference;
    return _addPoint(reference.pointer, _id_addPoint as jni$_.JMethodIDPtr,
            _$meteringPoint.pointer)
        .object<FocusMeteringAction$Builder>(
            const $FocusMeteringAction$Builder$Type());
  }

  static final _id_addPoint$1 = _class.instanceMethodId(
    r'addPoint',
    r'(Ldev/hebei/camerax_android/core/MeteringPoint;I)Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;',
  );

  static final _addPoint$1 = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_
                          .VarArgs<(jni$_.Pointer<jni$_.Void>, jni$_.Int32)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, jni$_.Pointer<jni$_.Void>, int)>();

  /// from: `public final dev.hebei.camerax_android.core.FocusMeteringAction$Builder addPoint(dev.hebei.camerax_android.core.MeteringPoint meteringPoint, int i)`
  /// The returned object must be released after use, by calling the [release] method.
  FocusMeteringAction$Builder addPoint$1(
    meteringpoint$_.MeteringPoint meteringPoint,
    int i,
  ) {
    final _$meteringPoint = meteringPoint.reference;
    return _addPoint$1(reference.pointer, _id_addPoint$1 as jni$_.JMethodIDPtr,
            _$meteringPoint.pointer, i)
        .object<FocusMeteringAction$Builder>(
            const $FocusMeteringAction$Builder$Type());
  }

  static final _id_disableAutoCancel = _class.instanceMethodId(
    r'disableAutoCancel',
    r'()Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;',
  );

  static final _disableAutoCancel = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final dev.hebei.camerax_android.core.FocusMeteringAction$Builder disableAutoCancel()`
  /// The returned object must be released after use, by calling the [release] method.
  FocusMeteringAction$Builder disableAutoCancel() {
    return _disableAutoCancel(
            reference.pointer, _id_disableAutoCancel as jni$_.JMethodIDPtr)
        .object<FocusMeteringAction$Builder>(
            const $FocusMeteringAction$Builder$Type());
  }

  static final _id_setAutoCancelDuration = _class.instanceMethodId(
    r'setAutoCancelDuration',
    r'(JLjava/util/concurrent/TimeUnit;)Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;',
  );

  static final _setAutoCancelDuration = jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                      jni$_.Pointer<jni$_.Void>,
                      jni$_.JMethodIDPtr,
                      jni$_
                          .VarArgs<(jni$_.Int64, jni$_.Pointer<jni$_.Void>)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni$_.JniResult Function(jni$_.Pointer<jni$_.Void>,
              jni$_.JMethodIDPtr, int, jni$_.Pointer<jni$_.Void>)>();

  /// from: `public final dev.hebei.camerax_android.core.FocusMeteringAction$Builder setAutoCancelDuration(long j, java.util.concurrent.TimeUnit timeUnit)`
  /// The returned object must be released after use, by calling the [release] method.
  FocusMeteringAction$Builder setAutoCancelDuration(
    int j,
    jni$_.JObject timeUnit,
  ) {
    final _$timeUnit = timeUnit.reference;
    return _setAutoCancelDuration(
            reference.pointer,
            _id_setAutoCancelDuration as jni$_.JMethodIDPtr,
            j,
            _$timeUnit.pointer)
        .object<FocusMeteringAction$Builder>(
            const $FocusMeteringAction$Builder$Type());
  }

  static final _id_build = _class.instanceMethodId(
    r'build',
    r'()Ldev/hebei/camerax_android/core/FocusMeteringAction;',
  );

  static final _build = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final dev.hebei.camerax_android.core.FocusMeteringAction build()`
  /// The returned object must be released after use, by calling the [release] method.
  FocusMeteringAction build() {
    return _build(reference.pointer, _id_build as jni$_.JMethodIDPtr)
        .object<FocusMeteringAction>(const $FocusMeteringAction$Type());
  }
}

final class $FocusMeteringAction$Builder$NullableType
    extends jni$_.JObjType<FocusMeteringAction$Builder?> {
  @jni$_.internal
  const $FocusMeteringAction$Builder$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$Builder? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : FocusMeteringAction$Builder.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$Builder?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$Builder$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$Builder$NullableType) &&
        other is $FocusMeteringAction$Builder$NullableType;
  }
}

final class $FocusMeteringAction$Builder$Type
    extends jni$_.JObjType<FocusMeteringAction$Builder> {
  @jni$_.internal
  const $FocusMeteringAction$Builder$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$Builder;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$Builder fromReference(jni$_.JReference reference) =>
      FocusMeteringAction$Builder.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$Builder?> get nullableType =>
      const $FocusMeteringAction$Builder$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$Builder$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$Builder$Type) &&
        other is $FocusMeteringAction$Builder$Type;
  }
}

/// from: `dev.hebei.camerax_android.core.FocusMeteringAction$Companion`
class FocusMeteringAction$Companion extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<FocusMeteringAction$Companion> $type;

  @jni$_.internal
  FocusMeteringAction$Companion.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'dev/hebei/camerax_android/core/FocusMeteringAction$Companion');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $FocusMeteringAction$Companion$NullableType();
  static const type = $FocusMeteringAction$Companion$Type();
  static final _id_new$ = _class.constructorId(
    r'(Lkotlin/jvm/internal/DefaultConstructorMarker;)V',
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

  /// from: `synthetic public void <init>(kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)`
  /// The returned object must be released after use, by calling the [release] method.
  factory FocusMeteringAction$Companion(
    jni$_.JObject? defaultConstructorMarker,
  ) {
    final _$defaultConstructorMarker =
        defaultConstructorMarker?.reference ?? jni$_.jNullReference;
    return FocusMeteringAction$Companion.fromReference(_new$(
            _class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr,
            _$defaultConstructorMarker.pointer)
        .reference);
  }
}

final class $FocusMeteringAction$Companion$NullableType
    extends jni$_.JObjType<FocusMeteringAction$Companion?> {
  @jni$_.internal
  const $FocusMeteringAction$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$Companion;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$Companion? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : FocusMeteringAction$Companion.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$Companion?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$Companion$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$Companion$NullableType) &&
        other is $FocusMeteringAction$Companion$NullableType;
  }
}

final class $FocusMeteringAction$Companion$Type
    extends jni$_.JObjType<FocusMeteringAction$Companion> {
  @jni$_.internal
  const $FocusMeteringAction$Companion$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$Companion;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$Companion fromReference(jni$_.JReference reference) =>
      FocusMeteringAction$Companion.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$Companion?> get nullableType =>
      const $FocusMeteringAction$Companion$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$Companion$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$Companion$Type) &&
        other is $FocusMeteringAction$Companion$Type;
  }
}

/// from: `dev.hebei.camerax_android.core.FocusMeteringAction$MeteringMode`
class FocusMeteringAction$MeteringMode extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<FocusMeteringAction$MeteringMode> $type;

  @jni$_.internal
  FocusMeteringAction$MeteringMode.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'dev/hebei/camerax_android/core/FocusMeteringAction$MeteringMode');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $FocusMeteringAction$MeteringMode$NullableType();
  static const type = $FocusMeteringAction$MeteringMode$Type();

  /// Maps a specific port to the implemented interface.
  static final core$_.Map<int, $FocusMeteringAction$MeteringMode> _$impls = {};
  static jni$_.JObjectPtr _$invoke(
    int port,
    jni$_.JObjectPtr descriptor,
    jni$_.JObjectPtr args,
  ) {
    return _$invokeMethod(
      port,
      jni$_.MethodInvocation.fromAddresses(
        0,
        descriptor.address,
        args.address,
      ),
    );
  }

  static final jni$_.Pointer<
          jni$_.NativeFunction<
              jni$_.JObjectPtr Function(
                  jni$_.Int64, jni$_.JObjectPtr, jni$_.JObjectPtr)>>
      _$invokePointer = jni$_.Pointer.fromFunction(_$invoke);

  static jni$_.Pointer<jni$_.Void> _$invokeMethod(
    int $p,
    jni$_.MethodInvocation $i,
  ) {
    try {
      final $d = $i.methodDescriptor.toDartString(releaseOriginal: true);
      final $a = $i.args;
    } catch (e) {
      return jni$_.ProtectedJniExtensions.newDartException(e);
    }
    return jni$_.nullptr;
  }

  static void implementIn(
    jni$_.JImplementer implementer,
    $FocusMeteringAction$MeteringMode $impl,
  ) {
    late final jni$_.RawReceivePort $p;
    $p = jni$_.RawReceivePort(($m) {
      if ($m == null) {
        _$impls.remove($p.sendPort.nativePort);
        $p.close();
        return;
      }
      final $i = jni$_.MethodInvocation.fromMessage($m);
      final $r = _$invokeMethod($p.sendPort.nativePort, $i);
      jni$_.ProtectedJniExtensions.returnResult($i.result, $r);
    });
    implementer.add(
      r'dev.hebei.camerax_android.core.FocusMeteringAction$MeteringMode',
      $p,
      _$invokePointer,
      [],
    );
    final $a = $p.sendPort.nativePort;
    _$impls[$a] = $impl;
  }

  factory FocusMeteringAction$MeteringMode.implement(
    $FocusMeteringAction$MeteringMode $impl,
  ) {
    final $i = jni$_.JImplementer();
    implementIn($i, $impl);
    return FocusMeteringAction$MeteringMode.fromReference(
      $i.implementReference(),
    );
  }
}

abstract base mixin class $FocusMeteringAction$MeteringMode {
  factory $FocusMeteringAction$MeteringMode() =
      _$FocusMeteringAction$MeteringMode;
}

final class _$FocusMeteringAction$MeteringMode
    with $FocusMeteringAction$MeteringMode {
  _$FocusMeteringAction$MeteringMode();
}

final class $FocusMeteringAction$MeteringMode$NullableType
    extends jni$_.JObjType<FocusMeteringAction$MeteringMode?> {
  @jni$_.internal
  const $FocusMeteringAction$MeteringMode$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$MeteringMode;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$MeteringMode? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : FocusMeteringAction$MeteringMode.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$MeteringMode?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$MeteringMode$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType ==
            ($FocusMeteringAction$MeteringMode$NullableType) &&
        other is $FocusMeteringAction$MeteringMode$NullableType;
  }
}

final class $FocusMeteringAction$MeteringMode$Type
    extends jni$_.JObjType<FocusMeteringAction$MeteringMode> {
  @jni$_.internal
  const $FocusMeteringAction$MeteringMode$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction$MeteringMode;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction$MeteringMode fromReference(jni$_.JReference reference) =>
      FocusMeteringAction$MeteringMode.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectNullableType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction$MeteringMode?> get nullableType =>
      const $FocusMeteringAction$MeteringMode$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$MeteringMode$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$MeteringMode$Type) &&
        other is $FocusMeteringAction$MeteringMode$Type;
  }
}

/// from: `dev.hebei.camerax_android.core.FocusMeteringAction`
class FocusMeteringAction extends jni$_.JObject {
  @jni$_.internal
  @core$_.override
  final jni$_.JObjType<FocusMeteringAction> $type;

  @jni$_.internal
  FocusMeteringAction.fromReference(
    jni$_.JReference reference,
  )   : $type = type,
        super.fromReference(reference);

  static final _class = jni$_.JClass.forName(
      r'dev/hebei/camerax_android/core/FocusMeteringAction');

  /// The type which includes information such as the signature of this class.
  static const nullableType = $FocusMeteringAction$NullableType();
  static const type = $FocusMeteringAction$Type();
  static final _id_Companion = _class.staticFieldId(
    r'Companion',
    r'Ldev/hebei/camerax_android/core/FocusMeteringAction$Companion;',
  );

  /// from: `static public final dev.hebei.camerax_android.core.FocusMeteringAction$Companion Companion`
  /// The returned object must be released after use, by calling the [release] method.
  static FocusMeteringAction$Companion? get Companion => _id_Companion.get(
      _class, const $FocusMeteringAction$Companion$NullableType());

  /// from: `static public final int FLAG_AF`
  static const FLAG_AF = 1;

  /// from: `static public final int FLAG_AE`
  static const FLAG_AE = 2;

  /// from: `static public final int FLAG_AWB`
  static const FLAG_AWB = 4;
  static final _id_new$ = _class.constructorId(
    r'(Landroidx/camera/core/FocusMeteringAction;)V',
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

  /// from: `public void <init>(androidx.camera.core.FocusMeteringAction focusMeteringAction)`
  /// The returned object must be released after use, by calling the [release] method.
  factory FocusMeteringAction(
    jni$_.JObject focusMeteringAction,
  ) {
    final _$focusMeteringAction = focusMeteringAction.reference;
    return FocusMeteringAction.fromReference(_new$(_class.reference.pointer,
            _id_new$ as jni$_.JMethodIDPtr, _$focusMeteringAction.pointer)
        .reference);
  }

  static final _id_getAutoCancelDurationInMills = _class.instanceMethodId(
    r'getAutoCancelDurationInMills',
    r'()J',
  );

  static final _getAutoCancelDurationInMills =
      jni$_.ProtectedJniExtensions.lookup<
              jni$_.NativeFunction<
                  jni$_.JniResult Function(
                    jni$_.Pointer<jni$_.Void>,
                    jni$_.JMethodIDPtr,
                  )>>('globalEnv_CallLongMethod')
          .asFunction<
              jni$_.JniResult Function(
                jni$_.Pointer<jni$_.Void>,
                jni$_.JMethodIDPtr,
              )>();

  /// from: `public final long getAutoCancelDurationInMills()`
  int getAutoCancelDurationInMills() {
    return _getAutoCancelDurationInMills(reference.pointer,
            _id_getAutoCancelDurationInMills as jni$_.JMethodIDPtr)
        .long;
  }

  static final _id_getMeteringPointsAe = _class.instanceMethodId(
    r'getMeteringPointsAe',
    r'()Ljava/util/List;',
  );

  static final _getMeteringPointsAe = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final java.util.List getMeteringPointsAe()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JList<jni$_.JObject> getMeteringPointsAe() {
    return _getMeteringPointsAe(
            reference.pointer, _id_getMeteringPointsAe as jni$_.JMethodIDPtr)
        .object<jni$_.JList<jni$_.JObject>>(
            const jni$_.JListType<jni$_.JObject>(jni$_.JObjectType()));
  }

  static final _id_getMeteringPointsAf = _class.instanceMethodId(
    r'getMeteringPointsAf',
    r'()Ljava/util/List;',
  );

  static final _getMeteringPointsAf = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final java.util.List getMeteringPointsAf()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JList<jni$_.JObject> getMeteringPointsAf() {
    return _getMeteringPointsAf(
            reference.pointer, _id_getMeteringPointsAf as jni$_.JMethodIDPtr)
        .object<jni$_.JList<jni$_.JObject>>(
            const jni$_.JListType<jni$_.JObject>(jni$_.JObjectType()));
  }

  static final _id_getMeteringPointsAwb = _class.instanceMethodId(
    r'getMeteringPointsAwb',
    r'()Ljava/util/List;',
  );

  static final _getMeteringPointsAwb = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final java.util.List getMeteringPointsAwb()`
  /// The returned object must be released after use, by calling the [release] method.
  jni$_.JList<jni$_.JObject> getMeteringPointsAwb() {
    return _getMeteringPointsAwb(
            reference.pointer, _id_getMeteringPointsAwb as jni$_.JMethodIDPtr)
        .object<jni$_.JList<jni$_.JObject>>(
            const jni$_.JListType<jni$_.JObject>(jni$_.JObjectType()));
  }

  static final _id_isAutoCancelEnabled = _class.instanceMethodId(
    r'isAutoCancelEnabled',
    r'()Z',
  );

  static final _isAutoCancelEnabled = jni$_.ProtectedJniExtensions.lookup<
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

  /// from: `public final boolean isAutoCancelEnabled()`
  bool isAutoCancelEnabled() {
    return _isAutoCancelEnabled(
            reference.pointer, _id_isAutoCancelEnabled as jni$_.JMethodIDPtr)
        .boolean;
  }
}

final class $FocusMeteringAction$NullableType
    extends jni$_.JObjType<FocusMeteringAction?> {
  @jni$_.internal
  const $FocusMeteringAction$NullableType();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction? fromReference(jni$_.JReference reference) =>
      reference.isNull
          ? null
          : FocusMeteringAction.fromReference(
              reference,
            );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction?> get nullableType => this;

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$NullableType).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$NullableType) &&
        other is $FocusMeteringAction$NullableType;
  }
}

final class $FocusMeteringAction$Type
    extends jni$_.JObjType<FocusMeteringAction> {
  @jni$_.internal
  const $FocusMeteringAction$Type();

  @jni$_.internal
  @core$_.override
  String get signature =>
      r'Ldev/hebei/camerax_android/core/FocusMeteringAction;';

  @jni$_.internal
  @core$_.override
  FocusMeteringAction fromReference(jni$_.JReference reference) =>
      FocusMeteringAction.fromReference(
        reference,
      );
  @jni$_.internal
  @core$_.override
  jni$_.JObjType get superType => const jni$_.JObjectType();

  @jni$_.internal
  @core$_.override
  jni$_.JObjType<FocusMeteringAction?> get nullableType =>
      const $FocusMeteringAction$NullableType();

  @jni$_.internal
  @core$_.override
  final superCount = 1;

  @core$_.override
  int get hashCode => ($FocusMeteringAction$Type).hashCode;

  @core$_.override
  bool operator ==(Object other) {
    return other.runtimeType == ($FocusMeteringAction$Type) &&
        other is $FocusMeteringAction$Type;
  }
}