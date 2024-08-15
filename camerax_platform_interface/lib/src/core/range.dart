final class Range<T> {
  final T lower;
  final T upper;

  const Range({
    required this.lower,
    required this.upper,
  });

  @override
  bool operator ==(Object other) {
    return other is Range<T> && other.lower == lower && other.upper == upper;
  }

  @override
  int get hashCode => Object.hash(lower, upper);
}
