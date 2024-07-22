import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MLDogBodyObject extends MLBodyObject {
  MLDogBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MLObjectType get type => MLObjectType.dogBody;
}
