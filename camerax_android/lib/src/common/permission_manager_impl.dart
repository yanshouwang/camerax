import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'permission_impl.dart';

final class PermissionManagerImpl extends PermissionManagerApi {
  static PermissionManagerImpl get instance {
    final api = PermissionManagerProxyApi.instance;
    return PermissionManagerImpl.internal(api);
  }

  final PermissionManagerProxyApi api;

  PermissionManagerImpl.internal(this.api) : super.impl();

  @override
  Future<bool> checkPermission(Permission permission) =>
      api.checkPermissioin(permission.api);

  @override
  Future<bool> requestPermissions(List<Permission> permissions) =>
      api.requestPermissions(permissions.map((e) => e.api).toList());
}
