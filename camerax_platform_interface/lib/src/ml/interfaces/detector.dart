import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/ml.dart';

abstract interface class Detector<T> implements Closeable {
  Future<T> process(InputImage image);
}
