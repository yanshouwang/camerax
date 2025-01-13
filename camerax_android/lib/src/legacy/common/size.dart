import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension SizeArgs on $base.Size {
  $native.Size get obj {
    return $native.Size(
      width: width,
      height: height,
    );
  }
}

extension SizeObj on $native.Size {
  $base.Size get args {
    return $base.Size(width, height);
  }
}
