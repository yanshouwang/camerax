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

/// from: androidx.camera.core.DynamicRange$BitDepth
class DynamicRange_BitDepth extends jni.JObject {
  @override
  late final jni.JObjType<DynamicRange_BitDepth> $type = type;

  DynamicRange_BitDepth.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/core/DynamicRange$BitDepth');

  /// The type which includes information such as the signature of this class.
  static const type = $DynamicRange_BitDepthType();

  /// Maps a specific port to the implemented interface.
  static final Map<int, $DynamicRange_BitDepthImpl> _$impls = {};
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

  factory DynamicRange_BitDepth.implement(
    $DynamicRange_BitDepthImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = DynamicRange_BitDepth.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'androidx.camera.core.DynamicRange$BitDepth',
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

abstract interface class $DynamicRange_BitDepthImpl {
  factory $DynamicRange_BitDepthImpl() = _$DynamicRange_BitDepthImpl;
}

class _$DynamicRange_BitDepthImpl implements $DynamicRange_BitDepthImpl {
  _$DynamicRange_BitDepthImpl();
}

final class $DynamicRange_BitDepthType
    extends jni.JObjType<DynamicRange_BitDepth> {
  const $DynamicRange_BitDepthType();

  @override
  String get signature => r'Landroidx/camera/core/DynamicRange$BitDepth;';

  @override
  DynamicRange_BitDepth fromReference(jni.JReference reference) =>
      DynamicRange_BitDepth.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($DynamicRange_BitDepthType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($DynamicRange_BitDepthType) &&
        other is $DynamicRange_BitDepthType;
  }
}

/// from: androidx.camera.core.DynamicRange$DynamicRangeEncoding
class DynamicRange_DynamicRangeEncoding extends jni.JObject {
  @override
  late final jni.JObjType<DynamicRange_DynamicRangeEncoding> $type = type;

  DynamicRange_DynamicRangeEncoding.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class = jni.JClass.forName(
      r'androidx/camera/core/DynamicRange$DynamicRangeEncoding');

  /// The type which includes information such as the signature of this class.
  static const type = $DynamicRange_DynamicRangeEncodingType();

  /// Maps a specific port to the implemented interface.
  static final Map<int, $DynamicRange_DynamicRangeEncodingImpl> _$impls = {};
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

  factory DynamicRange_DynamicRangeEncoding.implement(
    $DynamicRange_DynamicRangeEncodingImpl $impl,
  ) {
    final $p = ReceivePort();
    final $x = DynamicRange_DynamicRangeEncoding.fromReference(
      ProtectedJniExtensions.newPortProxy(
        r'androidx.camera.core.DynamicRange$DynamicRangeEncoding',
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

abstract interface class $DynamicRange_DynamicRangeEncodingImpl {
  factory $DynamicRange_DynamicRangeEncodingImpl() =
      _$DynamicRange_DynamicRangeEncodingImpl;
}

class _$DynamicRange_DynamicRangeEncodingImpl
    implements $DynamicRange_DynamicRangeEncodingImpl {
  _$DynamicRange_DynamicRangeEncodingImpl();
}

final class $DynamicRange_DynamicRangeEncodingType
    extends jni.JObjType<DynamicRange_DynamicRangeEncoding> {
  const $DynamicRange_DynamicRangeEncodingType();

  @override
  String get signature =>
      r'Landroidx/camera/core/DynamicRange$DynamicRangeEncoding;';

  @override
  DynamicRange_DynamicRangeEncoding fromReference(jni.JReference reference) =>
      DynamicRange_DynamicRangeEncoding.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($DynamicRange_DynamicRangeEncodingType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($DynamicRange_DynamicRangeEncodingType) &&
        other is $DynamicRange_DynamicRangeEncodingType;
  }
}

/// from: androidx.camera.core.DynamicRange
class DynamicRange extends jni.JObject {
  @override
  late final jni.JObjType<DynamicRange> $type = type;

  DynamicRange.fromReference(
    jni.JReference reference,
  ) : super.fromReference(reference);

  static final _class =
      jni.JClass.forName(r'androidx/camera/core/DynamicRange');

  /// The type which includes information such as the signature of this class.
  static const type = $DynamicRangeType();

  /// from: static public final int ENCODING_UNSPECIFIED
  static const ENCODING_UNSPECIFIED = 0;

  /// from: static public final int ENCODING_SDR
  static const ENCODING_SDR = 1;

  /// from: static public final int ENCODING_HDR_UNSPECIFIED
  static const ENCODING_HDR_UNSPECIFIED = 2;

  /// from: static public final int ENCODING_HLG
  static const ENCODING_HLG = 3;

  /// from: static public final int ENCODING_HDR10
  static const ENCODING_HDR10 = 4;

  /// from: static public final int ENCODING_HDR10_PLUS
  static const ENCODING_HDR10_PLUS = 5;

  /// from: static public final int ENCODING_DOLBY_VISION
  static const ENCODING_DOLBY_VISION = 6;

  /// from: static public final int BIT_DEPTH_UNSPECIFIED
  static const BIT_DEPTH_UNSPECIFIED = 0;

  /// from: static public final int BIT_DEPTH_8_BIT
  static const BIT_DEPTH_8_BIT = 8;

  /// from: static public final int BIT_DEPTH_10_BIT
  static const BIT_DEPTH_10_BIT = 10;
  static final _id_UNSPECIFIED = _class.staticFieldId(
    r'UNSPECIFIED',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange UNSPECIFIED
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get UNSPECIFIED =>
      _id_UNSPECIFIED.get(_class, const $DynamicRangeType());

  static final _id_SDR = _class.staticFieldId(
    r'SDR',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange SDR
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get SDR => _id_SDR.get(_class, const $DynamicRangeType());

  static final _id_HDR_UNSPECIFIED_10_BIT = _class.staticFieldId(
    r'HDR_UNSPECIFIED_10_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange HDR_UNSPECIFIED_10_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get HDR_UNSPECIFIED_10_BIT =>
      _id_HDR_UNSPECIFIED_10_BIT.get(_class, const $DynamicRangeType());

  static final _id_HLG_10_BIT = _class.staticFieldId(
    r'HLG_10_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange HLG_10_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get HLG_10_BIT =>
      _id_HLG_10_BIT.get(_class, const $DynamicRangeType());

  static final _id_HDR10_10_BIT = _class.staticFieldId(
    r'HDR10_10_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange HDR10_10_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get HDR10_10_BIT =>
      _id_HDR10_10_BIT.get(_class, const $DynamicRangeType());

  static final _id_HDR10_PLUS_10_BIT = _class.staticFieldId(
    r'HDR10_PLUS_10_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange HDR10_PLUS_10_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get HDR10_PLUS_10_BIT =>
      _id_HDR10_PLUS_10_BIT.get(_class, const $DynamicRangeType());

  static final _id_DOLBY_VISION_10_BIT = _class.staticFieldId(
    r'DOLBY_VISION_10_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange DOLBY_VISION_10_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get DOLBY_VISION_10_BIT =>
      _id_DOLBY_VISION_10_BIT.get(_class, const $DynamicRangeType());

  static final _id_DOLBY_VISION_8_BIT = _class.staticFieldId(
    r'DOLBY_VISION_8_BIT',
    r'Landroidx/camera/core/DynamicRange;',
  );

  /// from: static public final androidx.camera.core.DynamicRange DOLBY_VISION_8_BIT
  /// The returned object must be released after use, by calling the [release] method.
  static DynamicRange get DOLBY_VISION_8_BIT =>
      _id_DOLBY_VISION_8_BIT.get(_class, const $DynamicRangeType());

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
  factory DynamicRange(
    int i,
    int i1,
  ) {
    return DynamicRange.fromReference(
        _new0(_class.reference.pointer, _id_new0 as jni.JMethodIDPtr, i, i1)
            .reference);
  }

  static final _id_getEncoding = _class.instanceMethodId(
    r'getEncoding',
    r'()I',
  );

  static final _getEncoding = ProtectedJniExtensions.lookup<
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

  /// from: public int getEncoding()
  int getEncoding() {
    return _getEncoding(reference.pointer, _id_getEncoding as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_getBitDepth = _class.instanceMethodId(
    r'getBitDepth',
    r'()I',
  );

  static final _getBitDepth = ProtectedJniExtensions.lookup<
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

  /// from: public int getBitDepth()
  int getBitDepth() {
    return _getBitDepth(reference.pointer, _id_getBitDepth as jni.JMethodIDPtr)
        .integer;
  }

  static final _id_isFullySpecified = _class.instanceMethodId(
    r'isFullySpecified',
    r'()Z',
  );

  static final _isFullySpecified = ProtectedJniExtensions.lookup<
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

  /// from: public boolean isFullySpecified()
  bool isFullySpecified() {
    return _isFullySpecified(
            reference.pointer, _id_isFullySpecified as jni.JMethodIDPtr)
        .boolean;
  }

  static final _id_is10BitHdr = _class.instanceMethodId(
    r'is10BitHdr',
    r'()Z',
  );

  static final _is10BitHdr = ProtectedJniExtensions.lookup<
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

  /// from: public boolean is10BitHdr()
  bool is10BitHdr() {
    return _is10BitHdr(reference.pointer, _id_is10BitHdr as jni.JMethodIDPtr)
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

final class $DynamicRangeType extends jni.JObjType<DynamicRange> {
  const $DynamicRangeType();

  @override
  String get signature => r'Landroidx/camera/core/DynamicRange;';

  @override
  DynamicRange fromReference(jni.JReference reference) =>
      DynamicRange.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($DynamicRangeType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($DynamicRangeType) &&
        other is $DynamicRangeType;
  }
}