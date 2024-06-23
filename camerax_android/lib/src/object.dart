import 'package:flutter/foundation.dart';

import 'instance_manager.dart';

/// Root of the Java class hierarchy.
///
/// See https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html.
class AndroidObject with Copyable {
  /// Constructs a [AndroidObject] without creating the associated Java object.
  ///
  /// This should only be used by subclasses created by this library or to
  /// create copies.
  @protected
  AndroidObject.detached();

  int get identifier => InstanceManager.instance.getIdentifier(this)!;

  @override
  AndroidObject copy() {
    return AndroidObject.detached();
  }

  /// Release the reference to a native Java instance.
  void dispose(AndroidObject instance) {
    InstanceManager.instance.removeWeakReference(instance);
  }
}
