// import 'dart:typed_data';
// import 'dart:ui' as ui;

// extension ImageApiX on CGImageProxyApi {
//   Future<ui.Image> impl() async {
//     final buffer = await ui.ImmutableBuffer.fromUint8List(this);
//     final descriptor = await ui.ImageDescriptor.encoded(buffer);
//     final codec = await descriptor.instantiateCodec();
//     final frame = await codec.getNextFrame();
//     final image = frame.image;
//     return image;
//   }
// }
