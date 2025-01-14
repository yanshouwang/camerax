import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

/// A set of requirements and priorities used to select a camera or return a
/// filtered set of cameras.
final class CameraSelector {
  static CameraSelector get front => $base.CameraSelector.front.args;
  static CameraSelector get back => $base.CameraSelector.back.args;
  static CameraSelector get external => $base.CameraSelector.external.args;

  final $base.CameraSelector _obj;

  CameraSelector._native(this._obj);

  CameraSelector({
    $base.LensFacing? lensFacing,
  }) : _obj = $base.CameraSelector(
          lensFacing: lensFacing,
        );

  @internal
  $base.CameraSelector get obj => _obj;
}

extension CameraSelectorObj on $base.CameraSelector {
  @internal
  CameraSelector get args {
    return CameraSelector._native(this);
  }
}
