import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CameraViewBuilder extends core.CameraViewBuilder {
  @override
  Widget build({required String id, required String viewType}) {
    return PlatformViewLink(
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          gestureRecognizers: const {},
        );
      },
      onCreatePlatformView: (params) {
        // TODO: change the `hybridComposition` to false after `initSurfaceAndroidView` bug fixed.
        return _createViewController(
          hybridComposition: true,
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: id,
          onFocus: () => params.onFocusChanged(true),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
      viewType: viewType,
    );
  }

  AndroidViewController _createViewController({
    required bool hybridComposition,
    required int id,
    required String viewType,
    required TextDirection layoutDirection,
    required dynamic creationParams,
    required void Function() onFocus,
  }) {
    if (hybridComposition) {
      return PlatformViewsService.initExpensiveAndroidView(
        id: id,
        viewType: viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: onFocus,
      );
    } else {
      return PlatformViewsService.initSurfaceAndroidView(
        id: id,
        viewType: viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: onFocus,
      );
    }
  }
}
