import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

base mixin Detector<T> on $base.Detector<T> {
  $native.Detector get obj;

  @override
  Future<void> close() async {
    await obj.close();
  }
}
