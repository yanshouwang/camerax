import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ControlModeX on ControlMode {
  ControlModeApi get api {
    switch (this) {
      case ControlMode.auto:
        return ControlModeApi.auto;
      case ControlMode.off:
        return ControlModeApi.off;
      case ControlMode.offKeepState:
        return ControlModeApi.offKeepState;
      case ControlMode.useExtendedSceneMode:
        return ControlModeApi.useExtendedSceneMode;
      case ControlMode.useSceneMode:
        return ControlModeApi.useSceneMode;
    }
  }
}

extension ControlAeModeX on ControlAeMode {
  ControlAeModeApi get api {
    switch (this) {
      case ControlAeMode.off:
        return ControlAeModeApi.off;
      case ControlAeMode.on:
        return ControlAeModeApi.on;
      case ControlAeMode.onAlwaysFlash:
        return ControlAeModeApi.onAlwaysFlash;
      case ControlAeMode.onAutoFlash:
        return ControlAeModeApi.onAutoFlash;
      case ControlAeMode.onAutoFlashRedeye:
        return ControlAeModeApi.onAutoFlashRedeye;
      case ControlAeMode.onExternalFlash:
        return ControlAeModeApi.onExternalFlash;
      case ControlAeMode.onLowLightBoostBrightnessPriority:
        return ControlAeModeApi.onLowLightBoostBrightnessPriority;
    }
  }
}

extension ControlAfModeX on ControlAfMode {
  ControlAfModeApi get api {
    switch (this) {
      case ControlAfMode.auto:
        return ControlAfModeApi.auto;
      case ControlAfMode.continuousPicture:
        return ControlAfModeApi.continuousPicture;
      case ControlAfMode.edof:
        return ControlAfModeApi.edof;
      case ControlAfMode.macro:
        return ControlAfModeApi.macro;
      case ControlAfMode.off:
        return ControlAfModeApi.off;
    }
  }
}

extension ControlAwbModeX on ControlAwbMode {
  ControlAwbModeApi get api {
    switch (this) {
      case ControlAwbMode.auto:
        return ControlAwbModeApi.auto;
      case ControlAwbMode.cloudyDaylight:
        return ControlAwbModeApi.cloudyDaylight;
      case ControlAwbMode.daylight:
        return ControlAwbModeApi.daylight;
      case ControlAwbMode.fluorescent:
        return ControlAwbModeApi.fluorescent;
      case ControlAwbMode.incandesecent:
        return ControlAwbModeApi.incandesecent;
      case ControlAwbMode.off:
        return ControlAwbModeApi.off;
      case ControlAwbMode.shade:
        return ControlAwbModeApi.shade;
      case ControlAwbMode.twilight:
        return ControlAwbModeApi.twilight;
      case ControlAwbMode.warmFluorescent:
        return ControlAwbModeApi.warmFluorescent;
    }
  }
}
