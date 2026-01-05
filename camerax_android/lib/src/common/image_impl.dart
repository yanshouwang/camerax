import 'dart:ui' as ui;

import 'package:camerax_android/src/api.dart';

extension BitmapProxyApiX on BitmapProxyApi {
  Future<ui.Image> impl() async {
    final stream = ByteArrayOutputStreamProxyApi();
    final format = await BitmapUtilProxyApi.toCompressFormat(
      BitmapCompressFormatApi.jpeg,
    );
    final ok = await compress(format, 100, stream);
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
