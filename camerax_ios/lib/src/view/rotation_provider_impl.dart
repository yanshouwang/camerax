import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RotationProviderListenerImpl extends RotationProviderListener {
  final RotationProviderListenerProxyApi api;

  RotationProviderListenerImpl.internal(this.api) : super.impl();

  factory RotationProviderListenerImpl({
    required void Function(SurfaceRotation rotation) onRotationChanged,
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
  Future<void> addListener(RotationProviderListener listener) =>
      api.addListener(listener.api);

  @override
  Future<void> removeListener(RotationProviderListener listener) =>
      api.removeListener(listener.api);
}

extension RotationProviderListenerX on RotationProviderListener {
  RotationProviderListenerProxyApi get api {
    final impl = this;
    if (impl is! RotationProviderListenerImpl) throw TypeError();
    return impl.api;
  }
}
