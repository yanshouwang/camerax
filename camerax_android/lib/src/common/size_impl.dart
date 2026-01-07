import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntSizeX on Size<int> {
  SizeProxyApi get api => SizeProxyApi(width: width, height: height);
}

extension SizeProxyApiX on SizeProxyApi {
  Size<int> get impl => Size(width, height);
}
