import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension SizeX on Size {
  SizeApi get api {
    return SizeApi(
      width: width,
      height: height,
    );
  }
}

extension SizeApiX on SizeApi {
  Size get impl {
    return Size(width, height);
  }
}
