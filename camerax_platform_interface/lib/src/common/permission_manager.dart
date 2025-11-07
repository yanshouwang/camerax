import 'package:camerax_platform_interface/src/camerax_plugin.dart';

enum PermissionManagerPermission { video, audio }

abstract base class PermissionManager {
  PermissionManager.impl();

  factory PermissionManager() => CameraXPlugin.instance.$PermissionManager();

  Future<bool> checkPermission(PermissionManagerPermission permission);
  Future<bool> requestPermissions(
    List<PermissionManagerPermission> permissions,
  );
}
