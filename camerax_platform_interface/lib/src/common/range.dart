final class Range<T extends num> {
  const Range(this.lower, this.upper);

  final T lower;
  final T upper;

  @override
  int get hashCode => Object.hash(lower, upper);

  @override
  bool operator ==(Object other) =>
      other is Range<T> && other.lower == lower && other.upper == upper;

  @override
  String toString() {
    return '$lower, $upper';
  }
}
