// Autogenerated from Pigeon (v20.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, unnecessary_import, no_leading_underscores_for_local_identifiers
// ignore_for_file: avoid_relative_lib_imports
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;
import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:camerax_android/src/pigeon.g.dart';


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CameraSelectorArgs) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else     if (value is ZoomStateArgs) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else     if (value is LensFacingArgs) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    } else     if (value is ScaleTypeArgs) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    } else     if (value is LiveDataType) {
      buffer.putUint8(133);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        return CameraSelectorArgs.decode(readValue(buffer)!);
      case 130: 
        return ZoomStateArgs.decode(readValue(buffer)!);
      case 131: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : LensFacingArgs.values[value];
      case 132: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : ScaleTypeArgs.values[value];
      case 133: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : LiveDataType.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Host API for managing the native `InstanceManager`.
abstract class TestInstanceManagerHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  /// Clear the native `InstanceManager`.
  ///
  /// This is typically only used after a hot restart.
  void clear();

  static void setUp(TestInstanceManagerHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.InstanceManagerHostAPI.clear$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          try {
            api.clear();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

/// Handles methods calls to the native Java Object class.
///
/// Also handles calls to remove the reference to an instance with `dispose`.
///
/// See https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html.
abstract class TestJavaObjectHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void dispose(int identifier);

  static void setUp(TestJavaObjectHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.ObjectHostAPI.dispose$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.ObjectHostAPI.dispose was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.ObjectHostAPI.dispose was null, expected non-null int.');
          try {
            api.dispose(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

abstract class TestPermissionsManagerHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  Future<bool> requestPermissions(bool enableAudioArgs);

  static void setUp(TestPermissionsManagerHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.PermissionsManagerHostAPI.requestPermissions$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.PermissionsManagerHostAPI.requestPermissions was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final bool? arg_enableAudioArgs = (args[0] as bool?);
          assert(arg_enableAudioArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.PermissionsManagerHostAPI.requestPermissions was null, expected non-null bool.');
          try {
            final bool output = await api.requestPermissions(arg_enableAudioArgs!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

abstract class TestCameraControllerHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void create(int identifier);

  void bindToLifecycle(int identifier);

  void unbind(int identifier);

  bool hasCamera(int identifier, CameraSelectorArgs cameraSelectorArgs);

  void setCameraSelector(int identifier, CameraSelectorArgs cameraSelectorArgs);

  bool isTapToFocusEnabled(int identifier);

  void setTapToFocusEnabled(int identifier, bool enabledArgs);

  ZoomStateArgs? getZoomState(int identifier);

  bool isPinchToZoomEnabled(int identifier);

  void setPinchToZoomEnabled(int identifier, bool enabledArgs);

  Future<void> setLinearZoom(int identifier, double linearZoomArgs);

  Future<void> setZoomRatio(int identifier, double zoomRatioArgs);

  static void setUp(TestCameraControllerHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.create$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.create was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.create was null, expected non-null int.');
          try {
            api.create(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.bindToLifecycle$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.bindToLifecycle was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.bindToLifecycle was null, expected non-null int.');
          try {
            api.bindToLifecycle(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.unbind$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.unbind was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.unbind was null, expected non-null int.');
          try {
            api.unbind(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.hasCamera$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.hasCamera was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.hasCamera was null, expected non-null int.');
          final CameraSelectorArgs? arg_cameraSelectorArgs = (args[1] as CameraSelectorArgs?);
          assert(arg_cameraSelectorArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.hasCamera was null, expected non-null CameraSelectorArgs.');
          try {
            final bool output = api.hasCamera(arg_identifier!, arg_cameraSelectorArgs!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setCameraSelector$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setCameraSelector was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setCameraSelector was null, expected non-null int.');
          final CameraSelectorArgs? arg_cameraSelectorArgs = (args[1] as CameraSelectorArgs?);
          assert(arg_cameraSelectorArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setCameraSelector was null, expected non-null CameraSelectorArgs.');
          try {
            api.setCameraSelector(arg_identifier!, arg_cameraSelectorArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isTapToFocusEnabled$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isTapToFocusEnabled was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isTapToFocusEnabled was null, expected non-null int.');
          try {
            final bool output = api.isTapToFocusEnabled(arg_identifier!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setTapToFocusEnabled$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setTapToFocusEnabled was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setTapToFocusEnabled was null, expected non-null int.');
          final bool? arg_enabledArgs = (args[1] as bool?);
          assert(arg_enabledArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setTapToFocusEnabled was null, expected non-null bool.');
          try {
            api.setTapToFocusEnabled(arg_identifier!, arg_enabledArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.getZoomState$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.getZoomState was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.getZoomState was null, expected non-null int.');
          try {
            final ZoomStateArgs? output = api.getZoomState(arg_identifier!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isPinchToZoomEnabled$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isPinchToZoomEnabled was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.isPinchToZoomEnabled was null, expected non-null int.');
          try {
            final bool output = api.isPinchToZoomEnabled(arg_identifier!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setPinchToZoomEnabled$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setPinchToZoomEnabled was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setPinchToZoomEnabled was null, expected non-null int.');
          final bool? arg_enabledArgs = (args[1] as bool?);
          assert(arg_enabledArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setPinchToZoomEnabled was null, expected non-null bool.');
          try {
            api.setPinchToZoomEnabled(arg_identifier!, arg_enabledArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setLinearZoom$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setLinearZoom was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setLinearZoom was null, expected non-null int.');
          final double? arg_linearZoomArgs = (args[1] as double?);
          assert(arg_linearZoomArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setLinearZoom was null, expected non-null double.');
          try {
            await api.setLinearZoom(arg_identifier!, arg_linearZoomArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setZoomRatio$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setZoomRatio was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setZoomRatio was null, expected non-null int.');
          final double? arg_zoomRatioArgs = (args[1] as double?);
          assert(arg_zoomRatioArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.CameraControllerHostAPI.setZoomRatio was null, expected non-null double.');
          try {
            await api.setZoomRatio(arg_identifier!, arg_zoomRatioArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

abstract class TestPreviewViewHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void create(int identifier);

  void setController(int identifier, int controllerIdentifier);

  void setScaleType(int identifier, ScaleTypeArgs scaleTypeArgs);

  static void setUp(TestPreviewViewHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.create$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.create was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.create was null, expected non-null int.');
          try {
            api.create(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setController$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setController was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setController was null, expected non-null int.');
          final int? arg_controllerIdentifier = (args[1] as int?);
          assert(arg_controllerIdentifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setController was null, expected non-null int.');
          try {
            api.setController(arg_identifier!, arg_controllerIdentifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setScaleType$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setScaleType was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setScaleType was null, expected non-null int.');
          final ScaleTypeArgs? arg_scaleTypeArgs = (args[1] as ScaleTypeArgs?);
          assert(arg_scaleTypeArgs != null,
              'Argument for dev.flutter.pigeon.camerax_android.PreviewViewHostAPI.setScaleType was null, expected non-null ScaleTypeArgs.');
          try {
            api.setScaleType(arg_identifier!, arg_scaleTypeArgs!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

abstract class TestObserverHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void create(int identifier);

  static void setUp(TestObserverHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.ObserverHostAPI.create$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.ObserverHostAPI.create was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.ObserverHostAPI.create was null, expected non-null int.');
          try {
            api.create(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

abstract class TestLiveDataHostAPI {
  static TestDefaultBinaryMessengerBinding? get _testBinaryMessengerBinding => TestDefaultBinaryMessengerBinding.instance;
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  void observe(int identifier, int observerIdentifier);

  void removeObservers(int identifier);

  int? getValue(int identifier, LiveDataType type);

  static void setUp(TestLiveDataHostAPI? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.LiveDataHostAPI.observe$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.observe was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.observe was null, expected non-null int.');
          final int? arg_observerIdentifier = (args[1] as int?);
          assert(arg_observerIdentifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.observe was null, expected non-null int.');
          try {
            api.observe(arg_identifier!, arg_observerIdentifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.LiveDataHostAPI.removeObservers$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.removeObservers was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.removeObservers was null, expected non-null int.');
          try {
            api.removeObservers(arg_identifier!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.camerax_android.LiveDataHostAPI.getValue$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, null);
      } else {
        _testBinaryMessengerBinding!.defaultBinaryMessenger.setMockDecodedMessageHandler<Object?>(__pigeon_channel, (Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.getValue was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_identifier = (args[0] as int?);
          assert(arg_identifier != null,
              'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.getValue was null, expected non-null int.');
          final LiveDataType? arg_type = (args[1] as LiveDataType?);
          assert(arg_type != null,
              'Argument for dev.flutter.pigeon.camerax_android.LiveDataHostAPI.getValue was null, expected non-null LiveDataType.');
          try {
            final int? output = api.getValue(arg_identifier!, arg_type!);
            return <Object?>[output];
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
