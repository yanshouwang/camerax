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

/// from: java.lang.Runnable
class Runnable extends jni.JObject {
  @override
  late final jni.JObjType<Runnable> $type = type;

  Runnable.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(r'java/lang/Runnable');

  /// The type which includes information such as the signature of this class.
  static const type = $RunnableType();
  static final _id_run = _class.instanceMethodId(
    r'run',
    r'()V',
  );

  static final _run = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JThrowablePtr Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public abstract void run()
  void run() {
    _run(reference.pointer, _id_run as jni.JMethodIDPtr).check();
  }

  /// Maps a specific port to the implemented interface.
  static final Map<int, $RunnableImpl> _$impls = {};
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
      if ($d == r'run()V') {
        _$impls[$p]!.run();
        return jni.nullptr;
      }
    } catch (e) {
      return ProtectedJniExtensions.newDartException(e);
    }
    return jni.nullptr;
  }

  factory Runnable.implement(
    $RunnableImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = Runnable.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'java.lang.Runnable',
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

abstract interface class $RunnableImpl {
  factory $RunnableImpl({
    required void Function() run,
  }) = _$RunnableImpl;

  void run();
}

class _$RunnableImpl implements $RunnableImpl {
  _$RunnableImpl({
    required void Function() run,
  }) : _run = run;

  final void Function() _run;

  void run() {
    return _run();
  }
}

final class $RunnableType extends jni.JObjType<Runnable> {
  const $RunnableType();

  @override
  String get signature => r'Ljava/lang/Runnable;';

  @override
  Runnable fromReference(jni.JReference reference) =>
      Runnable.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($RunnableType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($RunnableType) && other is $RunnableType;
  }
}
