import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'barcode.dart';
import 'detector.dart';
import 'face.dart';

final class MlKitAnalyzerResult extends $interface.MlKitAnalyzerResult {
  final $native.MlKitAnalyzerResult obj;

  MlKitAnalyzerResult.$native(
    this.obj, {
    required super.timestamp,
  }) : super.impl();

  @override
  Future<Object?> getThrowable($interface.Detector detector) async {
    if (detector is! Detector) {
      throw TypeError();
    }
    final obj = await this.obj.getThrowable(detector.obj);
    return obj?.args;
  }

  @override
  Future<T?> getValue<T>($interface.Detector<T> detector) async {
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

  Future<List<$interface.Barcode>?> _getBarcodes(
      BarcodeScanner detector) async {
    final objs = await obj.getBarcodes(detector.obj);
    return objs?.map((obj) => obj.args).toList();
  }

  Future<List<$interface.Face>?> _getFaces(FaceDetector detector) async {
    final objs = await obj.getFaces(detector.obj);
    return objs?.map((obj) => obj.args).toList();
  }
}

extension MlKitAnalyzerResultObj on $native.MlKitAnalyzerResult {
  $interface.MlKitAnalyzerResult get args {
    return MlKitAnalyzerResult.$native(
      this,
      timestamp: timestamp,
    );
  }
}
