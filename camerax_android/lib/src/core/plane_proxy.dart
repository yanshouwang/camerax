// import 'dart:typed_data';

// import 'package:camerax_android/src/jni.dart' as jni;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class MyPlaneProxy implements PlaneProxy {
//   final jni.ImageProxy_PlaneProxy jniValue;

//   MyPlaneProxy.jni(this.jniValue);

//   @override
//   int get rowStride => jniValue.getRowStride();

//   @override
//   int get pixelStride => jniValue.getPixelStride();

//   @override
//   Uint8List get value => jniValue.getBuffer().asUint8List(
//         releaseOriginal: true,
//       );
// }
