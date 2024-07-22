import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MLHumanFullBodyObject extends MLBodyObject {
  MLHumanFullBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MLObjectType get type => MLObjectType.humanFullBody;
}
