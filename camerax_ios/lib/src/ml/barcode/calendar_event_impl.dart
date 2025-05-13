import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'calendar_date_time_impl.dart';

extension CalendarEventApiX on CalendarEventApi {
  CalendarEvent get impl {
    return CalendarEvent(
      start: start?.impl,
      end: end?.impl,
      location: location,
      organizer: organizer,
      summary: summary,
      description: description,
      status: status,
    );
  }
}
