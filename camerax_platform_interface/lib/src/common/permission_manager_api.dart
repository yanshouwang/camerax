import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'permission_api.dart';

abstract base class PermissionManagerApi {
  static PermissionManagerApi get instance =>
      CameraXPlugin.instance.$PermissionManagerApiInstance;

  PermissionManagerApi.impl();

  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}
