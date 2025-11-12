import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

abstract base class RotationProviderListener {
  RotationProviderListener.impl();

  factory RotationProviderListener({
    required void Function(SurfaceRotation rotation) onRotationChanged,
  }) => CameraXPlugin.instance.$RotationProviderListener(
    onRotationChanged: onRotationChanged,
  );
}

abstract base class RotationProvider {
  RotationProvider.impl();

  factory RotationProvider() => CameraXPlugin.instance.$RotationProvider();

  Future<void> addListener(RotationProviderListener listener);
  Future<void> removeListener(RotationProviderListener listener);
}
