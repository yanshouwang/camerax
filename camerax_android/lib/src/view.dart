import 'package:flutter/foundation.dart';

import 'object.dart';

/// The basic building block for user interface components.
///
/// See https://developer.android.com/reference/android/view/View.
class AndroidView extends AndroidObject {
  /// Instantiates a [AndroidView] without creating and attaching to an
  /// instance of the associated native class.
  ///
  /// This should only be used outside of tests by subclasses created by this
  /// library or to create a copy for an [InstanceManager].
  @protected
  AndroidView.detached() : super.detached();

  @override
  AndroidView copy() {
    return AndroidView.detached();
  }
}
