import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension MeteringModeX on MeteringMode {
  MeteringModeApi get api => MeteringModeApi.values[index];
}
