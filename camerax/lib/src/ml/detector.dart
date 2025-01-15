import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

abstract class Detector<T> {
  @internal
  $interface.Detector<T> get obj;

  Future<void> close() => obj.close();
}
