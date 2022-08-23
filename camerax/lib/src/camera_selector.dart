import 'camera_facing.dart';

abstract class CameraSelector {
  CameraFacing get facing;

  factory CameraSelector(CameraFacing facing) => _CameraSelector(facing);

  static const CameraSelector back = _CameraSelector(CameraFacing.back);
  static const CameraSelector front = _CameraSelector(CameraFacing.front);
}

class _CameraSelector implements CameraSelector {
  @override
  final CameraFacing facing;

  const _CameraSelector(this.facing);

  @override
  operator ==(Object other) {
    return other is CameraSelector && other.facing == facing;
  }

  @override
  int get hashCode => facing.hashCode;
}
