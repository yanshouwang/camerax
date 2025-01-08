import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

final class PreviewView extends $base.PreviewView {
  final $native.PreviewView obj;

  PreviewView.$native(this.obj) : super.impl();

  factory PreviewView() {
    final obj = $native.PreviewView();
    return PreviewView.$native(obj);
  }

  @override
  Future<void> setController($base.CameraController controller) async {
    if (controller is! CameraController) {
      throw TypeError();
    }
    await obj.setController(controller.obj);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'camerax.hebei.dev/PreviewView',
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const {},
        );
      },
      onCreatePlatformView: (params) {
        final viewId = obj.pigeon_instanceManager.getIdentifier(obj);
        return _initAndroidView(
          params,
          hybridComposition: true,
          creationParams: viewId,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }

  AndroidViewController _initAndroidView(
    PlatformViewCreationParams params, {
    required bool hybridComposition,
    TextDirection layoutDirection = TextDirection.ltr,
    dynamic creationParams,
    MessageCodec<dynamic>? creationParamsCodec,
  }) {
    if (hybridComposition) {
      return PlatformViewsService.initExpensiveAndroidView(
        id: params.id,
        viewType: params.viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: creationParamsCodec,
      );
    } else {
      return PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: params.viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: creationParamsCodec,
      );
    }
  }
}
