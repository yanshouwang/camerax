import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraFilterImpl implements CameraFilter {
  final CameraFilterProxyApi api;

  CameraFilterImpl.internal(this.api);
}

final class CameraFilterChannelImpl extends CameraFilterChannel {
  @override
  CameraFilter create({
    required List<CameraInfo> Function(List<CameraInfo> cameraInfos) filter,
  }) {
    final api = CameraFilterProxyApi(
      filter: (_, e) =>
          filter(e.map((e) => e.impl).toList()).map((e) => e.api).toList(),
    );
    return CameraFilterImpl.internal(api);
  }
}

extension CameraFilterX on CameraFilter {
  CameraFilterProxyApi get api {
    final impl = this;
    if (impl is! CameraFilterImpl) throw TypeError();
    return impl.api;
  }
}
