import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RotationProvider$ListenerImpl implements RotationProvider$Listener {
  final RotationProviderListenerProxyApi api;

  RotationProvider$ListenerImpl.internal(this.api);
}

final class RotationProviderImpl implements RotationProvider {
  final RotationProviderProxyApi api;

  RotationProviderImpl.internal(this.api);

  @override
  Future<void> addListener(RotationProvider$Listener listener) =>
      api.addListener(listener.api);

  @override
  Future<void> removeListener(RotationProvider$Listener listener) =>
      api.removeListener(listener.api);
}

final class RotationProviderChannelImpl extends RotationProviderChannel {
  @override
  RotationProvider$Listener createListener({
    required void Function(Surface$Rotation rotation) onRotationChanged,
  }) {
    final api = RotationProviderListenerProxyApi(
      onRotationChanged: (_, e) => onRotationChanged(e.impl),
    );
    return RotationProvider$ListenerImpl.internal(api);
  }

  @override
  RotationProvider create() {
    final api = RotationProviderProxyApi();
    return RotationProviderImpl.internal(api);
  }
}

extension RotationProvider$ListenerX on RotationProvider$Listener {
  RotationProviderListenerProxyApi get api {
    final impl = this;
    if (impl is! RotationProvider$ListenerImpl) throw TypeError();
    return impl.api;
  }
}
