// import 'package:camerax_android/src/jni.dart' as $native;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart'
//     as $interface;

// final class CameraSelector extends $interface.CameraSelector {
//   final $native.CameraSelector obj;

//   CameraSelector.$native(this.obj) : super.impl();

//   factory CameraSelector({
//     $interface.LensFacing? lensFacing,
//   }) {
//     final builderObj = $native.CameraSelector$Builder.new$1();
//     if (lensFacing != null) {
//       builderObj.requireLensFacing(lensFacing.obj);
//     }
//     final obj = builderObj.build();
//     return CameraSelector.$native(obj);
//   }

//   @override
//   int get hashCode => obj.hashCode;

//   @override
//   bool operator ==(Object other) => other is CameraSelector && obj == other.obj;
// }

// extension LensFacingArgs on $interface.LensFacing {
//   $native.CameraSelector$LensFacing get obj {
//     switch (this) {
//       case $interface.LensFacing.unknown:
//         return $native.CameraSelector$LensFacing.UNKNOWN!;
//       case $interface.LensFacing.front:
//         return $native.CameraSelector$LensFacing.FRONT!;
//       case $interface.LensFacing.back:
//         return $native.CameraSelector$LensFacing.BACK!;
//       case $interface.LensFacing.external:
//         return $native.CameraSelector$LensFacing.EXTERNAL!;
//     }
//   }
// }
