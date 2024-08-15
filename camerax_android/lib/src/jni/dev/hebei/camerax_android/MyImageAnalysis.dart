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

import '../../../androidx/camera/core/ImageProxy.dart' as imageproxy_;

/// from: dev.hebei.camerax_android.MyImageAnalysis$Companion
class MyImageAnalysis_Companion extends jni.JObject {
  @override
  late final jni.JObjType<MyImageAnalysis_Companion> $type = type;

  MyImageAnalysis_Companion.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'dev/hebei/camerax_android/MyImageAnalysis$Companion');

  /// The type which includes information such as the signature of this class.
  static const type = $MyImageAnalysis_CompanionType();
  static final _id_new0 = _class.constructorId(
    r'(Lkotlin/jvm/internal/DefaultConstructorMarker;)V',
  );

  static final _new0 = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public void <init>(kotlin.jvm.internal.DefaultConstructorMarker defaultConstructorMarker)
  /// The returned object must be released after use, by calling the [release] method.
  factory MyImageAnalysis_Companion(
    jni.JObject defaultConstructorMarker,
  ) {
    return MyImageAnalysis_Companion.fromReference(_new0(
            _class.reference.pointer,
            _id_new0 as jni.JMethodIDPtr,
            defaultConstructorMarker.reference.pointer)
        .reference);
  }
}

final class $MyImageAnalysis_CompanionType
    extends jni.JObjType<MyImageAnalysis_Companion> {
  const $MyImageAnalysis_CompanionType();

  @override
  String get signature =>
      r'Ldev/hebei/camerax_android/MyImageAnalysis$Companion;';

  @override
  MyImageAnalysis_Companion fromReference(jni.JReference reference) =>
      MyImageAnalysis_Companion.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyImageAnalysis_CompanionType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyImageAnalysis_CompanionType) &&
        other is $MyImageAnalysis_CompanionType;
  }
}

/// from: dev.hebei.camerax_android.MyImageAnalysis$MyAnalyzer
class MyImageAnalysis_MyAnalyzer extends jni.JObject {
  @override
  late final jni.JObjType<MyImageAnalysis_MyAnalyzer> $type = type;

  MyImageAnalysis_MyAnalyzer.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'dev/hebei/camerax_android/MyImageAnalysis$MyAnalyzer');

  /// The type which includes information such as the signature of this class.
  static const type = $MyImageAnalysis_MyAnalyzerType();
  static final _id_analyze = _class.instanceMethodId(
    r'analyze',
    r'(Landroidx/camera/core/ImageProxy;)V',
  );

  static final _analyze = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JThrowablePtr Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void analyze(androidx.camera.core.ImageProxy imageProxy)
  void analyze(
    imageproxy_.ImageProxy imageProxy,
  ) {
    _analyze(reference.pointer, _id_analyze as jni.JMethodIDPtr,
            imageProxy.reference.pointer)
        .check();
  }

  /// Maps a specific port to the implemented interface.
  static final Map<int, $MyImageAnalysis_MyAnalyzerImpl> _$impls = {};
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
      if ($d == r'analyze(Landroidx/camera/core/ImageProxy;)V') {
        _$impls[$p]!.analyze(
          $a[0].castTo(const imageproxy_.$ImageProxyType(),
              releaseOriginal: true),
        );
        return jni.nullptr;
      }
    } catch (e) {
      return ProtectedJniExtensions.newDartException(e);
    }
    return jni.nullptr;
  }

  factory MyImageAnalysis_MyAnalyzer.implement(
    $MyImageAnalysis_MyAnalyzerImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = MyImageAnalysis_MyAnalyzer.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'dev.hebei.camerax_android.MyImageAnalysis$MyAnalyzer',
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

abstract interface class $MyImageAnalysis_MyAnalyzerImpl {
  factory $MyImageAnalysis_MyAnalyzerImpl({
    required void Function(imageproxy_.ImageProxy imageProxy) analyze,
  }) = _$MyImageAnalysis_MyAnalyzerImpl;

  void analyze(imageproxy_.ImageProxy imageProxy);
}

class _$MyImageAnalysis_MyAnalyzerImpl
    implements $MyImageAnalysis_MyAnalyzerImpl {
  _$MyImageAnalysis_MyAnalyzerImpl({
    required void Function(imageproxy_.ImageProxy imageProxy) analyze,
  }) : _analyze = analyze;

  final void Function(imageproxy_.ImageProxy imageProxy) _analyze;

  void analyze(imageproxy_.ImageProxy imageProxy) {
    return _analyze(imageProxy);
  }
}

final class $MyImageAnalysis_MyAnalyzerType
    extends jni.JObjType<MyImageAnalysis_MyAnalyzer> {
  const $MyImageAnalysis_MyAnalyzerType();

  @override
  String get signature =>
      r'Ldev/hebei/camerax_android/MyImageAnalysis$MyAnalyzer;';

  @override
  MyImageAnalysis_MyAnalyzer fromReference(jni.JReference reference) =>
      MyImageAnalysis_MyAnalyzer.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyImageAnalysis_MyAnalyzerType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyImageAnalysis_MyAnalyzerType) &&
        other is $MyImageAnalysis_MyAnalyzerType;
  }
}

