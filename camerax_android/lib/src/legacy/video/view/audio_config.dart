import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension AudioConfigArgs on $interface.AudioConfig {
  $native.AudioConfig get obj {
    return $native.AudioConfig.create(
      enableAudio: audioEnabled,
    );
  }
}
