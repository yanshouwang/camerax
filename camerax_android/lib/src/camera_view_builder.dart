import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const viewType = 'dev.yanshouwang.camerax/camera_view';

class CameraViewBuilder extends core.CameraViewBuilder {
  @override
  Widget build({
    required core.CameraViewArguments arguments,
    core.CameraViewCreatedCallback? onCreated,
  }) {
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
          creationParams: arguments.writeToBuffer(),
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () => params.onFocusChanged(true),
        )
          ..addOnPlatformViewCreatedListener((id) {
            params.onPlatformViewCreated(id);
            if (onCreated != null) {
              onCreated(id);
            }
          })
          ..create();
      },
      viewType: viewType,
    );
  }
}
