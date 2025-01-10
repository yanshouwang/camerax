import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class IntRange extends $base.Range<int> {
  final $native.IntRange obj;

  IntRange.$native(this.obj) : super.impl();

  factory IntRange({
    required int lower,
    required int upper,
  }) {
    final obj = $native.IntRange(
      lower: lower,
      upper: upper,
    );
    return IntRange.$native(obj);
  }

  @override
  Future<int> getLower() async {
    final value = await obj.getLower();
    return value;
  }

  @override
  Future<int> getUpper() async {
    final value = await obj.getUpper();
    return value;
  }
}
