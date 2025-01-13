import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;

extension CalendarDateTimeObj on $native.CalendarDateTime {
  DateTime get args {
    return isUtc
        ? DateTime.utc(year, month, day, hours, minutes, seconds)
        : DateTime(year, month, day, hours, minutes, seconds);
  }
}
