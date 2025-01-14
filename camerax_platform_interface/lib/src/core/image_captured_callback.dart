import 'dart:ui' as ui;

import 'image_proxy.dart';
import 'output_file_results.dart';

typedef CaptureProcessProgressedCallback = void Function(int progress);
typedef CaptureStartedCallback = void Function();
typedef CaptureErrorCallback = void Function(Object exception);
typedef CaptureSuccessCallback = void Function(ImageProxy image);
typedef ImageSavedCallback = void Function(OutputFileResults outputFileResults);
typedef PostviewBitmapAvailableCallback = void Function(ui.Image bitmap);
