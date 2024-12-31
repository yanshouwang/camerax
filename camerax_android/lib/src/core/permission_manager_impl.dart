import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart' as jni;

class PermissionManagerImpl implements PermissionManager {
  static PermissionManagerImpl? _instance;
  final jni.PermissionManager obj;

  PermissionManagerImpl._() : obj = jni.PermissionManager.INSTANCE!;

  factory PermissionManagerImpl() {
    var instance = _instance;
    if (instance == null) {
      _instance = instance = PermissionManagerImpl._();
    }
    return instance;
  }

  @override
  bool checkPermission(Permission permission) {
    final permissionObj = permission.toNative();
    return obj.checkPermission(permissionObj);
  }

  @override
  Future<bool> requestPermissions(List<Permission> permissions) async {
    final jPermissions = permissions
        .map((permission) => permission.toNative())
        .toJList(jni.PermissionManager$Permission.type);
    final isGrantedObj = await obj.requestPermissions(jPermissions);
    return isGrantedObj.booleanValue(
      releaseOriginal: true,
    );
  }
}
