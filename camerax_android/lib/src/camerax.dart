import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'jni.dart';
import 'jni.g.dart' as jni;

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  Widget buildPreviewView(
    BuildContext context, {
    required CameraController controller,
    required ScaleType scaleType,
    required PlatformViewCreatedCallback onPreviewViewCreated,
  }) {
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
          creationParams: null,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(
            (id) {
              params.onPlatformViewCreated(id);
              onPreviewViewCreated(id);
            },
          )
          ..create();
      },
    );
  }

  @override
  Future<void> setPreviewViewController(
    int id,
    CameraController controller,
  ) async {
    if (controller is! CameraControllerImpl) {
      throw TypeError();
    }
    final view = jni.PreviewViewFactory.INSTANCE.retrieveView(id);
    if (view.isNull) {
      throw ArgumentError.notNull();
    }
    await view.setControllerOnMainThread(controller.jniValue);
  }

  @override
  Future<void> setPreviewViewScaleType(int id, ScaleType scaleType) async {
    final view = jni.PreviewViewFactory.INSTANCE.retrieveView(id);
    if (view.isNull) {
      throw ArgumentError.notNull();
    }
    await view.setScaleTypeOnMainThread(scaleType.jniValue);
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
