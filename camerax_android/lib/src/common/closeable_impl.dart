import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'auto_closeable_impl.dart';

base mixin CloseableImpl on Closeable, AutoCloseableImpl {
  @override
  CloseableProxyApi get api;
}
