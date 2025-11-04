import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class AudioConfigApi {
  static AudioConfigApi get audioDisabled =>
      CameraXPlugin.instance.$AudioConfigApiAudioDisabled;

  AudioConfigApi.impl();

  factory AudioConfigApi.create(bool enableAudio) =>
      CameraXPlugin.instance.$AudioConfigApiCreate(enableAudio);

  Future<bool> getAudioEnabled();
}
