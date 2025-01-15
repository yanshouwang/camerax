import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

/// A set of requirements and priorities used to select a camera or return a
/// filtered set of cameras.
final class CameraSelector {
  static CameraSelector get front => $interface.CameraSelector.front.args;
  static CameraSelector get back => $interface.CameraSelector.back.args;
  static CameraSelector get external => $interface.CameraSelector.external.args;

  final $interface.CameraSelector _obj;

  CameraSelector._native(this._obj);

  CameraSelector({
    $interface.LensFacing? lensFacing,
  }) : _obj = $interface.CameraSelector(
          lensFacing: lensFacing,
        );

  @internal
  $interface.CameraSelector get obj => _obj;
}

extension CameraSelectorObj on $interface.CameraSelector {
  @internal
  CameraSelector get args {
    return CameraSelector._native(this);
  }
}
