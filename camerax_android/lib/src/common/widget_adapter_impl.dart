import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

base mixin WidgetAdapterImpl implements WidgetAdapter {
  String get viewType;
  int? get identifier;

  @override
  Widget build(BuildContext context, {bool tlhc = false}) {
    return PlatformViewLink(
      viewType: tlhc ? '$viewType.TLHC' : viewType,
      surfaceFactory: (context, controller) => AndroidViewSurface(
        controller: controller as AndroidViewController,
        hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        gestureRecognizers: const {},
      ),
      onCreatePlatformView: (params) =>
          initAndroidView(
              params,
              tlhc: tlhc,
              creationParams: identifier,
              creationParamsCodec: const StandardMessageCodec(),
            )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create(),
    );
  }

  AndroidViewController initAndroidView(
    PlatformViewCreationParams params, {
    required bool tlhc,
    TextDirection layoutDirection = TextDirection.ltr,
    dynamic creationParams,
    MessageCodec<dynamic>? creationParamsCodec,
  }) {
    if (tlhc) {
      return PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: params.viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: creationParamsCodec,
      );
    } else {
      return PlatformViewsService.initExpensiveAndroidView(
        id: params.id,
        viewType: params.viewType,
        layoutDirection: layoutDirection,
        creationParams: creationParams,
        creationParamsCodec: creationParamsCodec,
      );
    }
  }
}
