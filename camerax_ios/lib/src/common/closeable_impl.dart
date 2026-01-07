import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class CloseableImpl extends AutoCloseableImpl
    implements Closeable {
  @override
  CloseableProxyApi get api;
}
