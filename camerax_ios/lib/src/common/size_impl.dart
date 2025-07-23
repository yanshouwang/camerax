import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension SizeX on Size<int> {
  SizeApi get api {
    return SizeApi(width: width, height: height);
  }
}

extension SizeApiX on SizeApi {
  Size<int> get impl {
    return Size(width, height);
  }
}
