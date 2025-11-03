import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AudioConfigX on AudioConfig {
  AudioConfigApi get api {
    return AudioConfigApi.create(enableAudio: audioEnabled);
  }
}
