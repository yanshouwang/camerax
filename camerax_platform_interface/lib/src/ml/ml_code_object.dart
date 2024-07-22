import 'dart:math';
import 'dart:typed_data';

import 'ml_object.dart';
import 'ml_object_type.dart';

final class MLCodeObject extends MLObject {
  @override
  final MLObjectType type;
  final List<Point<int>> corners;
  final Uint8List? value;
  final String? stringValue;

  MLCodeObject({
    required this.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.corners,
    required this.value,
    required this.stringValue,
  });
}
