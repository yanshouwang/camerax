import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CameraViewBuilder extends core.CameraViewBuilder {
  @override
  Widget build({
    required String id,
    core.CameraViewCreatedCallback? onCreated,
  }) {
    const viewType = 'dev.yanshouwang.camerax/camera_view';
    return PlatformViewLink(
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const {},
        );
      },
      onCreatePlatformView: (params) {
        return PlatformViewsService.initExpensiveAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: id,
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () => params.onFocusChanged(true),
        )
          ..addOnPlatformViewCreatedListener((viewId) {
            params.onPlatformViewCreated(viewId);
            onCreated?.call(id);
          })
          ..create();
      },
      viewType: viewType,
    );
  }
}
