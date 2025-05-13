import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension UrlBookmarkApiX on UrlBookmarkApi {
  UrlBookmark get impl {
    return UrlBookmark(
      title: title,
      url: url,
    );
  }
}
