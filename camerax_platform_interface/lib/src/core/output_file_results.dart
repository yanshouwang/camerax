import 'image_format.dart';

final class OutputFileResults {
  final ImageFormat imageFormat;
  final Uri savedUri;

  const OutputFileResults({
    required this.imageFormat,
    required this.savedUri,
  });
}
