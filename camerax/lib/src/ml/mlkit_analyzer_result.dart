import 'package:camerax/src/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class MlKitAnalyzerResult {
  final $base.MlKitAnalyzerResult _obj;

  MlKitAnalyzerResult._native(this._obj);

  @internal
  $base.MlKitAnalyzerResult get obj => _obj;

  int get timestamp => _obj.timestamp;

  Future<Object?> getThrowable(Detector detector) =>
      _obj.getThrowable(detector.obj);
  Future<T?> getValue<T>(Detector<T> detector) => _obj.getValue(detector.obj);
}

extension MlKitAnalyzerResultObj on $base.MlKitAnalyzerResult {
  @internal
  MlKitAnalyzerResult get args {
    return MlKitAnalyzerResult._native(this);
  }
}
