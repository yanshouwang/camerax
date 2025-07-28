import 'point.dart';
import 'size.dart';

final class Rect<T extends num> {
  final T left;
  final T top;
  final T right;
  final T bottom;

  Rect(this.left, this.top, this.right, this.bottom);

  @override
  bool operator ==(Object other) {
    return other is Rect<T> &&
        other.left == left &&
        other.top == top &&
        other.right == right &&
        other.bottom == bottom;
  }

  @override
  int get hashCode => Object.hash(left, top, right, bottom);
}

extension RectX<T extends num> on Rect<T> {
  T get width => (right - left) as T;
  T get height => (bottom - top) as T;

  Point<T> get origin => Point(left, top);
  Size<T> get size => Size(width, height);
}
