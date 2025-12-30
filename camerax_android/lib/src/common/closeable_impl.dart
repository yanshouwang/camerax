import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class CloseableImpl extends AutoCloseableImpl
    implements Closeable {
  @override
  CloseableProxyApi get api;
}
