import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:flutter/services.dart';

import 'barcode.dart';
import 'detector.dart';
import 'face.dart';

final class MlKitAnalyzerResult extends $base.MlKitAnalyzerResult {
  final $native.MlKitAnalyzerResult obj;

  MlKitAnalyzerResult.$native(
    this.obj, {
    required super.timestamp,
  }) : super.impl();

  @override
  Future<Object?> getThrowable($base.Detector detector) async {
    if (detector is! Detector) {
      throw TypeError();
    }
    final args = await obj.getThrowable(detector.obj);
    return args == null
        ? null
        : PlatformException(
            code: args[0] as String,
            message: args[1] as String?,
            details: args[2],
          );
  }

  @override
  Future<T?> getValue<T>($base.Detector<T> detector) async {
    if (detector is BarcodeScanner) {
      final value = await _getBarcodes(detector as BarcodeScanner);
      return value as T?;
    } else if (detector is FaceDetector) {
      final value = await _getFaces(detector as FaceDetector);
      return value as T?;
    } else {
      throw TypeError();
    }
  }

  Future<List<$base.Barcode>?> _getBarcodes(BarcodeScanner detector) async {
    final objs = await obj.getBarcodes(detector.obj);
    return objs?.map((obj) => obj.args).toList();
  }

  Future<List<$base.Face>?> _getFaces(FaceDetector detector) async {
    final objs = await obj.getFaces(detector.obj);
    return objs?.map((obj) => obj.args).toList();
  }
}

extension MlKitAnalyzerResultObj on $native.MlKitAnalyzerResult {
  $base.MlKitAnalyzerResult get args {
    return MlKitAnalyzerResult.$native(
      this,
      timestamp: timestamp,
    );
  }
}
