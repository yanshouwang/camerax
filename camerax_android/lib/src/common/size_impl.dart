import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension SizeX on Size<int> {
  SizeApi get api => SizeApi(width: width, height: height);
}

extension SizeApiX on SizeApi {
  Size<int> get impl => Size(width, height);
}
