import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'permission.dart';

abstract interface class PermissionManager {
  factory PermissionManager() => CameraXPlugin.instance.permissionManager;

  bool checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}
