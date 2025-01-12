import 'ml_object.dart';

abstract base class MlBodyObject extends MlObject {
  final int id;

  MlBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required this.id,
  });
}
