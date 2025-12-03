import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class InputImageImpl extends InputImage {
  final InputImageProxyApi api;

  InputImageImpl.internal(this.api) : super.impl();

  factory InputImageImpl.fromFilePath(Uri imageUri) {
    final api = InputImageProxyApi.fromFilePath(imageUri: '$imageUri');
    return InputImageImpl.internal(api);
  }

  @override
  Future<int> getHeight() => api.getHeight();

  @override
  Future<int> getWidth() => api.getWidth();
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
