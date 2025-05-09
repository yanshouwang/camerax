import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'permission.dart';

final _token = Object();

abstract interface class PermissionManager {
  factory PermissionManager() {
    final instance = CameraXPlugin.instance.newPermissionManager();
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}

abstract base class PermissionManagerChannel extends PlatformInterface
    implements PermissionManager {
  PermissionManagerChannel.impl() : super(token: _token);
}
