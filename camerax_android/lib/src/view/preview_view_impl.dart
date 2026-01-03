import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PreviewViewImpl with WidgetAdapterImpl implements PreviewView {
  final PreviewViewProxyApi api;

  PreviewViewImpl.internal(this.api);

  @override
  String get viewType => 'camerax.zeekr.dev/PreviewView';
  @override
  int? get identifier => api.pigeon_instanceManager.getIdentifier(api);

  @override
  Future<void> setController(CameraController controller) =>
      api.setController(controller.api);
}

final class PreviewViewChannelImpl extends PreviewViewChannel {
  @override
  PreviewView create() {
    final api = PreviewViewProxyApi();
    return PreviewViewImpl.internal(api);
  }
}
