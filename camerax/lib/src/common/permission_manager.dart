import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

class PermissionManager {
  final $base.PermissionManager obj;

  PermissionManager() : obj = $base.PermissionManager();

  Future<bool> checkPermission($base.Permission permission) async {
    final isGranted = await obj.checkPermission(permission);
    return isGranted;
  }

  Future<bool> requestPermissions(List<$base.Permission> permissions) async {
    final isGranted = await obj.requestPermissions(permissions);
    return isGranted;
  }
}
