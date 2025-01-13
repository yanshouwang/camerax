final class CalendarEvent {
  final DateTime? start;
  final DateTime? end;
  final String? location;
  final String? organizer;
  final String? summary;
  final String? description;
  final String? status;

  CalendarEvent({
    required this.start,
    required this.end,
    required this.location,
    required this.organizer,
    required this.summary,
    required this.description,
    required this.status,
  });
}
