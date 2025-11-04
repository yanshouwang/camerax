import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RotationProviderListenerImpl extends RotationProviderListenerApi {
  final RotationProviderListenerApi api;

  RotationProviderListenerImpl.internal(this.api) : super.impl();

  factory RotationProviderListenerImpl({
    required void Function(int rotation) onRotationChanged,
  }) {
    final api = RotationProviderListenerApi(
      onRotationChanged: (_, e) => onRotationChanged(e),
    );
    return RotationProviderListenerImpl.internal(api);
  }
}

final class RotationProviderImpl extends RotationProviderApi {
  final RotationProviderApi api;

  RotationProviderImpl.internal(this.api) : super.impl();

  factory RotationProviderImpl() {
    final api = RotationProviderApi();
    return RotationProviderImpl.internal(api);
  }

  @override
  Future<void> addListener(RotationProviderListenerApi listener) =>
      api.addListener(listener.api);

  @override
  Future<void> removeListener(RotationProviderListenerApi listener) =>
      api.removeListener(listener.api);
}

extension RotationProviderListenerX on RotationProviderListenerApi {
  RotationProviderListenerApi get api {
    final impl = this;
    if (impl is! RotationProviderListenerImpl) throw TypeError();
    return impl.api;
  }
}
