import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class RotationProvider$Listener {
  factory RotationProvider$Listener({
    required void Function(Surface$Rotation rotation) onRotationChanged,
  }) => RotationProviderChannel.instance.createListener(
    onRotationChanged: onRotationChanged,
  );
}

abstract interface class RotationProvider {
  factory RotationProvider() => RotationProviderChannel.instance.create();

  Future<void> addListener(RotationProvider$Listener listener);
  Future<void> removeListener(RotationProvider$Listener listener);
}

abstract base class RotationProviderChannel extends PlatformInterface {
  RotationProviderChannel() : super(token: _token);

  static final _token = Object();

  static RotationProviderChannel? _instance;

  static RotationProviderChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(RotationProviderChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  RotationProvider$Listener createListener({
    required void Function(Surface$Rotation rotation) onRotationChanged,
  });

  RotationProvider create();
}
