import 'package:flutter/services.dart';

extension ThrowableApiX on List<Object?> {
  Object get impl {
    return PlatformException(
      code: this[0] as String,
      message: this[1] as String?,
      details: this[2],
    );
  }
}
