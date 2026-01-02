import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PermissionManagerImpl implements PermissionManager {
  final PermissionManagerProxyApi api;

  PermissionManagerImpl.internal(this.api);

  @override
  Future<bool> checkPermission(PermissionManager$Permission permission) =>
      api.checkPermissioin(permission.api);

  @override
  Future<bool> requestPermissions(
    List<PermissionManager$Permission> permissions,
  ) => api.requestPermissions(permissions.map((e) => e.api).toList());
}

final class PermissionManagerChannelImpl extends PermissionManagerChannel {
  @override
  PermissionManager create() {
    final api = PermissionManagerProxyApi.instance;
    return PermissionManagerImpl.internal(api);
  }
}

extension PermissionManager$PermissionX on PermissionManager$Permission {
  PermissionManagerPermissionApi get api =>
      PermissionManagerPermissionApi.values[index];
}
