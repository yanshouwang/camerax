final class Size<T extends num> {
  final T width;
  final T height;

  Size(this.width, this.height);

  @override
  bool operator ==(Object other) {
    return other is Size<T> && other.width == width && other.height == height;
  }

  @override
  int get hashCode => Object.hash(width, height);
}
