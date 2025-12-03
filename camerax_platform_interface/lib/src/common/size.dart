final class Size<T extends num> {
  const Size(this.width, this.height);

  final T width;
  final T height;

  @override
  int get hashCode => Object.hash(width, height);

  @override
  bool operator ==(Object other) =>
      other is Size && other.width == width && other.height == height;

  @override
  String toString() {
    return '$width, $height';
  }
}
