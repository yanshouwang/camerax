import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class InputImageImpl implements InputImage {
  final InputImageProxyApi api;

  InputImageImpl.internal(this.api);

  @override
  Future<int> getWidth() => api.getWidth();
  @override
  Future<int> getHeight() => api.getHeight();
}

final class InputImageChannelImpl extends InputImageChannel {
  @override
  InputImage fromFilePath(Uri imageUri) {
    final api = InputImageProxyApi.fromFilePath(imageUri: '$imageUri');
    return InputImageImpl.internal(api);
  }
}

extension InputImageX on InputImage {
  InputImageProxyApi get api {
    final impl = this;
    if (impl is! InputImageImpl) throw TypeError();
    return impl.api;
  }

  Future<Size<int>> getSize() async {
    final width = await getWidth();
    final height = await getHeight();
    return Size(width, height);
  }
}
