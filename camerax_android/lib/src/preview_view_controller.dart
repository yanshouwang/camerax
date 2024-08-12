import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'jni.dart';
import 'jni.g.dart' as jni;

final class MyPreviewViewController implements PreviewViewController {
  int? _id;

  @override
  Widget build(
    BuildContext context, {
    required PlatformViewCreatedCallback onCreated,
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
              _id = id;
              onCreated(id);
            },
          )
          ..create();
      },
    );
  }

  @override
  Future<void> setController(CameraController? controller) async {
    if (controller is! MyCameraController) {
      throw TypeError();
    }
    final id = _id;
    if (id == null) {
      return;
    }
    final view = jni.MyPreviewView_MyFactory.INSTANCE.retrieveView(id);
    if (view.isNull) {
      throw ArgumentError.notNull();
    }
    await view.setControllerOnMainThread(controller.jniValue);
  }

  @override
  Future<void> setScaleType(ScaleType scaleType) async {
    final id = _id;
    if (id == null) {
      return;
    }
    final view = jni.MyPreviewView_MyFactory.INSTANCE.retrieveView(id);
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
