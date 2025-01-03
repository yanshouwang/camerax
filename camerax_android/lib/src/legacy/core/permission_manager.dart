import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class PermissionManager extends $interface.PermissionManager {
  final $native.PermissionManager obj;

  PermissionManager.$native(this.obj) : super.impl();

  factory PermissionManager() {
    final obj = $native.PermissionManager.instance;
    return PermissionManager.$native(obj);
  }

  @override
  Future<bool> checkPermission($interface.Permission permission) async {
    final isGranted = await obj.checkPermissioin(permission.obj);
    return isGranted;
  }

  @override
  Future<bool> requestPermissions(
      List<$interface.Permission> permissions) async {
    final permissionObjs =
        permissions.map((permission) => permission.obj).toList();
    final isGranted = await obj.requestPermissions(permissionObjs);
    return isGranted;
  }
}

extension on $interface.Permission {
  $native.Permission get obj {
    switch (this) {
      case $interface.Permission.album:
        return $native.Permission.album;
      case $interface.Permission.audio:
        return $native.Permission.audio;
      case $interface.Permission.video:
        return $native.Permission.video;
    }
  }
}
