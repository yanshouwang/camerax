abstract base class Rect<T extends num> {
  Rect.impl();

  T get left;
  T get top;
  T get right;
  T get bottom;

  factory Rect(T left, T top, T right, T bottom) {}
}

extension RectX<T extends num> on Rect<T> {
  T get width => (right - left) as T;
  T get height => (bottom - top) as T;

  Point<T> get origin => Point(left, top);
  Size<T> get size => Size(width, height);
}
