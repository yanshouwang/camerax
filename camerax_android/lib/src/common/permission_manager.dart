import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:jni/jni.dart' as $native;

final class PermissionManager extends $base.PermissionManager {
  final $native.PermissionManager obj;

  PermissionManager.$native(this.obj) : super.impl();

  factory PermissionManager() {
    final obj = $native.PermissionManager.INSTANCE!;
    return PermissionManager.$native(obj);
  }

  @override
  Future<bool> checkPermission($base.Permission permission) async {
    return obj.checkPermission(permission.obj);
  }

  @override
  Future<bool> requestPermissions(List<$base.Permission> permissions) async {
    final permissionObjs = permissions
        .map((permission) => permission.obj)
        .toJList($native.PermissionManager$Permission.type);
    final isGrantedObj = await obj.requestPermissions(permissionObjs);
    return isGrantedObj.booleanValue(
      releaseOriginal: true,
    );
  }
}

extension PermissionArgs on $base.Permission {
  $native.PermissionManager$Permission get obj {
    switch (this) {
      case $base.Permission.album:
        return $native.PermissionManager$Permission.ALBUM!;
      case $base.Permission.audio:
        return $native.PermissionManager$Permission.AUDIO!;
      case $base.Permission.video:
        return $native.PermissionManager$Permission.VIDEO!;
    }
  }
}
