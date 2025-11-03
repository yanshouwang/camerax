import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PermissionX on Permission {
  PermissionApi get api => PermissionApi.values[index];
}
