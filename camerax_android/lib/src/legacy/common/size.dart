import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension SizeArgs on $interface.Size {
  $native.Size get obj {
    return $native.Size(
      width: width,
      height: height,
    );
  }
}

extension SizeObj on $native.Size {
  $interface.Size get args {
    return $interface.Size(width, height);
  }
}
