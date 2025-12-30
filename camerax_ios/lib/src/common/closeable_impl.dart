import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'auto_closeable_impl.dart';

abstract base class CloseableImpl extends AutoCloseableImpl
    implements Closeable {
  @override
  CloseableProxyApi get api;
}
