import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MlCatBodyObject extends MlBodyObject {
  MlCatBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MlObjectType get type => MlObjectType.catBody;
}
