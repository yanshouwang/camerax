import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'calendar_date_time.dart';

extension CalendarEventObj on $native.CalendarEvent {
  $interface.CalendarEvent get args {
    return $interface.CalendarEvent(
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
