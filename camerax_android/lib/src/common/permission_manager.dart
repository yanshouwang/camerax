// import 'package:camerax_android/src/jni.dart' as $native;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart'
//     as $interface;
// import 'package:jni/jni.dart' as $native;

// final class PermissionManager extends $interface.PermissionManager {
//   final $native.PermissionManager obj;

//   PermissionManager.$native(this.obj) : super.impl();

//   factory PermissionManager() {
//     final obj = $native.PermissionManager.INSTANCE!;
//     return PermissionManager.$native(obj);
//   }

//   @override
//   Future<bool> checkPermission($interface.Permission permission) async {
//     final isGranted = obj.checkPermission(permission.obj);
//     return isGranted;
//   }

//   @override
//   Future<bool> requestPermissions(
//       List<$interface.Permission> permissions) async {
//     final permissionObjs = permissions
//         .map((permission) => permission.obj)
//         .toJList($native.PermissionManager$Permission.type);
//     final isGrantedObj = await obj.requestPermissions(permissionObjs);
//     return isGrantedObj.booleanValue(
//       releaseOriginal: true,
//     );
//   }
// }

// extension PermissionArgs on $interface.Permission {
//   $native.PermissionManager$Permission get obj {
//     switch (this) {
//       case $interface.Permission.album:
//         return $native.PermissionManager$Permission.ALBUM!;
//       case $interface.Permission.audio:
//         return $native.PermissionManager$Permission.AUDIO!;
//       case $interface.Permission.video:
//         return $native.PermissionManager$Permission.VIDEO!;
//     }
//   }
// }
