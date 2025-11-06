abstract base class Rect<T extends num> {
  Rect.impl();

  T get left;
  T get top;
  T get right;
  T get bottom;

  factory Rect(T left, T top, T right, T bottom) {}
}
