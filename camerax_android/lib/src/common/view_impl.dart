import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ViewImpl implements View {
  ViewProxyApi get api;

  @override
  Future<View$Visibility> getVisibility() =>
      api.getVisibility().then((e) => e.impl);
  @override
  Future<void> setVisibility(View$Visibility value) =>
      api.setVisibility(value.api);

  @override
  Future<double> getAlpha() => api.getAlpha();
  @override
  Future<void> setAlpha(double value) => api.setAlpha(value);

  @override
  Future<bool> isVisible() => api.isVisible();
  @override
  Future<bool> isInvisible() => api.isInvisible();
  @override
  Future<bool> isGone() => api.isGone();
  @override
  Future<bool> isOpaque() => api.isOpaque();

  @override
  Future<void> setVisible(bool value) => api.setVisible(value);
  @override
  Future<void> setInvisible(bool value) => api.setInvisible(value);
  @override
  Future<void> setGone(bool value) => api.setGone(value);
  @override
  Future<void> setOpaque(bool value) => throw UnimplementedError();
}

extension View$VisibilityX on View$Visibility {
  ViewVisibilityApi get api => ViewVisibilityApi.values[index];
}

extension ViewVisibilityApiX on ViewVisibilityApi {
  View$Visibility get impl => View$Visibility.values[index];
}
