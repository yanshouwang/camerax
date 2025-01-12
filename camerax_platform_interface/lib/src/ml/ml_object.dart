import 'dart:ui' as ui;

import 'ml_object_type.dart';

abstract base class MlObject {
  MlObjectType get type;

  final DateTime time;
  final Duration duration;
  final ui.Rect bounds;

  MlObject({
    required this.time,
    required this.duration,
    required this.bounds,
  });
}
