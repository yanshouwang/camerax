import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

class PermissionManager {
  final $interface.PermissionManager obj;

  PermissionManager() : obj = $interface.PermissionManager();

  Future<bool> checkPermission($interface.Permission permission) async {
    final isGranted = await obj.checkPermission(permission);
    return isGranted;
  }

  Future<bool> requestPermissions(
      List<$interface.Permission> permissions) async {
    final isGranted = await obj.requestPermissions(permissions);
    return isGranted;
  }
}
