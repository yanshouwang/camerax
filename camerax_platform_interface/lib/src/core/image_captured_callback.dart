import 'dart:ui' as ui;

import 'image_proxy.dart';

typedef CaptureStartedCallback = void Function();
typedef CaptureProcessProgressedCallback = void Function(int progress);
typedef PostviewBitmapAvailableCallback = void Function(ui.Image bitmap);
typedef CaptureSuccessCallback = void Function(ImageProxy image);
typedef CaptureErrorCallback = void Function(Object exception);
