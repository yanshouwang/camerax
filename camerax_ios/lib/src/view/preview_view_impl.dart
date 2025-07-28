import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller_impl.dart';

final class PreviewViewImpl extends PreviewView {
  final PreviewViewApi api;

  PreviewViewImpl.internal(this.api) : super.impl();

  factory PreviewViewImpl() {
    final api = PreviewViewApi();
    return PreviewViewImpl.internal(api);
  }

  @override
  Future<void> setController(CameraController controller) async {
    if (controller is! CameraControllerImpl) {
      throw TypeError();
    }
    await api.setController(controller.api);
  }

  @override
  Widget build(BuildContext context) {
    final identifier = api.pigeon_instanceManager.getIdentifier(api);
    return UiKitView(
      viewType: 'camerax.zeekr.dev/PreviewView',
      layoutDirection: TextDirection.ltr,
      creationParams: identifier,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
