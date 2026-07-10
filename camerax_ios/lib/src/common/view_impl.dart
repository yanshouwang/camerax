import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ViewImpl implements View {
  UIViewProxyApi get api;

  @override
  Future<View$Visibility> getVisibility() => api.isHidden().then((e) => e.impl);
  @override
  Future<void> setVisibility(View$Visibility value) => api.setHidden(value.api);

  @override
  Future<double> getAlpha() => api.getAlpha();
  @override
  Future<void> setAlpha(double value) => api.setAlpha(value);

  @override
  Future<bool> isVisible() => api.isHidden().then((e) => !e);
  @override
  Future<bool> isInvisible() => api.isHidden();
  @override
  Future<bool> isGone() => throw UnimplementedError();
  @override
  Future<bool> isOpaque() => api.isOpaque();

  @override
  Future<void> setVisible(bool value) => api.setHidden(!value);
  @override
  Future<void> setInvisible(bool value) => api.setHidden(value);
  @override
  Future<void> setGone(bool value) => throw UnimplementedError();
  @override
  Future<void> setOpaque(bool value) => api.setOpaque(value);
}

extension on View$Visibility {
  bool get api {
    switch (this) {
      case .visible:
        return false;
      case .invisible:
        return true;
      case .gone:
        throw ArgumentError.value(this, 'visibility');
    }
  }
}

extension on bool {
  View$Visibility get impl => this ? .invisible : .visible;
}
