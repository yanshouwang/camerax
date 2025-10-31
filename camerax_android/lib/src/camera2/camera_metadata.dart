import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CameraMetadataControlModeX on CameraMetadataControlMode {
  CameraMetadataControlModeApi get api =>
      CameraMetadataControlModeApi.values[index];
}

extension CameraMetadataControlAeModeX on CameraMetadataControlAeMode {
  CameraMetadataControlAeModeApi get api =>
      CameraMetadataControlAeModeApi.values[index];
}

extension CameraMetadataControlAfModeX on CameraMetadataControlAfMode {
  CameraMetadataControlAfModeApi get api =>
      CameraMetadataControlAfModeApi.values[index];
}

extension CameraMetadataControlAwbModeX on CameraMetadataControlAwbMode {
  CameraMetadataControlAwbModeApi get api =>
      CameraMetadataControlAwbModeApi.values[index];
}
