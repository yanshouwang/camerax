import 'dart:ui' as ui;

import 'package:camerax_android/src/camerax_api.g.dart';

extension BitmapProxyApiX on BitmapProxyApi {
  Future<ui.Image> impl() async {
    final stream = ByteArrayOutputStreamProxyApi();
    final ok = await compress(BitmapCompressFormatApi.jpeg, 100, stream);
    if (!ok) throw StateError('compress failed');
    final value = await stream.toByteArray();
    final buffer = await ui.ImmutableBuffer.fromUint8List(value);
    final descriptor = await ui.ImageDescriptor.encoded(buffer);
    final codec = await descriptor.instantiateCodec();
    final frame = await codec.getNextFrame();
    final image = frame.image;
    return image;
  }
}
