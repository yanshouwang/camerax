import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'calendar_date_time.dart';

extension CalendarEventObj on $native.CalendarEvent {
  $base.CalendarEvent get args {
    return $base.CalendarEvent(
      start: start?.args,
      end: end?.args,
      location: location,
      organizer: organizer,
      summary: summary,
      description: description,
      status: status,
    );
  }
}
