import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RotationProviderListenerImpl extends RotationProvider$Listener {
  final RotationProviderListenerProxyApi api;

  RotationProviderListenerImpl.internal(this.api) : super.impl();

  factory RotationProviderListenerImpl({
    required void Function(Surface$Rotation rotation) onRotationChanged,
  }) {
    final api = RotationProviderListenerProxyApi(
      onRotationChanged: (_, e) => onRotationChanged(e.impl),
    );
    return RotationProviderListenerImpl.internal(api);
  }
}

final class RotationProviderImpl extends RotationProvider {
  final RotationProviderProxyApi api;

  RotationProviderImpl.internal(this.api) : super.impl();

  factory RotationProviderImpl() {
    final api = RotationProviderProxyApi();
    return RotationProviderImpl.internal(api);
  }

  @override
  Future<void> addListener(RotationProvider$Listener listener) =>
      api.addListener(listener.api);

  @override
  Future<void> removeListener(RotationProvider$Listener listener) =>
      api.removeListener(listener.api);
}

extension RotationProviderListenerX on RotationProvider$Listener {
  RotationProviderListenerProxyApi get api {
    final impl = this;
    if (impl is! RotationProviderListenerImpl) throw TypeError();
    return impl.api;
  }
}
