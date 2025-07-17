import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PermissionManagerImpl extends PermissionManager {
  final PermissionManagerApi api;

  PermissionManagerImpl.impl(this.api) : super.impl();

  factory PermissionManagerImpl() {
    final api = PermissionManagerApi.instance;
    return PermissionManagerImpl.impl(api);
  }

  @override
  Future<bool> checkPermission(Permission permission) async {
    final isGranted = await api.checkPermissioin(permission.api);
    return isGranted;
  }

  @override
  Future<bool> requestPermissions(List<Permission> permissions) async {
    final permissionApis = permissions.map((e) => e.api).toList();
    final isGranted = await api.requestPermissions(permissionApis);
    return isGranted;
  }
}

extension PermissionX on Permission {
  PermissionApi get api {
    switch (this) {
      case Permission.video:
        return PermissionApi.video;
      case Permission.audio:
        return PermissionApi.audio;
    }
  }
}
