import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'permission.dart';

abstract base class PermissionManager extends PlatformInterface {
  static final _token = Object();

  factory PermissionManager() {
    final instance = CameraX.instance.createPermissionManager();
    PlatformInterface.verify(instance, _token);
    return instance;
  }

  @protected
  PermissionManager.impl() : super(token: _token);

  Future<bool> checkPermission(Permission permission);
  Future<bool> requestPermissions(List<Permission> permissions);
}
