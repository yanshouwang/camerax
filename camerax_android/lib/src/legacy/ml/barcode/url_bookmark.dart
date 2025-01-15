import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension UrlBookmarkObj on $native.UrlBookmark {
  $interface.UrlBookmark get args {
    return $interface.UrlBookmark(
      title: title,
      url: url,
    );
  }
}
