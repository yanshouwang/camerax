import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin AutoCloseableImpl on AutoCloseable {
  AutoCloseableProxyApi get api;

  @override
  Future<void> close() => api.close();
}
