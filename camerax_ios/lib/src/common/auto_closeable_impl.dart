import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class AutoCloseableImpl implements AutoCloseable {
  AutoCloseableProxyApi get api;

  @override
  Future<void> close() => api.close();
}
