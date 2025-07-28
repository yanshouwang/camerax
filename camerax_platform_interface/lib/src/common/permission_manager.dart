import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'permission.dart';

abstract base class PermissionManager {
  PermissionManager.impl();

  factory PermissionManager() => CameraXPlugin.instance.newPermissionManager();

  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}
