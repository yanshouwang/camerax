import 'dart:async';

import 'package:camerax/mlkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A camera controller.
abstract class CameraController {
  /// A camera preview widget.
  Widget get view;

  /// Size of the preview, available when initAsync completed.
  Size get size;

  /// Torch state of the camera, available when initAsync completed.
  ValueNotifier<TorchState> get torchState;

  /// A stream of barcode detection.
  Stream<Barcode> get barcodes;

  /// Create a camera controller with [CameraFacing]
  factory CameraController(
          {CameraFacing facing = CameraFacing.back,
          BarcodeFormat format = BarcodeFormat.all}) =>
      _CameraController(facing, format);

  /// Initialize the camera asynchronously.
  Future<void> initAsync();

  /// Switch the torch's state.
  void torch();

  /// Release the resources of the camera.
  void dispose();
}

class _CameraController implements CameraController {
  static const MethodChannel method =
      MethodChannel('yanshouwang.dev/camerax/method');
  static const EventChannel event =
      EventChannel('yanshouwang.dev/camerax/event');

  static const not_determined = 0;
  static const authorized = 1;
  static const denied = 2;

  final CameraFacing facing;
  final BarcodeFormat format;

  StreamSubscription subscription;
  StreamController<Barcode> barcodeController;

  int textureId;
  bool torchable;
  @override
  Size size;
  @override
  ValueNotifier<TorchState> torchState;

  @override
  Widget get view => Texture(textureId: textureId);

  @override
  Stream<Barcode> get barcodes => barcodeController.stream;

  _CameraController(this.facing, this.format)
      : torchState = ValueNotifier(TorchState.off),
        torchable = false {
    subscription = event.receiveBroadcastStream(hashCode).listen(onEvent);
    barcodeController = StreamController<Barcode>.broadcast(
      onListen: () => method.invokeMethod('barcode', format.value),
      onCancel: () => method.invokeMethod('barcode', hashCode),
    );
  }

  void onEvent(dynamic event) {
    final name = event['name'];
    final data = event['data'];
    switch (name) {
      case 'torchState':
        final state = TorchState.values[data];
        torchState.value = state;
        break;
      case 'barcode':
        final barcode = Barcode.fromNative(data);
        barcodeController.add(barcode);
        break;
      default:
        throw UnimplementedError();
    }
  }

  @override
  Future<void> initAsync() async {
    var state = await method.invokeMethod('state');
    if (state == not_determined) {
      final result = await method.invokeMethod('request');
      state = result ? authorized : denied;
    }
    if (state != authorized) {
      throw PlatformException(code: 'NO ACCESS');
    }
    final answer =
        await method.invokeMapMethod<String, dynamic>('init', facing.index);
    textureId = answer['textureId'];
    size = (answer['size'] as Map<dynamic, dynamic>).size;
    torchable = answer['torchable'];
  }

  @override
  void torch() {
    if (!torchable) {
      return;
    }
    var state =
        torchState.value == TorchState.off ? TorchState.on : TorchState.off;
    method.invokeMethod('torch', state.index);
  }

  @override
  void dispose() {
    barcodeController?.close();
    subscription.cancel();
    method.invokeMethod('dispose', hashCode);
  }
}

/// The facing of a camera.
enum CameraFacing {
  /// Front facing camera.
  front,

  /// Back facing camera.
  back,
}

/// The state of torch.
enum TorchState {
  /// Torch is off.
  off,

  /// Torch is on.
  on,
}

extension on Map<dynamic, dynamic> {
  Size get size {
    final width = this['width'];
    final height = this['height'];
    return Size(width, height);
  }
}

extension on BarcodeFormat {
  int get value {
    switch (this) {
      case BarcodeFormat.all:
        return 0;
      case BarcodeFormat.code128:
        return 1;
      case BarcodeFormat.code39:
        return 2;
      case BarcodeFormat.code93:
        return 4;
      case BarcodeFormat.codebar:
        return 8;
      case BarcodeFormat.dataMatrix:
        return 16;
      case BarcodeFormat.ean13:
        return 32;
      case BarcodeFormat.ean8:
        return 64;
      case BarcodeFormat.itf:
        return 128;
      case BarcodeFormat.qrCode:
        return 256;
      case BarcodeFormat.upcA:
        return 512;
      case BarcodeFormat.upcE:
        return 1024;
      case BarcodeFormat.pdf417:
        return 2048;
      case BarcodeFormat.aztec:
        return 4096;
      default:
        return -1;
    }
  }
}
