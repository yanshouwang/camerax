// Autogenerated from Pigeon (v3.2.8), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class _FinalizerHostPigeonCodec extends StandardMessageCodec {
  const _FinalizerHostPigeonCodec();
}

class FinalizerHostPigeon {
  /// Constructor for [FinalizerHostPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FinalizerHostPigeon({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _FinalizerHostPigeonCodec();

  Future<void> finalize(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FinalizerHostPigeon.finalize', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _CameraControllerHostPigeonCodec extends StandardMessageCodec {
  const _CameraControllerHostPigeonCodec();
}

class CameraControllerHostPigeon {
  /// Constructor for [CameraControllerHostPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CameraControllerHostPigeon({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _CameraControllerHostPigeonCodec();

  Future<void> create(String arg_id, Uint8List arg_cameraSelectorBuffer) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.create', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id, arg_cameraSelectorBuffer]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> bind(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.bind', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> enableTorch(String arg_id, bool arg_state) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.enableTorch', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id, arg_state]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> setCameraSelector(String arg_id, Uint8List arg_cameraSelectorBuffer) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.setCameraSelector', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id, arg_cameraSelectorBuffer]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> setImageAnalyzer(String arg_id, String arg_imageAnalyzerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.setImageAnalyzer', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id, arg_imageAnalyzerId]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> clearImageAnalyzer(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.clearImageAnalyzer', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> unbind(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.unbind', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }

  Future<void> dispose(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraControllerHostPigeon.dispose', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _CameraControllerFlutterPigeionCodec extends StandardMessageCodec {
  const _CameraControllerFlutterPigeionCodec();
}
abstract class CameraControllerFlutterPigeion {
  static const MessageCodec<Object?> codec = _CameraControllerFlutterPigeionCodec();

  void onTorchStateChanged(String id, bool state);
  static void setup(CameraControllerFlutterPigeion? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.CameraControllerFlutterPigeion.onTorchStateChanged', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.CameraControllerFlutterPigeion.onTorchStateChanged was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_id = (args[0] as String?);
          assert(arg_id != null, 'Argument for dev.flutter.pigeon.CameraControllerFlutterPigeion.onTorchStateChanged was null, expected non-null String.');
          final bool? arg_state = (args[1] as bool?);
          assert(arg_state != null, 'Argument for dev.flutter.pigeon.CameraControllerFlutterPigeion.onTorchStateChanged was null, expected non-null bool.');
          api.onTorchStateChanged(arg_id!, arg_state!);
          return;
        });
      }
    }
  }
}

class _ImageAnalyzerHostPigeonCodec extends StandardMessageCodec {
  const _ImageAnalyzerHostPigeonCodec();
}

class ImageAnalyzerHostPigeon {
  /// Constructor for [ImageAnalyzerHostPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ImageAnalyzerHostPigeon({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ImageAnalyzerHostPigeonCodec();

  Future<void> create(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ImageAnalyzerHostPigeon.create', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _ImageAnalyzerFutterPigeonCodec extends StandardMessageCodec {
  const _ImageAnalyzerFutterPigeonCodec();
}
abstract class ImageAnalyzerFutterPigeon {
  static const MessageCodec<Object?> codec = _ImageAnalyzerFutterPigeonCodec();

  void onAnalyzed(String id, Uint8List imageProxyBuffer);
  static void setup(ImageAnalyzerFutterPigeon? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.ImageAnalyzerFutterPigeon.onAnalyzed', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.ImageAnalyzerFutterPigeon.onAnalyzed was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_id = (args[0] as String?);
          assert(arg_id != null, 'Argument for dev.flutter.pigeon.ImageAnalyzerFutterPigeon.onAnalyzed was null, expected non-null String.');
          final Uint8List? arg_imageProxyBuffer = (args[1] as Uint8List?);
          assert(arg_imageProxyBuffer != null, 'Argument for dev.flutter.pigeon.ImageAnalyzerFutterPigeon.onAnalyzed was null, expected non-null Uint8List.');
          api.onAnalyzed(arg_id!, arg_imageProxyBuffer!);
          return;
        });
      }
    }
  }
}

class _MLAnalyzerHostPigeonCodec extends StandardMessageCodec {
  const _MLAnalyzerHostPigeonCodec();
}

class MLAnalyzerHostPigeon {
  /// Constructor for [MLAnalyzerHostPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MLAnalyzerHostPigeon({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MLAnalyzerHostPigeonCodec();

  Future<void> create(String arg_id) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MLAnalyzerHostPigeon.create', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}

class _MLAnalyzerFlutterPigeonCodec extends StandardMessageCodec {
  const _MLAnalyzerFlutterPigeonCodec();
}
abstract class MLAnalyzerFlutterPigeon {
  static const MessageCodec<Object?> codec = _MLAnalyzerFlutterPigeonCodec();

  void onAnalyzed(String id, List<Uint8List?> recognitionBuffer);
  static void setup(MLAnalyzerFlutterPigeon? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MLAnalyzerFlutterPigeon.onAnalyzed', codec, binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null, 'Argument for dev.flutter.pigeon.MLAnalyzerFlutterPigeon.onAnalyzed was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_id = (args[0] as String?);
          assert(arg_id != null, 'Argument for dev.flutter.pigeon.MLAnalyzerFlutterPigeon.onAnalyzed was null, expected non-null String.');
          final List<Uint8List?>? arg_recognitionBuffer = (args[1] as List<Object?>?)?.cast<Uint8List?>();
          assert(arg_recognitionBuffer != null, 'Argument for dev.flutter.pigeon.MLAnalyzerFlutterPigeon.onAnalyzed was null, expected non-null List<Uint8List?>.');
          api.onAnalyzed(arg_id!, arg_recognitionBuffer!);
          return;
        });
      }
    }
  }
}

class _CameraViewHostPigeonCodec extends StandardMessageCodec {
  const _CameraViewHostPigeonCodec();
}

class CameraViewHostPigeon {
  /// Constructor for [CameraViewHostPigeon].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CameraViewHostPigeon({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _CameraViewHostPigeonCodec();

  Future<void> createOrSetArguments(String arg_id, String arg_controllerId, int arg_scaleType) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.CameraViewHostPigeon.createOrSetArguments', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_id, arg_controllerId, arg_scaleType]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}
