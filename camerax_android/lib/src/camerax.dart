import 'dart:ui';

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
    return AndroidCameraController();
  }

  @override
  Widget buildPreview(
    BuildContext context, {
    required CameraController controller,
    required ScaleType scaleType,
  }) {
    if (controller is! AndroidCameraController) {
      throw TypeError();
    }
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
              _onPlatformViewCreated(
                id,
                controller.jniValue,
                scaleType.jniValue,
              );
            },
          )
          ..create();
      },
    );
  }
}

void _onPlatformViewCreated(
  int id,
  jni.CameraController controller,
  jni.PreviewView_ScaleType scaleType,
) async {
  await runOnPlatformThread(() {
    final view = jni.PreviewViewFactory.INSTANCE.retrieveView(id);
    view.setController(controller);
    view.setScaleType(scaleType);
  });
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
