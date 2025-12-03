import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class AudioConfig {
  static AudioConfig get audioDisabled =>
      CameraXPlugin.instance.$AudioConfig$audioDisabled;

  AudioConfig.impl();

  factory AudioConfig.create(bool enableAudio) =>
      CameraXPlugin.instance.$AudioConfig$create(enableAudio);

  Future<bool> getAudioEnabled();
}
