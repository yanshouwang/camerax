enum View$Visibility { visible, invisible, gone }

abstract interface class View {
  Future<View$Visibility> getVisibility();
  Future<void> setVisibility(View$Visibility value);

  Future<double> getAlpha();
  Future<void> setAlpha(double value);

  Future<bool> isVisible();
  Future<bool> isInvisible();
  Future<bool> isGone();
  Future<bool> isOpaque();

  Future<void> setVisible(bool value);
  Future<void> setInvisible(bool value);
  Future<void> setGone(bool value);
  Future<void> setOpaque(bool value);
}
