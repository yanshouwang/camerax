import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_controller_impl.dart';

final class PreviewViewImpl extends PreviewView with ViewImpl {
  final PreviewViewProxyApi api;

  PreviewViewImpl.internal(this.api) : super.impl();

  factory PreviewViewImpl() {
    final api = PreviewViewProxyApi();
    return PreviewViewImpl.internal(api);
  }

  @override
  String get viewType => 'camerax.zeekr.dev/PreviewView';
  @override
  int? get identifier => api.pigeon_instanceManager.getIdentifier(api);

  @override
  Future<void> setController(CameraController controller) =>
      api.setController(controller.api);
}
