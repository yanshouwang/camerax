final class LimitedValue<T extends num> {
  final T minimum;
  final T maximum;
  final T value;

  LimitedValue({
    required this.minimum,
    required this.maximum,
    required this.value,
  }) : assert(minimum <= maximum && value >= minimum && value <= maximum);
}
