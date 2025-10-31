import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RotationProviderListenerImpl extends RotationProviderListener {
  final RotationProviderListenerApi api;

  RotationProviderListenerImpl.internal(this.api) : super.impl();

  factory RotationProviderListenerImpl({
    required void Function(int rotation) onRotationChanged,
  }) {
    final api = RotationProviderListenerApi(
      onRotationChanged: (_, e) => onRotationChanged(e),
    );
    return RotationProviderListenerImpl.api(api);
  }
}

final class RotationProviderImpl extends RotationProvider {
  final RotationProviderApi api;

  RotationProviderImpl.internal(this.api) : super.impl();

  factory RotationProviderImpl() {
    final api = RotationProviderApi();
    return RotationProviderImpl.api(api);
  }

  @override
  Future<void> addListener(RotationProviderListener listener) =>
      api.addListener(listener.api);

  @override
  Future<void> removeListener(RotationProviderListener listener) =>
      api.removeListener(listener.api);
}

extension RotationProviderListenerX on RotationProviderListener {
  RotationProviderListenerApi get api {
    final impl = this;
    if (impl is! RotationProviderListenerImpl) throw TypeError();
    return impl.api;
  }
}
