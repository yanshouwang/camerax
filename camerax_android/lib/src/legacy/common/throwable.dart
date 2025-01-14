import 'package:flutter/services.dart';

extension ThrowableObj on List<Object?> {
  Object get args {
    return PlatformException(
      code: this[0] as String,
      message: this[1] as String?,
      details: this[2],
    );
  }
}
