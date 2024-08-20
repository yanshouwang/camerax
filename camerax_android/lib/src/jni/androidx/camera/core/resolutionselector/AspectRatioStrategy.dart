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

/// from: androidx.camera.core.resolutionselector.AspectRatioStrategy$AspectRatioFallbackRule
class AspectRatioStrategy_AspectRatioFallbackRule extends jni.JObject {
  @override
  late final jni.JObjType<AspectRatioStrategy_AspectRatioFallbackRule> $type =
      type;

  AspectRatioStrategy_AspectRatioFallbackRule.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'androidx/camera/core/resolutionselector/AspectRatioStrategy$AspectRatioFallbackRule');

  /// The type which includes information such as the signature of this class.
  static const type = $AspectRatioStrategy_AspectRatioFallbackRuleType();

  /// Maps a specific port to the implemented interface.
  static final Map<int, $AspectRatioStrategy_AspectRatioFallbackRuleImpl>
      _$impls = {};
  ReceivePort? _$p;

  static jni.JObjectPtr _$invoke(
    int port,
    jni.JObjectPtr descriptor,
    jni.JObjectPtr args,
  ) {
    return _$invokeMethod(
      port,
      $MethodInvocation.fromAddresses(
        0,
        descriptor.address,
        args.address,
      ),
    );
  }

  static final ffi.Pointer<
          ffi.NativeFunction<
              jni.JObjectPtr Function(
                  ffi.Uint64, jni.JObjectPtr, jni.JObjectPtr)>>
      _$invokePointer = ffi.Pointer.fromFunction(_$invoke);

  static ffi.Pointer<ffi.Void> _$invokeMethod(
    int $p,
    $MethodInvocation $i,
  ) {
    try {
      final $d = $i.methodDescriptor.toDartString(releaseOriginal: true);
      final $a = $i.args;
    } catch (e) {
      return ProtectedJniExtensions.newDartException(e);
    }
    return jni.nullptr;
  }

  factory AspectRatioStrategy_AspectRatioFallbackRule.implement(
    $AspectRatioStrategy_AspectRatioFallbackRuleImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = AspectRatioStrategy_AspectRatioFallbackRule.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'androidx.camera.core.resolutionselector.AspectRatioStrategy$AspectRatioFallbackRule',
        $p,
        _$invokePointer,
      ),
    ).._$p = $p;
    final $a = $p.sendPort.nativePort;
    _$impls[$a] = $impl;
    $p.listen(($m) {
      if ($m == null) {
        _$impls.remove($p.sendPort.nativePort);
        $p.close();
        return;
      }
      final $i = $MethodInvocation.fromMessage($m as List<dynamic>);
      final $r = _$invokeMethod($p.sendPort.nativePort, $i);
      ProtectedJniExtensions.returnResult($i.result, $r);
    });
    return $x;
  }
}

abstract interface class $AspectRatioStrategy_AspectRatioFallbackRuleImpl {
  factory $AspectRatioStrategy_AspectRatioFallbackRuleImpl() =
      _$AspectRatioStrategy_AspectRatioFallbackRuleImpl;
}

class _$AspectRatioStrategy_AspectRatioFallbackRuleImpl
    implements $AspectRatioStrategy_AspectRatioFallbackRuleImpl {
  _$AspectRatioStrategy_AspectRatioFallbackRuleImpl();
}

final class $AspectRatioStrategy_AspectRatioFallbackRuleType
    extends jni.JObjType<AspectRatioStrategy_AspectRatioFallbackRule> {
  const $AspectRatioStrategy_AspectRatioFallbackRuleType();

  @override
  String get signature =>
      r'Landroidx/camera/core/resolutionselector/AspectRatioStrategy$AspectRatioFallbackRule;';

  @override
  AspectRatioStrategy_AspectRatioFallbackRule fromReference(
          jni.JReference reference) =>
      AspectRatioStrategy_AspectRatioFallbackRule.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode =>
      ($AspectRatioStrategy_AspectRatioFallbackRuleType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType ==
            ($AspectRatioStrategy_AspectRatioFallbackRuleType) &&
        other is $AspectRatioStrategy_AspectRatioFallbackRuleType;
  }
}

