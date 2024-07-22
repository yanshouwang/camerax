import 'ml_object.dart';
import 'ml_object_type.dart';

final class MLSalientObject extends MLObject {
  final int id;

  MLSalientObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required this.id,
  });

  @override
  MLObjectType get type => MLObjectType.salientObject;
}
