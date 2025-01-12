import 'dart:typed_data';
import 'dart:ui' as ui;

import 'ml_object.dart';
import 'ml_object_type.dart';

final class MlCodeObject extends MlObject {
  @override
  final MlObjectType type;
  final List<ui.Offset> corners;
  final Uint8List? value;
  final String? stringValue;

  MlCodeObject({
    required this.type,
    required super.time,
    required super.duration,
    required super.bounds,
    required this.corners,
    required this.value,
    required this.stringValue,
  });
}
