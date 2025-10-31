import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension MirrorModeX on MirrorMode {
  MirrorModeApi get api => MirrorModeApi.values[index];
}

extension MirrorModeApiX on MirrorModeApi {
  MirrorMode get impl => MirrorMode.values[index];
}
