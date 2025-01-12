import 'ml_object.dart';
import 'ml_object_type.dart';

final class MlSalientObject extends MlObject {
  final int id;

  MlSalientObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required this.id,
  });

  @override
  MlObjectType get type => MlObjectType.salientObject;
}
