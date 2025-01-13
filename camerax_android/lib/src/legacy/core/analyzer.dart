import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

base mixin Analyzer on $base.Analyzer {
  $native.Analyzer get obj;
}
