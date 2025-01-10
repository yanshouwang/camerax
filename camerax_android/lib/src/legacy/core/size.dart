import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class Size extends $base.Size {
  final $native.Size obj;

  Size.$native(this.obj) : super.impl();

  @override
  Future<int> getHeight() async {
    final value = await obj.getHeight();
    return value;
  }

  @override
  Future<int> getWidth() async {
    final value = await obj.getWidth();
    return value;
  }
}
