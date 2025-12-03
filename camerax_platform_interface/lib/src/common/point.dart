final class Point<T extends num> {
  const Point(this.x, this.y);

  final T x;
  final T y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  bool operator ==(Object other) =>
      other is Point<T> && other.x == x && other.y == y;

  @override
  String toString() {
    return '$x, $y';
  }
}
