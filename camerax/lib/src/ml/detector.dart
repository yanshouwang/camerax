import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

abstract class Detector<T> {
  @internal
  $base.Detector<T> get obj;

  Future<void> close() => obj.close();
}
