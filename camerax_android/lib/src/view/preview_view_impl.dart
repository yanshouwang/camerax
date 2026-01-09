import 'dart:ui';

import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PreviewViewImpl with WidgetAdapterImpl implements PreviewView {
  final PreviewViewProxyApi api;
  late final PreviewView$ImplementationMode implementationMode;

  PreviewViewImpl.internal(this.api);

  @override
  String get viewType =>
      'camerax.zeekr.dev/PreviewView.${implementationMode.name.toUpperCase()}';
  @override
  int? get identifier => api.pigeon_instanceManager.getIdentifier(api);

  @override
  Future<void> setController(CameraController? controller) =>
      api.setController(controller?.api);

  @override
  Future<void> setImplementationMode(
    PreviewView$ImplementationMode implementationMode,
  ) {
    this.implementationMode = implementationMode;
    return api.setImplementationMode(implementationMode.api);
  }

  @override
  Future<void> setScaleType(PreviewView$ScaleType scaleType) =>
      api.setScaleType(scaleType.api);

  @override
  Future<void> setScreenFlashOverlayColor(Color color) =>
      api.setScreenFlashOverlayColor(color.api);
}

final class PreviewViewChannelImpl extends PreviewViewChannel {
  @override
  PreviewView create() {
    final api = PreviewViewProxyApi();
    return PreviewViewImpl.internal(api);
  }
}

extension PreviewView$ImplementationModeX on PreviewView$ImplementationMode {
  PreviewViewImplementationModeApi get api =>
      PreviewViewImplementationModeApi.values[index];
}

extension PreviewView$ScaleTypeX on PreviewView$ScaleType {
  PreviewViewScaleTypeApi get api => PreviewViewScaleTypeApi.values[index];
}
