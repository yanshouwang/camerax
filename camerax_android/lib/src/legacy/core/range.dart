import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class Range<T> extends $interface.Range<T> {
  @override
  final T lower;
  @override
  final T upper;

  Range({
    required this.lower,
    required this.upper,
  }) : super.impl();
}
