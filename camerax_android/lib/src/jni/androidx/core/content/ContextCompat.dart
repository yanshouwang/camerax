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

import '../../../android/content/Context.dart' as context_;

import '../../../java/util/concurrent/Executor.dart' as executor_;

/// from: androidx.core.content.ContextCompat$RegisterReceiverFlags
class ContextCompat_RegisterReceiverFlags extends jni.JObject {
  @override
  late final jni.JObjType<ContextCompat_RegisterReceiverFlags> $type = type;

  ContextCompat_RegisterReceiverFlags.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'androidx/core/content/ContextCompat$RegisterReceiverFlags');

  /// The type which includes information such as the signature of this class.
  static const type = $ContextCompat_RegisterReceiverFlagsType();

  /// Maps a specific port to the implemented interface.
  static final Map<int, $ContextCompat_RegisterReceiverFlagsImpl> _$impls = {};
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

  factory ContextCompat_RegisterReceiverFlags.implement(
    $ContextCompat_RegisterReceiverFlagsImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = ContextCompat_RegisterReceiverFlags.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'androidx.core.content.ContextCompat$RegisterReceiverFlags',
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

abstract interface class $ContextCompat_RegisterReceiverFlagsImpl {
  factory $ContextCompat_RegisterReceiverFlagsImpl() =
      _$ContextCompat_RegisterReceiverFlagsImpl;
}

class _$ContextCompat_RegisterReceiverFlagsImpl
    implements $ContextCompat_RegisterReceiverFlagsImpl {
  _$ContextCompat_RegisterReceiverFlagsImpl();
}

final class $ContextCompat_RegisterReceiverFlagsType
    extends jni.JObjType<ContextCompat_RegisterReceiverFlags> {
  const $ContextCompat_RegisterReceiverFlagsType();

  @override
  String get signature =>
      r'Landroidx/core/content/ContextCompat$RegisterReceiverFlags;';

  @override
  ContextCompat_RegisterReceiverFlags fromReference(jni.JReference reference) =>
      ContextCompat_RegisterReceiverFlags.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($ContextCompat_RegisterReceiverFlagsType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($ContextCompat_RegisterReceiverFlagsType) &&
        other is $ContextCompat_RegisterReceiverFlagsType;
  }
}

/// from: androidx.core.content.ContextCompat
class ContextCompat extends jni.JObject {
  @override
  late final jni.JObjType<ContextCompat> $type = type;

  ContextCompat.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/core/content/ContextCompat');

  /// The type which includes information such as the signature of this class.
  static const type = $ContextCompatType();

  /// from: static public final int RECEIVER_VISIBLE_TO_INSTANT_APPS
  static const RECEIVER_VISIBLE_TO_INSTANT_APPS = 1;

  /// from: static public final int RECEIVER_EXPORTED
  static const RECEIVER_EXPORTED = 2;

  /// from: static public final int RECEIVER_NOT_EXPORTED
  static const RECEIVER_NOT_EXPORTED = 4;
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

  /// from: protected void <init>()
  /// The returned object must be released after use, by calling the [release] method.
  factory ContextCompat() {
    return ContextCompat.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr)
            .reference);
  }

  static final _id_startActivities = _class.staticMethodId(
    r'startActivities',
    r'(Landroid/content/Context;[Landroid/content/Intent;)Z',
  );

  static final _startActivities = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticBooleanMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public boolean startActivities(android.content.Context context, android.content.Intent[] intents)
  static bool startActivities(
    context_.Context context,
    jni.JArray<jni.JObject> intents,
  ) {
    return _startActivities(
            _class.reference.pointer,
            _id_startActivities as jni.JMethodIDPtr,
            context.reference.pointer,
            intents.reference.pointer)
        .boolean;
  }

  static final _id_startActivities1 = _class.staticMethodId(
    r'startActivities',
    r'(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)Z',
  );

  static final _startActivities1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticBooleanMethod')
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>,
              jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public boolean startActivities(android.content.Context context, android.content.Intent[] intents, android.os.Bundle bundle)
  static bool startActivities1(
    context_.Context context,
    jni.JArray<jni.JObject> intents,
    jni.JObject bundle,
  ) {
    return _startActivities1(
            _class.reference.pointer,
            _id_startActivities1 as jni.JMethodIDPtr,
            context.reference.pointer,
            intents.reference.pointer,
            bundle.reference.pointer)
        .boolean;
  }

  static final _id_startActivity = _class.staticMethodId(
    r'startActivity',
    r'(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V',
  );

  static final _startActivity = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JThrowablePtr Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(
              ffi.Pointer<ffi.Void>,
              jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public void startActivity(android.content.Context context, android.content.Intent intent, android.os.Bundle bundle)
  static void startActivity(
    context_.Context context,
    jni.JObject intent,
    jni.JObject bundle,
  ) {
    _startActivity(
            _class.reference.pointer,
            _id_startActivity as jni.JMethodIDPtr,
            context.reference.pointer,
            intent.reference.pointer,
            bundle.reference.pointer)
        .check();
  }

  static final _id_getDataDir = _class.staticMethodId(
    r'getDataDir',
    r'(Landroid/content/Context;)Ljava/io/File;',
  );

  static final _getDataDir = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File getDataDir(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getDataDir(
    context_.Context context,
  ) {
    return _getDataDir(_class.reference.pointer,
            _id_getDataDir as jni.JMethodIDPtr, context.reference.pointer)
        .object(const jni.JObjectType());
  }

  static final _id_getObbDirs = _class.staticMethodId(
    r'getObbDirs',
    r'(Landroid/content/Context;)[Ljava/io/File;',
  );

  static final _getObbDirs = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File[] getObbDirs(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JArray<jni.JObject> getObbDirs(
    context_.Context context,
  ) {
    return _getObbDirs(_class.reference.pointer,
            _id_getObbDirs as jni.JMethodIDPtr, context.reference.pointer)
        .object(const jni.JArrayType(jni.JObjectType()));
  }

  static final _id_getExternalFilesDirs = _class.staticMethodId(
    r'getExternalFilesDirs',
    r'(Landroid/content/Context;Ljava/lang/String;)[Ljava/io/File;',
  );

  static final _getExternalFilesDirs = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File[] getExternalFilesDirs(android.content.Context context, java.lang.String string)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JArray<jni.JObject> getExternalFilesDirs(
    context_.Context context,
    jni.JString string,
  ) {
    return _getExternalFilesDirs(
            _class.reference.pointer,
            _id_getExternalFilesDirs as jni.JMethodIDPtr,
            context.reference.pointer,
            string.reference.pointer)
        .object(const jni.JArrayType(jni.JObjectType()));
  }

  static final _id_getExternalCacheDirs = _class.staticMethodId(
    r'getExternalCacheDirs',
    r'(Landroid/content/Context;)[Ljava/io/File;',
  );

  static final _getExternalCacheDirs = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File[] getExternalCacheDirs(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JArray<jni.JObject> getExternalCacheDirs(
    context_.Context context,
  ) {
    return _getExternalCacheDirs(
            _class.reference.pointer,
            _id_getExternalCacheDirs as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const jni.JArrayType(jni.JObjectType()));
  }

  static final _id_getDrawable = _class.staticMethodId(
    r'getDrawable',
    r'(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;',
  );

  static final _getDrawable = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>, $Int32)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, int)>();

  /// from: static public android.graphics.drawable.Drawable getDrawable(android.content.Context context, int i)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getDrawable(
    context_.Context context,
    int i,
  ) {
    return _getDrawable(_class.reference.pointer,
            _id_getDrawable as jni.JMethodIDPtr, context.reference.pointer, i)
        .object(const jni.JObjectType());
  }

  static final _id_getColorStateList = _class.staticMethodId(
    r'getColorStateList',
    r'(Landroid/content/Context;I)Landroid/content/res/ColorStateList;',
  );

  static final _getColorStateList = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>, $Int32)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, int)>();

  /// from: static public android.content.res.ColorStateList getColorStateList(android.content.Context context, int i)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getColorStateList(
    context_.Context context,
    int i,
  ) {
    return _getColorStateList(
            _class.reference.pointer,
            _id_getColorStateList as jni.JMethodIDPtr,
            context.reference.pointer,
            i)
        .object(const jni.JObjectType());
  }

  static final _id_getColor = _class.staticMethodId(
    r'getColor',
    r'(Landroid/content/Context;I)I',
  );

  static final _getColor = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>, $Int32)>)>>(
          'globalEnv_CallStaticIntMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, int)>();

  /// from: static public int getColor(android.content.Context context, int i)
  static int getColor(
    context_.Context context,
    int i,
  ) {
    return _getColor(_class.reference.pointer, _id_getColor as jni.JMethodIDPtr,
            context.reference.pointer, i)
        .integer;
  }

  static final _id_checkSelfPermission = _class.staticMethodId(
    r'checkSelfPermission',
    r'(Landroid/content/Context;Ljava/lang/String;)I',
  );

  static final _checkSelfPermission = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticIntMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public int checkSelfPermission(android.content.Context context, java.lang.String string)
  static int checkSelfPermission(
    context_.Context context,
    jni.JString string,
  ) {
    return _checkSelfPermission(
            _class.reference.pointer,
            _id_checkSelfPermission as jni.JMethodIDPtr,
            context.reference.pointer,
            string.reference.pointer)
        .integer;
  }

  static final _id_getNoBackupFilesDir = _class.staticMethodId(
    r'getNoBackupFilesDir',
    r'(Landroid/content/Context;)Ljava/io/File;',
  );

  static final _getNoBackupFilesDir = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File getNoBackupFilesDir(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getNoBackupFilesDir(
    context_.Context context,
  ) {
    return _getNoBackupFilesDir(
            _class.reference.pointer,
            _id_getNoBackupFilesDir as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const jni.JObjectType());
  }

  static final _id_getCodeCacheDir = _class.staticMethodId(
    r'getCodeCacheDir',
    r'(Landroid/content/Context;)Ljava/io/File;',
  );

  static final _getCodeCacheDir = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.io.File getCodeCacheDir(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getCodeCacheDir(
    context_.Context context,
  ) {
    return _getCodeCacheDir(_class.reference.pointer,
            _id_getCodeCacheDir as jni.JMethodIDPtr, context.reference.pointer)
        .object(const jni.JObjectType());
  }

  static final _id_createDeviceProtectedStorageContext = _class.staticMethodId(
    r'createDeviceProtectedStorageContext',
    r'(Landroid/content/Context;)Landroid/content/Context;',
  );

  static final _createDeviceProtectedStorageContext =
      ProtectedJniExtensions.lookup<
                  ffi.NativeFunction<
                      jni.JniResult Function(
                          ffi.Pointer<ffi.Void>,
                          jni.JMethodIDPtr,
                          ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
              'globalEnv_CallStaticObjectMethod')
          .asFunction<
              jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
                  ffi.Pointer<ffi.Void>)>();

  /// from: static public android.content.Context createDeviceProtectedStorageContext(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static context_.Context createDeviceProtectedStorageContext(
    context_.Context context,
  ) {
    return _createDeviceProtectedStorageContext(
            _class.reference.pointer,
            _id_createDeviceProtectedStorageContext as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const context_.$ContextType());
  }

  static final _id_isDeviceProtectedStorage = _class.staticMethodId(
    r'isDeviceProtectedStorage',
    r'(Landroid/content/Context;)Z',
  );

  static final _isDeviceProtectedStorage = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticBooleanMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public boolean isDeviceProtectedStorage(android.content.Context context)
  static bool isDeviceProtectedStorage(
    context_.Context context,
  ) {
    return _isDeviceProtectedStorage(
            _class.reference.pointer,
            _id_isDeviceProtectedStorage as jni.JMethodIDPtr,
            context.reference.pointer)
        .boolean;
  }

  static final _id_getMainExecutor = _class.staticMethodId(
    r'getMainExecutor',
    r'(Landroid/content/Context;)Ljava/util/concurrent/Executor;',
  );

  static final _getMainExecutor = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.util.concurrent.Executor getMainExecutor(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static executor_.Executor getMainExecutor(
    context_.Context context,
  ) {
    return _getMainExecutor(_class.reference.pointer,
            _id_getMainExecutor as jni.JMethodIDPtr, context.reference.pointer)
        .object(const executor_.$ExecutorType());
  }

  static final _id_startForegroundService = _class.staticMethodId(
    r'startForegroundService',
    r'(Landroid/content/Context;Landroid/content/Intent;)V',
  );

  static final _startForegroundService = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JThrowablePtr Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticVoidMethod')
      .asFunction<
          jni.JThrowablePtr Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public void startForegroundService(android.content.Context context, android.content.Intent intent)
  static void startForegroundService(
    context_.Context context,
    jni.JObject intent,
  ) {
    _startForegroundService(
            _class.reference.pointer,
            _id_startForegroundService as jni.JMethodIDPtr,
            context.reference.pointer,
            intent.reference.pointer)
        .check();
  }

  static final _id_getDisplayOrDefault = _class.staticMethodId(
    r'getDisplayOrDefault',
    r'(Landroid/content/Context;)Landroid/view/Display;',
  );

  static final _getDisplayOrDefault = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public android.view.Display getDisplayOrDefault(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject getDisplayOrDefault(
    context_.Context context,
  ) {
    return _getDisplayOrDefault(
            _class.reference.pointer,
            _id_getDisplayOrDefault as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const jni.JObjectType());
  }

  static final _id_getSystemService = _class.staticMethodId(
    r'getSystemService',
    r'(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;',
  );

  static final _getSystemService = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public T getSystemService(android.content.Context context, java.lang.Class class)
  /// The returned object must be released after use, by calling the [release] method.
  static $T getSystemService<$T extends jni.JObject>(
    context_.Context context,
    jni.JObject class0, {
    required jni.JObjType<$T> T,
  }) {
    return _getSystemService(
            _class.reference.pointer,
            _id_getSystemService as jni.JMethodIDPtr,
            context.reference.pointer,
            class0.reference.pointer)
        .object(T);
  }

  static final _id_registerReceiver = _class.staticMethodId(
    r'registerReceiver',
    r'(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;',
  );

  static final _registerReceiver = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        $Int32
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>,
              jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              int)>();

  /// from: static public android.content.Intent registerReceiver(android.content.Context context, android.content.BroadcastReceiver broadcastReceiver, android.content.IntentFilter intentFilter, int i)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject registerReceiver(
    context_.Context context,
    jni.JObject broadcastReceiver,
    jni.JObject intentFilter,
    int i,
  ) {
    return _registerReceiver(
            _class.reference.pointer,
            _id_registerReceiver as jni.JMethodIDPtr,
            context.reference.pointer,
            broadcastReceiver.reference.pointer,
            intentFilter.reference.pointer,
            i)
        .object(const jni.JObjectType());
  }

  static final _id_registerReceiver1 = _class.staticMethodId(
    r'registerReceiver',
    r'(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;I)Landroid/content/Intent;',
  );

  static final _registerReceiver1 = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>,
                        $Int32
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>,
              jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>,
              int)>();

  /// from: static public android.content.Intent registerReceiver(android.content.Context context, android.content.BroadcastReceiver broadcastReceiver, android.content.IntentFilter intentFilter, java.lang.String string, android.os.Handler handler, int i)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JObject registerReceiver1(
    context_.Context context,
    jni.JObject broadcastReceiver,
    jni.JObject intentFilter,
    jni.JString string,
    jni.JObject handler,
    int i,
  ) {
    return _registerReceiver1(
            _class.reference.pointer,
            _id_registerReceiver1 as jni.JMethodIDPtr,
            context.reference.pointer,
            broadcastReceiver.reference.pointer,
            intentFilter.reference.pointer,
            string.reference.pointer,
            handler.reference.pointer,
            i)
        .object(const jni.JObjectType());
  }

  static final _id_getSystemServiceName = _class.staticMethodId(
    r'getSystemServiceName',
    r'(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/String;',
  );

  static final _getSystemServiceName = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public java.lang.String getSystemServiceName(android.content.Context context, java.lang.Class class)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JString getSystemServiceName(
    context_.Context context,
    jni.JObject class0,
  ) {
    return _getSystemServiceName(
            _class.reference.pointer,
            _id_getSystemServiceName as jni.JMethodIDPtr,
            context.reference.pointer,
            class0.reference.pointer)
        .object(const jni.JStringType());
  }

  static final _id_getString = _class.staticMethodId(
    r'getString',
    r'(Landroid/content/Context;I)Ljava/lang/String;',
  );

  static final _getString = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>, $Int32)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, int)>();

  /// from: static public java.lang.String getString(android.content.Context context, int i)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JString getString(
    context_.Context context,
    int i,
  ) {
    return _getString(_class.reference.pointer,
            _id_getString as jni.JMethodIDPtr, context.reference.pointer, i)
        .object(const jni.JStringType());
  }

  static final _id_getContextForLanguage = _class.staticMethodId(
    r'getContextForLanguage',
    r'(Landroid/content/Context;)Landroid/content/Context;',
  );

  static final _getContextForLanguage = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public android.content.Context getContextForLanguage(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static context_.Context getContextForLanguage(
    context_.Context context,
  ) {
    return _getContextForLanguage(
            _class.reference.pointer,
            _id_getContextForLanguage as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const context_.$ContextType());
  }

  static final _id_getAttributionTag = _class.staticMethodId(
    r'getAttributionTag',
    r'(Landroid/content/Context;)Ljava/lang/String;',
  );

  static final _getAttributionTag = ProtectedJniExtensions.lookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>,
                      jni.JMethodIDPtr,
                      ffi.VarArgs<(ffi.Pointer<ffi.Void>,)>)>>(
          'globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>)>();

  /// from: static public java.lang.String getAttributionTag(android.content.Context context)
  /// The returned object must be released after use, by calling the [release] method.
  static jni.JString getAttributionTag(
    context_.Context context,
  ) {
    return _getAttributionTag(
            _class.reference.pointer,
            _id_getAttributionTag as jni.JMethodIDPtr,
            context.reference.pointer)
        .object(const jni.JStringType());
  }

  static final _id_createAttributionContext = _class.staticMethodId(
    r'createAttributionContext',
    r'(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;',
  );

  static final _createAttributionContext = ProtectedJniExtensions.lookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  jni.JMethodIDPtr,
                  ffi.VarArgs<
                      (
                        ffi.Pointer<ffi.Void>,
                        ffi.Pointer<ffi.Void>
                      )>)>>('globalEnv_CallStaticObjectMethod')
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, jni.JMethodIDPtr,
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: static public android.content.Context createAttributionContext(android.content.Context context, java.lang.String string)
  /// The returned object must be released after use, by calling the [release] method.
  static context_.Context createAttributionContext(
    context_.Context context,
    jni.JString string,
  ) {
    return _createAttributionContext(
            _class.reference.pointer,
            _id_createAttributionContext as jni.JMethodIDPtr,
            context.reference.pointer,
            string.reference.pointer)
        .object(const context_.$ContextType());
  }
}

final class $ContextCompatType extends jni.JObjType<ContextCompat> {
  const $ContextCompatType();

  @override
  String get signature => r'Landroidx/core/content/ContextCompat;';

  @override
  ContextCompat fromReference(jni.JReference reference) =>
      ContextCompat.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($ContextCompatType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($ContextCompatType) &&
        other is $ContextCompatType;
  }
}
