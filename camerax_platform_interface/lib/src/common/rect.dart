import 'point.dart';
import 'size.dart';

final class Rect<T extends num> {
  const Rect(this.left, this.top, this.right, this.bottom);

  final T left;
  final T top;
  final T right;
  final T bottom;

  T get width => (right - left) as T;
  T get height => (bottom - top) as T;

  Point<T> get origin => Point(left, top);
  Size<T> get size => Size(width, height);

  @override
  int get hashCode => Object.hash(left, top, right, bottom);

  @override
  bool operator ==(Object other) =>
      other is Rect<T> &&
      other.left == left &&
      other.top == top &&
      other.right == right &&
      other.bottom == bottom;
}
