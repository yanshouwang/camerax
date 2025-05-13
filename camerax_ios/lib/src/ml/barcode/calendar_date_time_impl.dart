import 'package:camerax_android/src/camerax.g.dart';

extension CalendarDateTimeApiX on CalendarDateTimeApi {
  DateTime get impl {
    return isUtc
        ? DateTime.utc(year, month, day, hours, minutes, seconds)
        : DateTime(year, month, day, hours, minutes, seconds);
  }
}
