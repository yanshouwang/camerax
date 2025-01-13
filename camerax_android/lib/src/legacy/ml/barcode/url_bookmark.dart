import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension UrlBookmarkObj on $native.UrlBookmark {
  $base.UrlBookmark get args {
    return $base.UrlBookmark(
      title: title,
      url: url,
    );
  }
}
