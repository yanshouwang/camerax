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

import '../../../../../android/app/Activity.dart' as activity_;

import '../../../../../java/util/concurrent/Executor.dart' as executor_;

import 'OnCanceledListener.dart' as oncanceledlistener_;

import 'OnCompleteListener.dart' as oncompletelistener_;

import 'OnFailureListener.dart' as onfailurelistener_;

import 'OnSuccessListener.dart' as onsuccesslistener_;

/// from: com.google.android.gms.tasks.Task
class Task<$TResult extends jni.JObject> extends jni.JObject {
  @override
  late final jni.JObjType<Task<$TResult>> $type = type(TResult);

  final jni.JObjType<$TResult> TResult;

  Task.fromReference(
    this.TResult,
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'com/google/android/gms/tasks/Task');

  /// The type which includes information such as the signature of this class.
  static $TaskType<$TResult> type<$TResult extends jni.JObject>(
    jni.JObjType<$TResult> TResult,
  ) {
    return $TaskType(
      TResult,
    );
  }

  static final _id_addOnCanceledListener = _class.instanceMethodId(
    r'addOnCanceledListener',
    r'(Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCanceledListener = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCanceledListener(com.google.android.gms.tasks.OnCanceledListener onCanceledListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCanceledListener(
    oncanceledlistener_.OnCanceledListener onCanceledListener,
  ) {
    return _addOnCanceledListener(
            reference.pointer,
            _id_addOnCanceledListener as jni.JMethodIDPtr,
            onCanceledListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnCanceledListener1 = _class.instanceMethodId(
    r'addOnCanceledListener',
    r'(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCanceledListener1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCanceledListener(android.app.Activity activity, com.google.android.gms.tasks.OnCanceledListener onCanceledListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCanceledListener1(
    activity_.Activity activity,
    oncanceledlistener_.OnCanceledListener onCanceledListener,
  ) {
    return _addOnCanceledListener1(
            reference.pointer,
            _id_addOnCanceledListener1 as jni.JMethodIDPtr,
            activity.reference.pointer,
            onCanceledListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnCanceledListener2 = _class.instanceMethodId(
    r'addOnCanceledListener',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCanceledListener2 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCanceledListener(java.util.concurrent.Executor executor, com.google.android.gms.tasks.OnCanceledListener onCanceledListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCanceledListener2(
    executor_.Executor executor,
    oncanceledlistener_.OnCanceledListener onCanceledListener,
  ) {
    return _addOnCanceledListener2(
            reference.pointer,
            _id_addOnCanceledListener2 as jni.JMethodIDPtr,
            executor.reference.pointer,
            onCanceledListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnCompleteListener = _class.instanceMethodId(
    r'addOnCompleteListener',
    r'(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCompleteListener = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCompleteListener(com.google.android.gms.tasks.OnCompleteListener onCompleteListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCompleteListener(
    oncompletelistener_.OnCompleteListener<$TResult> onCompleteListener,
  ) {
    return _addOnCompleteListener(
            reference.pointer,
            _id_addOnCompleteListener as jni.JMethodIDPtr,
            onCompleteListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnCompleteListener1 = _class.instanceMethodId(
    r'addOnCompleteListener',
    r'(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCompleteListener1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCompleteListener(android.app.Activity activity, com.google.android.gms.tasks.OnCompleteListener onCompleteListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCompleteListener1(
    activity_.Activity activity,
    oncompletelistener_.OnCompleteListener<$TResult> onCompleteListener,
  ) {
    return _addOnCompleteListener1(
            reference.pointer,
            _id_addOnCompleteListener1 as jni.JMethodIDPtr,
            activity.reference.pointer,
            onCompleteListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnCompleteListener2 = _class.instanceMethodId(
    r'addOnCompleteListener',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnCompleteListener2 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task addOnCompleteListener(java.util.concurrent.Executor executor, com.google.android.gms.tasks.OnCompleteListener onCompleteListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnCompleteListener2(
    executor_.Executor executor,
    oncompletelistener_.OnCompleteListener<$TResult> onCompleteListener,
  ) {
    return _addOnCompleteListener2(
            reference.pointer,
            _id_addOnCompleteListener2 as jni.JMethodIDPtr,
            executor.reference.pointer,
            onCompleteListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnFailureListener = _class.instanceMethodId(
    r'addOnFailureListener',
    r'(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnFailureListener = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnFailureListener(com.google.android.gms.tasks.OnFailureListener onFailureListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnFailureListener(
    onfailurelistener_.OnFailureListener onFailureListener,
  ) {
    return _addOnFailureListener(
            reference.pointer,
            _id_addOnFailureListener as jni.JMethodIDPtr,
            onFailureListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnFailureListener1 = _class.instanceMethodId(
    r'addOnFailureListener',
    r'(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnFailureListener1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnFailureListener(android.app.Activity activity, com.google.android.gms.tasks.OnFailureListener onFailureListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnFailureListener1(
    activity_.Activity activity,
    onfailurelistener_.OnFailureListener onFailureListener,
  ) {
    return _addOnFailureListener1(
            reference.pointer,
            _id_addOnFailureListener1 as jni.JMethodIDPtr,
            activity.reference.pointer,
            onFailureListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnFailureListener2 = _class.instanceMethodId(
    r'addOnFailureListener',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnFailureListener2 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnFailureListener(java.util.concurrent.Executor executor, com.google.android.gms.tasks.OnFailureListener onFailureListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnFailureListener2(
    executor_.Executor executor,
    onfailurelistener_.OnFailureListener onFailureListener,
  ) {
    return _addOnFailureListener2(
            reference.pointer,
            _id_addOnFailureListener2 as jni.JMethodIDPtr,
            executor.reference.pointer,
            onFailureListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnSuccessListener = _class.instanceMethodId(
    r'addOnSuccessListener',
    r'(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnSuccessListener = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnSuccessListener(com.google.android.gms.tasks.OnSuccessListener onSuccessListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnSuccessListener(
    onsuccesslistener_.OnSuccessListener<$TResult> onSuccessListener,
  ) {
    return _addOnSuccessListener(
            reference.pointer,
            _id_addOnSuccessListener as jni.JMethodIDPtr,
            onSuccessListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnSuccessListener1 = _class.instanceMethodId(
    r'addOnSuccessListener',
    r'(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnSuccessListener1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnSuccessListener(android.app.Activity activity, com.google.android.gms.tasks.OnSuccessListener onSuccessListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnSuccessListener1(
    activity_.Activity activity,
    onsuccesslistener_.OnSuccessListener<$TResult> onSuccessListener,
  ) {
    return _addOnSuccessListener1(
            reference.pointer,
            _id_addOnSuccessListener1 as jni.JMethodIDPtr,
            activity.reference.pointer,
            onSuccessListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_addOnSuccessListener2 = _class.instanceMethodId(
    r'addOnSuccessListener',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _addOnSuccessListener2 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract com.google.android.gms.tasks.Task addOnSuccessListener(java.util.concurrent.Executor executor, com.google.android.gms.tasks.OnSuccessListener onSuccessListener)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TResult> addOnSuccessListener2(
    executor_.Executor executor,
    onsuccesslistener_.OnSuccessListener<$TResult> onSuccessListener,
  ) {
    return _addOnSuccessListener2(
            reference.pointer,
            _id_addOnSuccessListener2 as jni.JMethodIDPtr,
            executor.reference.pointer,
            onSuccessListener.reference.pointer)
        .object($TaskType(TResult));
  }

  static final _id_continueWith = _class.instanceMethodId(
    r'continueWith',
    r'(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _continueWith = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task continueWith(com.google.android.gms.tasks.Continuation continuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      continueWith<$TContinuationResult extends jni.JObject>(
    jni.JObject continuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _continueWith(
            reference.pointer,
            _id_continueWith as jni.JMethodIDPtr,
            continuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_continueWith1 = _class.instanceMethodId(
    r'continueWith',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _continueWith1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task continueWith(java.util.concurrent.Executor executor, com.google.android.gms.tasks.Continuation continuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      continueWith1<$TContinuationResult extends jni.JObject>(
    executor_.Executor executor,
    jni.JObject continuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _continueWith1(
            reference.pointer,
            _id_continueWith1 as jni.JMethodIDPtr,
            executor.reference.pointer,
            continuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_continueWithTask = _class.instanceMethodId(
    r'continueWithTask',
    r'(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _continueWithTask = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task continueWithTask(com.google.android.gms.tasks.Continuation continuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      continueWithTask<$TContinuationResult extends jni.JObject>(
    jni.JObject continuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _continueWithTask(
            reference.pointer,
            _id_continueWithTask as jni.JMethodIDPtr,
            continuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_continueWithTask1 = _class.instanceMethodId(
    r'continueWithTask',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _continueWithTask1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task continueWithTask(java.util.concurrent.Executor executor, com.google.android.gms.tasks.Continuation continuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      continueWithTask1<$TContinuationResult extends jni.JObject>(
    executor_.Executor executor,
    jni.JObject continuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _continueWithTask1(
            reference.pointer,
            _id_continueWithTask1 as jni.JMethodIDPtr,
            executor.reference.pointer,
            continuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_onSuccessTask = _class.instanceMethodId(
    r'onSuccessTask',
    r'(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _onSuccessTask = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task onSuccessTask(com.google.android.gms.tasks.SuccessContinuation successContinuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      onSuccessTask<$TContinuationResult extends jni.JObject>(
    jni.JObject successContinuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _onSuccessTask(
            reference.pointer,
            _id_onSuccessTask as jni.JMethodIDPtr,
            successContinuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_onSuccessTask1 = _class.instanceMethodId(
    r'onSuccessTask',
    r'(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;',
  );

  static final _onSuccessTask1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public com.google.android.gms.tasks.Task onSuccessTask(java.util.concurrent.Executor executor, com.google.android.gms.tasks.SuccessContinuation successContinuation)
  /// The returned object must be released after use, by calling the [release] method.
  Task<$TContinuationResult>
      onSuccessTask1<$TContinuationResult extends jni.JObject>(
    executor_.Executor executor,
    jni.JObject successContinuation, {
    required jni.JObjType<$TContinuationResult> TContinuationResult,
  }) {
    return _onSuccessTask1(
            reference.pointer,
            _id_onSuccessTask1 as jni.JMethodIDPtr,
            executor.reference.pointer,
            successContinuation.reference.pointer)
        .object($TaskType(TContinuationResult));
  }

  static final _id_getException = _class.instanceMethodId(
    r'getException',
    r'()Ljava/lang/Exception;',
  );

  static final _getException = ProtectedJniExtensions.lookup<
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

  /// from: public abstract java.lang.Exception getException()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getException() {
    return _getException(
            reference.pointer, _id_getException as jni.JMethodIDPtr)
        .object(const jni.JObjectType());
  }

  static final _id_getResult = _class.instanceMethodId(
    r'getResult',
    r'()Ljava/lang/Object;',
  );

  static final _getResult = ProtectedJniExtensions.lookup<
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

  /// from: public abstract TResult getResult()
  /// The returned object must be released after use, by calling the [release] method.
  $TResult getResult() {
    return _getResult(reference.pointer, _id_getResult as jni.JMethodIDPtr)
        .object(TResult);
  }

  static final _id_getResult1 = _class.instanceMethodId(
    r'getResult',
    r'(Ljava/lang/Class;)Ljava/lang/Object;',
  );

  static final _getResult1 = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: public abstract TResult getResult(java.lang.Class class)
  /// The returned object must be released after use, by calling the [release] method.
  $TResult getResult1<$X extends jni.JObject>(
    jni.JObject class0, {
    required jni.JObjType<$X> X,
  }) {
    return _getResult1(reference.pointer, _id_getResult1 as jni.JMethodIDPtr,
            class0.reference.pointer)
        .object(TResult);
  }

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
  factory Task({
    required jni.JObjType<$TResult> TResult,
  }) {
    return Task.fromReference(
        TResult,
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr)
            .reference);
  }

  static final _id_isCanceled = _class.instanceMethodId(
    r'isCanceled',
    r'()Z',
  );

  static final _isCanceled = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallBooleanMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public abstract boolean isCanceled()
  bool isCanceled() {
    return _isCanceled(reference.pointer, _id_isCanceled as jni.JMethodIDPtr)
        .boolean;
  }

  static final _id_isComplete = _class.instanceMethodId(
    r'isComplete',
    r'()Z',
  );

  static final _isComplete = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallBooleanMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public abstract boolean isComplete()
  bool isComplete() {
    return _isComplete(reference.pointer, _id_isComplete as jni.JMethodIDPtr)
        .boolean;
  }

  static final _id_isSuccessful = _class.instanceMethodId(
    r'isSuccessful',
    r'()Z',
  );

  static final _isSuccessful = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                ffi.Pointer<ffi.Void>,
                jni.JMethodIDPtr,
              )>>('globalEnv_CallBooleanMethod')
      .asFunction<
          jni.JniResult Function(
            ffi.Pointer<ffi.Void>,
            jni.JMethodIDPtr,
          )>();

  /// from: public abstract boolean isSuccessful()
  bool isSuccessful() {
    return _isSuccessful(
            reference.pointer, _id_isSuccessful as jni.JMethodIDPtr)
        .boolean;
  }
}

final class $TaskType<$TResult extends jni.JObject>
    extends jni.JObjType<Task<$TResult>> {
  final jni.JObjType<$TResult> TResult;

  const $TaskType(
    this.TResult,
  );

  @override
  String get signature => r'Lcom/google/android/gms/tasks/Task;';

  @override
  Task<$TResult> fromReference(jni.JReference reference) =>
      Task.fromReference(TResult, reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => Object.hash($TaskType, TResult);

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($TaskType<$TResult>) &&
        other is $TaskType<$TResult> &&
        TResult == other.TResult;
  }
}
