import 'ml_body_object.dart';
import 'ml_object_type.dart';

final class MLCatBodyObject extends MLBodyObject {
  MLCatBodyObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required super.id,
  });

  @override
  MLObjectType get type => MLObjectType.catBody;
}
