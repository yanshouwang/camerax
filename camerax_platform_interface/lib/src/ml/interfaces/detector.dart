import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/ml/common.dart';

abstract base class Detector<T> extends Closeable {
  Detector.impl() : super.impl();

  Future<T> process(InputImage image);
}
