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

import 'OutputResults.dart' as outputresults_;

/// from: androidx.camera.video.VideoRecordEvent$Finalize$VideoRecordError
class VideoRecordEvent_Finalize_VideoRecordError extends jni.JObject {
  @override
  late final jni.JObjType<VideoRecordEvent_Finalize_VideoRecordError> $type =
      type;

  VideoRecordEvent_Finalize_VideoRecordError.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'androidx/camera/video/VideoRecordEvent$Finalize$VideoRecordError');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_Finalize_VideoRecordErrorType();

  /// Maps a specific port to the implemented interface.
  static final Map<int, $VideoRecordEvent_Finalize_VideoRecordErrorImpl>
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

  factory VideoRecordEvent_Finalize_VideoRecordError.implement(
    $VideoRecordEvent_Finalize_VideoRecordErrorImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = VideoRecordEvent_Finalize_VideoRecordError.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'androidx.camera.video.VideoRecordEvent$Finalize$VideoRecordError',
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

abstract interface class $VideoRecordEvent_Finalize_VideoRecordErrorImpl {
  factory $VideoRecordEvent_Finalize_VideoRecordErrorImpl() =
      _$VideoRecordEvent_Finalize_VideoRecordErrorImpl;
}

class _$VideoRecordEvent_Finalize_VideoRecordErrorImpl
    implements $VideoRecordEvent_Finalize_VideoRecordErrorImpl {
  _$VideoRecordEvent_Finalize_VideoRecordErrorImpl();
}

final class $VideoRecordEvent_Finalize_VideoRecordErrorType
    extends jni.JObjType<VideoRecordEvent_Finalize_VideoRecordError> {
  const $VideoRecordEvent_Finalize_VideoRecordErrorType();

  @override
  String get signature =>
      r'Landroidx/camera/video/VideoRecordEvent$Finalize$VideoRecordError;';

  @override
  VideoRecordEvent_Finalize_VideoRecordError fromReference(
          jni.JReference reference) =>
      VideoRecordEvent_Finalize_VideoRecordError.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode =>
      ($VideoRecordEvent_Finalize_VideoRecordErrorType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType ==
            ($VideoRecordEvent_Finalize_VideoRecordErrorType) &&
        other is $VideoRecordEvent_Finalize_VideoRecordErrorType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent$Finalize
class VideoRecordEvent_Finalize extends VideoRecordEvent {
  @override
  late final jni.JObjType<VideoRecordEvent_Finalize> $type = type;

  VideoRecordEvent_Finalize.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent$Finalize');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_FinalizeType();

  /// from: static public final int ERROR_NONE
  static const ERROR_NONE = 0;

  /// from: static public final int ERROR_UNKNOWN
  static const ERROR_UNKNOWN = 1;

  /// from: static public final int ERROR_FILE_SIZE_LIMIT_REACHED
  static const ERROR_FILE_SIZE_LIMIT_REACHED = 2;

  /// from: static public final int ERROR_INSUFFICIENT_STORAGE
  static const ERROR_INSUFFICIENT_STORAGE = 3;

  /// from: static public final int ERROR_SOURCE_INACTIVE
  static const ERROR_SOURCE_INACTIVE = 4;

  /// from: static public final int ERROR_INVALID_OUTPUT_OPTIONS
  static const ERROR_INVALID_OUTPUT_OPTIONS = 5;

  /// from: static public final int ERROR_ENCODING_FAILED
  static const ERROR_ENCODING_FAILED = 6;

  /// from: static public final int ERROR_RECORDER_ERROR
  static const ERROR_RECORDER_ERROR = 7;

  /// from: static public final int ERROR_NO_VALID_DATA
  static const ERROR_NO_VALID_DATA = 8;

  /// from: static public final int ERROR_DURATION_LIMIT_REACHED
  static const ERROR_DURATION_LIMIT_REACHED = 9;

  /// from: static public final int ERROR_RECORDING_GARBAGE_COLLECTED
  static const ERROR_RECORDING_GARBAGE_COLLECTED = 10;
  static final _id_getOutputResults = _class.instanceMethodId(
    r'getOutputResults',
    r'()Landroidx/camera/video/OutputResults;',
  );

  static final _getOutputResults = ProtectedJniExtensions.lookup<
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

  /// from: public androidx.camera.video.OutputResults getOutputResults()
  /// The returned object must be released after use, by calling the [release] method.
  outputresults_.OutputResults getOutputResults() {
    return _getOutputResults(
            reference.pointer, _id_getOutputResults as jni.JMethodIDPtr)
        .object(const outputresults_.$OutputResultsType());
  }

  static final _id_hasError = _class.instanceMethodId(
    r'hasError',
    r'()Z',
  );

  static final _hasError = ProtectedJniExtensions.lookup<
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

  /// from: public boolean hasError()
  bool hasError() {
    return _hasError(reference.pointer, _id_hasError as jni.JMethodIDPtr)
        .boolean;
  }

  static final _id_getError = _class.instanceMethodId(
    r'getError',
    r'()I',
  );

  static final _getError = ProtectedJniExtensions.lookup<
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

  /// from: public int getError()
  int getError() {
    return _getError(reference.pointer, _id_getError as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_getCause = _class.instanceMethodId(
    r'getCause',
    r'()Ljava/lang/Throwable;',
  );

  static final _getCause = ProtectedJniExtensions.lookup<
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

  /// from: public java.lang.Throwable getCause()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getCause() {
    return _getCause(reference.pointer, _id_getCause as jni.JMethodIDPtr)
        .object(const jni.JObjectType());
  }
}

final class $VideoRecordEvent_FinalizeType
    extends jni.JObjType<VideoRecordEvent_Finalize> {
  const $VideoRecordEvent_FinalizeType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent$Finalize;';

  @override
  VideoRecordEvent_Finalize fromReference(jni.JReference reference) =>
      VideoRecordEvent_Finalize.fromReference(reference);

  @override
  jni.JObjType get superType => const $VideoRecordEventType();

  @override
  final superCount = 2;

  @override
  int get hashCode => ($VideoRecordEvent_FinalizeType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEvent_FinalizeType) &&
        other is $VideoRecordEvent_FinalizeType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent$Pause
class VideoRecordEvent_Pause extends VideoRecordEvent {
  @override
  late final jni.JObjType<VideoRecordEvent_Pause> $type = type;

  VideoRecordEvent_Pause.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent$Pause');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_PauseType();
}

final class $VideoRecordEvent_PauseType
    extends jni.JObjType<VideoRecordEvent_Pause> {
  const $VideoRecordEvent_PauseType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent$Pause;';

  @override
  VideoRecordEvent_Pause fromReference(jni.JReference reference) =>
      VideoRecordEvent_Pause.fromReference(reference);

  @override
  jni.JObjType get superType => const $VideoRecordEventType();

  @override
  final superCount = 2;

  @override
  int get hashCode => ($VideoRecordEvent_PauseType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEvent_PauseType) &&
        other is $VideoRecordEvent_PauseType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent$Resume
class VideoRecordEvent_Resume extends VideoRecordEvent {
  @override
  late final jni.JObjType<VideoRecordEvent_Resume> $type = type;

  VideoRecordEvent_Resume.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent$Resume');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_ResumeType();
}

final class $VideoRecordEvent_ResumeType
    extends jni.JObjType<VideoRecordEvent_Resume> {
  const $VideoRecordEvent_ResumeType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent$Resume;';

  @override
  VideoRecordEvent_Resume fromReference(jni.JReference reference) =>
      VideoRecordEvent_Resume.fromReference(reference);

  @override
  jni.JObjType get superType => const $VideoRecordEventType();

  @override
  final superCount = 2;

  @override
  int get hashCode => ($VideoRecordEvent_ResumeType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEvent_ResumeType) &&
        other is $VideoRecordEvent_ResumeType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent$Start
class VideoRecordEvent_Start extends VideoRecordEvent {
  @override
  late final jni.JObjType<VideoRecordEvent_Start> $type = type;

  VideoRecordEvent_Start.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent$Start');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_StartType();
}

final class $VideoRecordEvent_StartType
    extends jni.JObjType<VideoRecordEvent_Start> {
  const $VideoRecordEvent_StartType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent$Start;';

  @override
  VideoRecordEvent_Start fromReference(jni.JReference reference) =>
      VideoRecordEvent_Start.fromReference(reference);

  @override
  jni.JObjType get superType => const $VideoRecordEventType();

  @override
  final superCount = 2;

  @override
  int get hashCode => ($VideoRecordEvent_StartType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEvent_StartType) &&
        other is $VideoRecordEvent_StartType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent$Status
class VideoRecordEvent_Status extends VideoRecordEvent {
  @override
  late final jni.JObjType<VideoRecordEvent_Status> $type = type;

  VideoRecordEvent_Status.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent$Status');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEvent_StatusType();
}

final class $VideoRecordEvent_StatusType
    extends jni.JObjType<VideoRecordEvent_Status> {
  const $VideoRecordEvent_StatusType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent$Status;';

  @override
  VideoRecordEvent_Status fromReference(jni.JReference reference) =>
      VideoRecordEvent_Status.fromReference(reference);

  @override
  jni.JObjType get superType => const $VideoRecordEventType();

  @override
  final superCount = 2;

  @override
  int get hashCode => ($VideoRecordEvent_StatusType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEvent_StatusType) &&
        other is $VideoRecordEvent_StatusType;
  }
}

/// from: androidx.camera.video.VideoRecordEvent
class VideoRecordEvent extends jni.JObject {
  @override
  late final jni.JObjType<VideoRecordEvent> $type = type;

  VideoRecordEvent.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/video/VideoRecordEvent');

  /// The type which includes information such as the signature of this class.
  static const type = $VideoRecordEventType();
  static final _id_getRecordingStats = _class.instanceMethodId(
    r'getRecordingStats',
    r'()Landroidx/camera/video/RecordingStats;',
  );

  static final _getRecordingStats = ProtectedJniExtensions.lookup<
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

  /// from: public androidx.camera.video.RecordingStats getRecordingStats()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getRecordingStats() {
    return _getRecordingStats(
            reference.pointer, _id_getRecordingStats as jni.JMethodIDPtr)
        .object(const jni.JObjectType());
  }

  static final _id_getOutputOptions = _class.instanceMethodId(
    r'getOutputOptions',
    r'()Landroidx/camera/video/OutputOptions;',
  );

  static final _getOutputOptions = ProtectedJniExtensions.lookup<
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

  /// from: public androidx.camera.video.OutputOptions getOutputOptions()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getOutputOptions() {
    return _getOutputOptions(
            reference.pointer, _id_getOutputOptions as jni.JMethodIDPtr)
        .object(const jni.JObjectType());
  }
}

final class $VideoRecordEventType extends jni.JObjType<VideoRecordEvent> {
  const $VideoRecordEventType();

  @override
  String get signature => r'Landroidx/camera/video/VideoRecordEvent;';

  @override
  VideoRecordEvent fromReference(jni.JReference reference) =>
      VideoRecordEvent.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($VideoRecordEventType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($VideoRecordEventType) &&
        other is $VideoRecordEventType;
  }
}
