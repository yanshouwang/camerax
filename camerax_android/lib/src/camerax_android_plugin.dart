import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import 'core.dart';
import 'jni.dart' as jni;
import 'ml.dart';
import 'video.dart';
import 'view.dart';

final class CameraXAndroidPlugin extends CameraXPlugin {
  static void registerWith() {
    CameraXPlugin.instance = CameraXAndroidPlugin();
  }

  @override
  PermissionManager get permissionManager => PermissionManagerImpl();

  @override
  CameraSelector createCameraSelector({
    LensFacing? lensFacing,
  }) {
    return CameraSelectorImpl(
      lensFacing: lensFacing,
    );
  }

  @override
  CameraController createCameraController() {
    return CameraControllerImpl();
  }

  @override
  ResolutionSelector createResolutionSelector({
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionMode? allowedResolutionMode,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) {
    throw UnimplementedError();
    // return MyResolutionSelector(
    //   aspectRatioStrategy: aspectRatioStrategy,
    //   allowedResolutionMode: allowedResolutionMode,
    //   resolutionFilter: resolutionFilter,
    //   resolutionStrategy: resolutionStrategy,
    // );
  }

  @override
  FallbackStrategy createFallbackStrategyHigherQualityOrLowerThan(
      Quality quality) {
    throw UnimplementedError();
    // return MyFallbackStrategy.higherQualityOrLowerThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyHigherQualityThan(Quality quality) {
    throw UnimplementedError();
    // return MyFallbackStrategy.higherQualityThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityOrHigherThan(
      Quality quality) {
    throw UnimplementedError();
    // return MyFallbackStrategy.lowerQualityOrHigherThan(quality);
  }

  @override
  FallbackStrategy createFallbackStrategyLowerQualityThan(Quality quality) {
    throw UnimplementedError();
    // return MyFallbackStrategy.lowerQualityThan(quality);
  }

  @override
  QualitySelector createQualitySelectorFrom(
    Quality quality, {
    FallbackStrategy? fallbackStrategy,
  }) {
    throw UnimplementedError();
    // return MyQualitySelector.from(
    //   quality,
    //   fallbackStrategy: fallbackStrategy,
    // );
  }

  @override
  QualitySelector createQualitySelectorFromOrderedList(
    List<Quality> qualities, {
    FallbackStrategy? fallbackStrategy,
  }) {
    throw UnimplementedError();
    // return MyQualitySelector.fromOrderedList(
    //   qualities,
    //   fallbackStrategy: fallbackStrategy,
    // );
  }

  @override
  MLAnalyzer createMLAnalyzer({
    required List<MLObjectType> types,
    required CoordinateSystem targetCoordinateSystem,
    required MLObjectsCallback onAnalyzed,
  }) {
    throw UnimplementedError();
    // return MyMLAnalyzer(
    //   types: types,
    //   targetCoordinateSystem: targetCoordinateSystem,
    //   onAnalyzed: onAnalyzed,
    // );
  }

  @override
  Widget buildPreviewView({
    required CameraController controller,
    required BoxFit fit,
  }) {
    // return AndroidView(
    //   viewType: 'camerax.hebei.dev/PreviewView',
    //   onPlatformViewCreated: (id) async {
    //     final viewObj = jni.PreviewView$Factory.INSTANCE!.retrieveView(id);
    //     if (viewObj == null) {
    //       return;
    //     }
    //     if (controller is! CameraControllerImpl) {
    //       throw TypeError();
    //     }
    //     final logger = Logger('PreviewView');
    //     logger.info('begin setController');
    //     await viewObj.setController(controller.obj);
    //     logger.info('end SetController');
    //   },
    // );

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
        return _initAndroidView(
          params,
          hybridComposition: true,
          creationParams: null,
          creationParamsCodec: const StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(
            (id) async {
              params.onPlatformViewCreated(id);
              final viewObj =
                  jni.PreviewView$Factory.INSTANCE!.retrieveView(id);
              if (viewObj == null) {
                return;
              }
              if (controller is! CameraControllerImpl) {
                throw TypeError();
              }
              final logger = Logger('PreviewView');
              logger.info('begin setController');
              await viewObj.setController(controller.obj);
              logger.info('end SetController');
            },
          )
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
