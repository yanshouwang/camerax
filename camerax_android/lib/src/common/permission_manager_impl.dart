import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PermissionManagerImpl extends PermissionManager {
  final PermissionManagerProxyApi api;

  PermissionManagerImpl.internal(this.api) : super.impl();

  factory PermissionManagerImpl() {
    final api = PermissionManagerProxyApi.instance;
    return PermissionManagerImpl.internal(api);
  }

  @override
  Future<bool> checkPermission(PermissionManagerPermission permission) =>
      api.checkPermissioin(permission.api);

  @override
  Future<bool> requestPermissions(
    List<PermissionManagerPermission> permissions,
  ) => api.requestPermissions(permissions.map((e) => e.api).toList());
}

extension PermissionManagerPermissionX on PermissionManagerPermission {
  PermissionManagerPermissionApi get api =>
      PermissionManagerPermissionApi.values[index];
}
