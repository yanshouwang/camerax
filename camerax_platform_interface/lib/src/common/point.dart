final class Point<T extends num> {
  final T x;
  final T y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) {
    return other is Point<T> && other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);
}
