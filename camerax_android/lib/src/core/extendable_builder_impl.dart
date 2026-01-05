import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class ExtendableBuilderImpl<T> implements ExtendableBuilder<T> {
  ExtendableBuilderProxyApi get api;
}

extension ExtendableBuilderX<T> on ExtendableBuilder<T> {
  ExtendableBuilderProxyApi get api {
    final impl = this;
    if (impl is! ExtendableBuilderImpl) throw TypeError();
    return impl.api;
  }
}
