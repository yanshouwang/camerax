import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class RotationProviderListenerApi {
  RotationProviderListenerApi.impl();

  factory RotationProviderListenerApi({
    required void Function(int rotation) onRotationChanged,
  }) => CameraXPlugin.instance.$RotationProviderListenerApi(
    onRotationChanged: onRotationChanged,
  );
}

abstract base class RotationProviderApi {
  RotationProviderApi.impl();

  factory RotationProviderApi() => CameraXPlugin.instance.$RotationProviderApi();

  Future<void> addListener(RotationProviderListenerApi listener);
  Future<void> removeListener(RotationProviderListenerApi listener);
}
