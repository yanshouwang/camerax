import 'dart:math';

import 'ml_object_type.dart';

abstract base class MLObject {
  MLObjectType get type;

  final DateTime time;
  final Duration duration;
  final Rectangle<int> bounds;

  MLObject({
    required this.time,
    required this.duration,
    required this.bounds,
  });
}
