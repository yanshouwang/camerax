import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CameraMetadataInfoSupportedHardwareLeveApilX
    on CameraMetadataInfoSupportedHardwareLevelApi {
  CameraMetadata$InfoSupportedHardwareLevel get impl =>
      CameraMetadata$InfoSupportedHardwareLevel.values[index];
}

extension CameraMetadataControlModeX on CameraMetadata$ControlMode {
  CameraMetadataControlModeApi get api =>
      CameraMetadataControlModeApi.values[index];
}

extension CameraMetadataControlModeApiX on CameraMetadataControlModeApi {
  CameraMetadata$ControlMode get impl =>
      CameraMetadata$ControlMode.values[index];
}

extension CameraMetadataControlAeModeX on CameraMetadata$ControlAeMode {
  CameraMetadataControlAeModeApi get api =>
      CameraMetadataControlAeModeApi.values[index];
}

extension CameraMetadataControlAeModeApiX on CameraMetadataControlAeModeApi {
  CameraMetadata$ControlAeMode get impl =>
      CameraMetadata$ControlAeMode.values[index];
}

extension CameraMetadataControlAfModeX on CameraMetadata$ControlAfMode {
  CameraMetadataControlAfModeApi get api =>
      CameraMetadataControlAfModeApi.values[index];
}

extension CameraMetadataControlAfModeApiX on CameraMetadataControlAfModeApi {
  CameraMetadata$ControlAfMode get impl =>
      CameraMetadata$ControlAfMode.values[index];
}

extension CameraMetadataControlAwbModeX on CameraMetadata$ControlAwbMode {
  CameraMetadataControlAwbModeApi get api =>
      CameraMetadataControlAwbModeApi.values[index];
}

extension CameraMetadataControlAwbModeApiX on CameraMetadataControlAwbModeApi {
  CameraMetadata$ControlAwbMode get impl =>
      CameraMetadata$ControlAwbMode.values[index];
}
