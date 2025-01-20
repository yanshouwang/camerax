import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

base mixin Analyzer on $interface.Analyzer {
  $native.Analyzer get obj;
}
