import 'ml_object.dart';
import 'ml_object_type.dart';

final class MLFaceObject extends MLObject {
  final int id;
  final double rollAngle;
  final double yawAngle;
  final double pitchAngle;

  MLFaceObject({
    required super.time,
    required super.duration,
    required super.bounds,
    required this.id,
    required this.rollAngle,
    required this.yawAngle,
    required this.pitchAngle,
  });

  @override
  MLObjectType get type => MLObjectType.face;
}
