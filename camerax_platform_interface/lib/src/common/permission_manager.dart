import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'permission.dart';

abstract base class PermissionManager {
  static PermissionManager get instance =>
      CameraXPlugin.instance.$PermissionManagerApiInstance;

  PermissionManager.impl();

  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}
