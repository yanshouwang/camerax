import 'camera_facing.dart';

abstract class CameraSelector {
  CameraFacing get facing;

  factory CameraSelector(CameraFacing facing) => _CameraSelector(facing);

  static CameraSelector get back => CameraSelector(CameraFacing.back);
  static CameraSelector get front => CameraSelector(CameraFacing.front);
}

class _CameraSelector implements CameraSelector {
  @override
  final CameraFacing facing;

  _CameraSelector(this.facing);
}
