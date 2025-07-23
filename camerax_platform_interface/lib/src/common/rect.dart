final class Rect {
  final int left;
  final int top;
  final int right;
  final int bottom;

  Rect(this.left, this.top, this.right, this.bottom);
}

extension RectX on Rect {
  int get width => right - left;
  int get height => bottom - top;
}
