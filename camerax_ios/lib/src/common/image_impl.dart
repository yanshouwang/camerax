import 'dart:ui' as ui;

import 'package:camerax_ios/src/camerax_api.g.dart';

extension BitmapProxyApiX on CGImageProxyApi {
  Future<ui.Image> impl() => throw UnimplementedError();
  //  async {
  //   final buffer = await ui.ImmutableBuffer.fromUint8List(value);
  //   final descriptor = await ui.ImageDescriptor.encoded(buffer);
  //   final codec = await descriptor.instantiateCodec();
  //   final frame = await codec.getNextFrame();
  //   final image = frame.image;
  //   return image;
  // }
}
