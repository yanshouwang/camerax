import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class RotationProviderListener {
  RotationProviderListener.impl();

  factory RotationProviderListener({
    required void Function(int rotation) onRotationChanged,
  }) => CameraXPlugin.instance.newRotationProviderListener(
    onRotationChanged: onRotationChanged,
  );
}

abstract base class RotationProvider {
  RotationProvider.impl();

  factory RotationProvider() => CameraXPlugin.instance.newRotationProvider();

  Future<void> addListener(RotationProviderListener listener);
  Future<void> removeListener(RotationProviderListener listener);
}
