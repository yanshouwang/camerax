import 'package:camerax_platform_interface/camerax_platform_interface.dart';

class CameraSelectorImpl implements CameraSelector {
  @override
  final LensFacing lensFacing;

  CameraSelectorImpl({
    LensFacing? lensFacing,
  }) : lensFacing = lensFacing ?? LensFacing.external;
}