/// from: androidx.camera.core.resolutionselector.AspectRatioStrategy
class AspectRatioStrategy extends jni.JObject {
  @override
  late final jni.JObjType<AspectRatioStrategy> $type = type;

  AspectRatioStrategy.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'androidx/camera/core/resolutionselector/AspectRatioStrategy');

  /// The type which includes information such as the signature of this class.
  static const type = $AspectRatioStrategyType();

  /// from: static public final int FALLBACK_RULE_NONE
  static const FALLBACK_RULE_NONE = 0;

  /// from: static public final int FALLBACK_RULE_AUTO
  static const FALLBACK_RULE_AUTO = 1;
  static final _id_RATIO_4_3_FALLBACK_AUTO_STRATEGY = _class.staticFieldId(
    r'RATIO_4_3_FALLBACK_AUTO_STRATEGY',
    r'Landroidx/camera/core/resolutionselector/AspectRatioStrategy;',
  );

  /// from: static public final androidx.camera.core.resolutionselector.AspectRatioStrategy RATIO_4_3_FALLBACK_AUTO_STRATEGY
  /// The returned object must be released after use, by calling the [release] method.
  static AspectRatioStrategy get RATIO_4_3_FALLBACK_AUTO_STRATEGY =>
      _id_RATIO_4_3_FALLBACK_AUTO_STRATEGY.get(
          _class, const $AspectRatioStrategyType());

  static final _id_RATIO_16_9_FALLBACK_AUTO_STRATEGY = _class.staticFieldId(
    r'RATIO_16_9_FALLBACK_AUTO_STRATEGY',
    r'Landroidx/camera/core/resolutionselector/AspectRatioStrategy;',
  );

  /// from: static public final androidx.camera.core.resolutionselector.AspectRatioStrategy RATIO_16_9_FALLBACK_AUTO_STRATEGY
  /// The returned object must be released after use, by calling the [release] method.
  static AspectRatioStrategy get RATIO_16_9_FALLBACK_AUTO_STRATEGY =>
      _id_RATIO_16_9_FALLBACK_AUTO_STRATEGY.get(
          _class, const $AspectRatioStrategyType());

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
  factory AspectRatioStrategy(
    int i,
    int i1,
  ) {
    return AspectRatioStrategy.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr, i, i1)
            .reference);
  }

  static final _id_getPreferredAspectRatio = _class.instanceMethodId(
    r'getPreferredAspectRatio',
    r'()I',
  );

  static final _getPreferredAspectRatio = ProtectedJniExtensions.lookup<
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

  /// from: public int getPreferredAspectRatio()
  int getPreferredAspectRatio() {
    return _getPreferredAspectRatio(
            reference.pointer, _id_getPreferredAspectRatio as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_getFallbackRule = _class.instanceMethodId(
    r'getFallbackRule',
    r'()I',
  );

  static final _getFallbackRule = ProtectedJniExtensions.lookup<
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

  /// from: public int getFallbackRule()
  int getFallbackRule() {
    return _getFallbackRule(
            reference.pointer, _id_getFallbackRule as jni.JMethodIDPtr)
        .integer;
  }
}

final class $AspectRatioStrategyType extends jni.JObjType<AspectRatioStrategy> {
  const $AspectRatioStrategyType();

  @override
  String get signature =>
      r'Landroidx/camera/core/resolutionselector/AspectRatioStrategy;';

  @override
  AspectRatioStrategy fromReference(jni.JReference reference) =>
      AspectRatioStrategy.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($AspectRatioStrategyType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($AspectRatioStrategyType) &&
        other is $AspectRatioStrategyType;
  }
}