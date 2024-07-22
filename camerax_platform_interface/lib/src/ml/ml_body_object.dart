import 'ml_object.dart';

abstract base class MLBodyObject extends MLObject {
  final int id;

  MLBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required this.id,
  });
}
