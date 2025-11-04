import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller_impl.dart';

final class PreviewViewImpl extends PreviewViewApi {
  final PreviewViewApi api;

  PreviewViewImpl.internal(this.api) : super.impl();

  factory PreviewViewImpl() {
    final api = PreviewViewApi();
    return PreviewViewImpl.internal(api);
  }

  @override
  Future<void> setController(CameraControllerApi controller) =>
      api.setController(controller.api);

  @override
  Widget build(BuildContext context) => PlatformViewLink(
    viewType: 'camerax.zeekr.dev/PreviewView',
    surfaceFactory: (context, controller) {
      return AndroidViewSurface(
        controller: controller as AndroidViewController,
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        gestureRecognizers: const {},
      );
    },
    onCreatePlatformView: (params) {
      final identifier = api.pigeon_instanceManager.getIdentifier(api);
      return _initAndroidView(
          params,
          hybridComposition: false,
          creationParams: identifier,
          creationParamsCodec: const StandardMessageCodec(),
        )
        ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
        ..create();
    },
  );

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
