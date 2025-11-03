import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'permission_impl.dart';

final class PermissionManagerImpl extends PermissionManager {
  final PermissionManagerApi api;

  PermissionManagerImpl.internal(this.api) : super.impl();

  factory PermissionManagerImpl() {
    final api = PermissionManagerApi.instance;
    return PermissionManagerImpl.internal(api);
  }

  @override
  Future<bool> checkPermission(Permission permission) =>
      api.checkPermissioin(permission.api);

  @override
  Future<bool> requestPermissions(List<Permission> permissions) =>
      api.requestPermissions(permissions.map((e) => e.api).toList());
}
