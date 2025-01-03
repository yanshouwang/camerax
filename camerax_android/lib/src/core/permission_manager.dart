import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:jni/jni.dart' as jni;

final class PermissionManager extends $interface.PermissionManager {
  final $native.PermissionManager obj;

  PermissionManager.$native(this.obj) : super.impl();

  factory PermissionManager() {
    final obj = $native.PermissionManager.INSTANCE!;
    return PermissionManager.$native(obj);
  }

  @override
  Future<bool> checkPermission($interface.Permission permission) {
    final isGranted = obj.checkPermission(permission.obj);
    return Future.value(isGranted);
  }

  @override
  Future<bool> requestPermissions(
      List<$interface.Permission> permissions) async {
    final jPermissions = permissions
        .map((permission) => permission.obj)
        .toJList($native.PermissionManager$Permission.type);
    final isGrantedObj = await obj.requestPermissions(jPermissions);
    return isGrantedObj.booleanValue(
      releaseOriginal: true,
    );
  }
}

extension on $interface.Permission {
  $native.PermissionManager$Permission get obj {
    switch (this) {
      case $interface.Permission.album:
        return $native.PermissionManager$Permission.ALBUM!;
      case $interface.Permission.audio:
        return $native.PermissionManager$Permission.AUDIO!;
      case $interface.Permission.video:
        return $native.PermissionManager$Permission.VIDEO!;
    }
  }
}
