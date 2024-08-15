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

import '../../../../../java/lang/Runnable.dart' as runnable_;

import '../../../../../java/util/concurrent/Executor.dart' as executor_;

/// from: com.google.common.util.concurrent.ListenableFuture
class ListenableFuture<$V extends jni.JObject> extends jni.JObject {
  @override
  late final jni.JObjType<ListenableFuture<$V>> $type = type(V);

  final jni.JObjType<$V> V;

  ListenableFuture.fromReference(
    this.V,
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'com/google/common/util/concurrent/ListenableFuture');

  /// The type which includes information such as the signature of this class.
  static $ListenableFutureType<$V> type<$V extends jni.JObject>(
    jni.JObjType<$V> V,
  ) {
    return $ListenableFutureType(
      V,
    );
  }

  static final _id_addListener = _class.instanceMethodId(
    r'addListener',
    r'(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V',
  );

  static final _addListener = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JThrowablePtr Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void addListener(java.lang.Runnable runnable, java.util.concurrent.Executor executor)
  void addListener(
    runnable_.Runnable runnable,
    executor_.Executor executor,
  ) {
    _addListener(reference.pointer, _id_addListener as jni.JMethodIDPtr,
            runnable.reference.pointer, executor.reference.pointer)
        .check();
  }

  /// Maps a specific port to the implemented interface.
  static final Map<int, $ListenableFutureImpl> _$impls = {};
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
      if ($d ==
          r'addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V') {
        _$impls[$p]!.addListener(
          $a[0].castTo(const runnable_.$RunnableType(), releaseOriginal: true),
          $a[1].castTo(const executor_.$ExecutorType(), releaseOriginal: true),
        );
        return jni.nullptr;
      }
    } catch (e) {
      return ProtectedJniExtensions.newDartException(e);
    }
    return jni.nullptr;
  }

  factory ListenableFuture.implement(
    $ListenableFutureImpl<$V> $impl,
  ) {
    final $p = ReceivePort();
    final $x = ListenableFuture.fromReference(
      $impl.V,
      ProtectedJniExtensions.newPortProxy(
        r'com.google.common.util.concurrent.ListenableFuture',
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

abstract interface class $ListenableFutureImpl<$V extends jni.JObject> {
  factory $ListenableFutureImpl({
    required jni.JObjType<$V> V,
    required void Function(
            runnable_.Runnable runnable, executor_.Executor executor)
        addListener,
  }) = _$ListenableFutureImpl;

  jni.JObjType<$V> get V;

  void addListener(runnable_.Runnable runnable, executor_.Executor executor);
}

class _$ListenableFutureImpl<$V extends jni.JObject>
    implements $ListenableFutureImpl<$V> {
  _$ListenableFutureImpl({
    required this.V,
    required void Function(
            runnable_.Runnable runnable, executor_.Executor executor)
        addListener,
  }) : _addListener = addListener;

  @override
  final jni.JObjType<$V> V;

  final void Function(runnable_.Runnable runnable, executor_.Executor executor)
      _addListener;

  void addListener(runnable_.Runnable runnable, executor_.Executor executor) {
    return _addListener(runnable, executor);
  }
}

final class $ListenableFutureType<$V extends jni.JObject>
    extends jni.JObjType<ListenableFuture<$V>> {
  final jni.JObjType<$V> V;

  const $ListenableFutureType(
    this.V,
  );

  @override
  String get signature =>
      r'Lcom/google/common/util/concurrent/ListenableFuture;';

  @override
  ListenableFuture<$V> fromReference(jni.JReference reference) =>
      ListenableFuture.fromReference(V, reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => Object.hash($ListenableFutureType, V);

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($ListenableFutureType<$V>) &&
        other is $ListenableFutureType<$V> &&
        V == other.V;
  }
}