/// from: dev.hebei.camerax_android.MyImageAnalysis$MyAnalyzerImpl
class MyImageAnalysis_MyAnalyzerImpl extends jni.JObject {
  @override
  late final jni.JObjType<MyImageAnalysis_MyAnalyzerImpl> $type = type;

  MyImageAnalysis_MyAnalyzerImpl.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'dev/hebei/camerax_android/MyImageAnalysis$MyAnalyzerImpl');

  /// The type which includes information such as the signature of this class.
  static const type = $MyImageAnalysis_MyAnalyzerImplType();
  static final _id_new0 = _class.constructorId(
    r'(Ldev/hebei/camerax_android/MyImageAnalysis$MyAnalyzer;)V',
  );

  static final _new0 = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_NewObject')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public void <init>(dev.hebei.camerax_android.MyImageAnalysis$MyAnalyzer myAnalyzer)
  /// The returned object must be released after use, by calling the [release] method.
  factory MyImageAnalysis_MyAnalyzerImpl(
    MyImageAnalysis_MyAnalyzer myAnalyzer,
  ) {
    return MyImageAnalysis_MyAnalyzerImpl.fromReference(_new0(
            _class.reference.pointer,
            _id_new0 as jni.JMethodIDPtr,
            myAnalyzer.reference.pointer)
        .reference);
  }

  static final _id_analyze = _class.instanceMethodId(
    r'analyze',
    r'(Landroidx/camera/core/ImageProxy;)V',
  );

  static final _analyze = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JThrowablePtr Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public void analyze(androidx.camera.core.ImageProxy imageProxy)
  void analyze(
    imageproxy_.ImageProxy imageProxy,
  ) {
    _analyze(reference.pointer, _id_analyze as jni.JMethodIDPtr,
            imageProxy.reference.pointer)
        .check();
  }
}

final class $MyImageAnalysis_MyAnalyzerImplType
    extends jni.JObjType<MyImageAnalysis_MyAnalyzerImpl> {
  const $MyImageAnalysis_MyAnalyzerImplType();

  @override
  String get signature =>
      r'Ldev/hebei/camerax_android/MyImageAnalysis$MyAnalyzerImpl;';

  @override
  MyImageAnalysis_MyAnalyzerImpl fromReference(jni.JReference reference) =>
      MyImageAnalysis_MyAnalyzerImpl.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyImageAnalysis_MyAnalyzerImplType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyImageAnalysis_MyAnalyzerImplType) &&
        other is $MyImageAnalysis_MyAnalyzerImplType;
  }
}

/// from: dev.hebei.camerax_android.MyImageAnalysis
class MyImageAnalysis extends jni.JObject {
  @override
  late final jni.JObjType<MyImageAnalysis> $type = type;

  MyImageAnalysis.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'dev/hebei/camerax_android/MyImageAnalysis');

  /// The type which includes information such as the signature of this class.
  static const type = $MyImageAnalysisType();
  static final _id_Companion = _class.staticFieldId(
    r'Companion',
    r'Ldev/hebei/camerax_android/MyImageAnalysis$Companion;',
  );

  /// from: static public final dev.hebei.camerax_android.MyImageAnalysis$Companion Companion
  /// The returned object must be released after use, by calling the [release] method.
  static MyImageAnalysis_Companion get Companion =>
      _id_Companion.get(_class, const $MyImageAnalysis_CompanionType());

  /// from: static public final int STRATEGY_KEEP_ONLY_LATEST
  static const STRATEGY_KEEP_ONLY_LATEST = 0;

  /// from: static public final int STRATEGY_BLOCK_PRODUCER
  static const STRATEGY_BLOCK_PRODUCER = 1;

  /// from: static public final int COORDINATE_SYSTEM_ORIGINAL
  static const COORDINATE_SYSTEM_ORIGINAL = 0;

  /// from: static public final int COORDINATE_SYSTEM_SENSOR
  static const COORDINATE_SYSTEM_SENSOR = 2;

  /// from: static public final int COORDINATE_SYSTEM_VIEW_REFERENCED
  static const COORDINATE_SYSTEM_VIEW_REFERENCED = 1;

  /// from: static public final int OUTPUT_IMAGE_FORMAT_YUV_420_888
  static const OUTPUT_IMAGE_FORMAT_YUV_420_888 = 1;

  /// from: static public final int OUTPUT_IMAGE_FORMAT_RGBA_8888
  static const OUTPUT_IMAGE_FORMAT_RGBA_8888 = 2;
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
  factory MyImageAnalysis() {
    return MyImageAnalysis.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr)
            .reference);
  }
}

final class $MyImageAnalysisType extends jni.JObjType<MyImageAnalysis> {
  const $MyImageAnalysisType();

  @override
  String get signature => r'Ldev/hebei/camerax_android/MyImageAnalysis;';

  @override
  MyImageAnalysis fromReference(jni.JReference reference) =>
      MyImageAnalysis.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($MyImageAnalysisType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($MyImageAnalysisType) &&
        other is $MyImageAnalysisType;
  }
}
