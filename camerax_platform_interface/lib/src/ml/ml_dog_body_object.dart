import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MlDogBodyObject extends MlBodyObject {
  MlDogBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MlObjectType get type => MlObjectType.dogBody;
}
