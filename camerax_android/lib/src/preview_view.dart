import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide AndroidView;

import 'camera_controller.dart';
import 'instance_manager.dart';
import 'pigeon.dart';
import 'pigeon.g.dart';
import 'view.dart';

class AndroidPreviewView extends AndroidView implements PreviewView {
  static final PreviewViewHostAPI _api = PreviewViewHostAPI();

  AndroidPreviewView() : super.detached() {
    final identifier = InstanceManager.instance.addDartCreatedInstance(this);
    _api.create(identifier);
  }

  @protected
  AndroidPreviewView.detached() : super.detached();

  @override
  AndroidPreviewView copy() {
    return AndroidPreviewView.detached();
  }

  @override
  Future<void> setController(CameraController controller) async {
    if (controller is! AndroidCameraController) {
      throw TypeError();
    }
    await _api.setController(identifier, controller.identifier);
  }

  @override
  Future<void> setScaleType(ScaleType scaleType) async {
    final scaleTypeArgs = scaleType.toArgs();
    await _api.setScaleType(identifier, scaleTypeArgs);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'hebei.dev/PreviewView',
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const {},
        );
      },
      onCreatePlatformView: (params) {
        return _initAndroidView(
          params,
          hybridComposition: true,
          creationParams: identifier,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
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
