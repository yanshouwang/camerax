import 'dart:ui' as ui;

import 'ml_object_type.dart';

abstract base class MLObject {
  MLObjectType get type;

  final DateTime time;
  final Duration duration;
  final ui.Rect bounds;

  MLObject({
    required this.time,
    required this.duration,
    required this.bounds,
  });
}
