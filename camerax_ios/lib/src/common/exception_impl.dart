import 'package:flutter/services.dart';

extension ExceptionApiX on List<Object?> {
  Object get impl => PlatformException(
    code: this[0] as String,
    message: this[1] as String?,
    details: this[2],
  );
}
