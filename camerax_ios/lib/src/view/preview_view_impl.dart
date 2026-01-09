import 'dart:ui';

import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PreviewViewImpl with WidgetAdapterImpl implements PreviewView {
  final PreviewViewProxyApi api;

  PreviewViewImpl.internal(this.api);

  @override
  String get viewType => 'camerax.zeekr.dev/PreviewView';
  @override
  int? get identifier => api.pigeon_instanceManager.getIdentifier(api);

  @override
  Future<void> setController(CameraController? controller) =>
      api.setController(controller?.api);

  @override
  Future<void> setImplementationMode(
    PreviewView$ImplementationMode implementationMode,
  ) => throw UnimplementedError();

  @override
  Future<void> setScaleType(PreviewView$ScaleType scaleType) =>
      api.setScaleType(scaleType.api);

  @override
  Future<void> setScreenFlashOverlayColor(Color color) =>
      throw UnimplementedError();
}

final class PreviewViewChannelImpl extends PreviewViewChannel {
  @override
  PreviewView create() {
    final api = PreviewViewProxyApi();
    return PreviewViewImpl.internal(api);
  }
}

extension PreviewView$ScaleTypeX on PreviewView$ScaleType {
  PreviewViewScaleTypeApi get api => PreviewViewScaleTypeApi.values[index];
}
