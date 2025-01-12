import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MlHumanBodyObject extends MlBodyObject {
  MlHumanBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MlObjectType get type => MlObjectType.humanBody;
}
