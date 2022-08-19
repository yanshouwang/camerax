abstract class UseCase {}

abstract class Preview extends UseCase {
  String get viewId;

  factory Preview({required String viewId}) => _Preview(viewId: viewId);
}

abstract class ImageAnalysis extends UseCase {}

abstract class ImageCapture extends UseCase {}

abstract class VideoCapture extends UseCase {}

class _Preview implements Preview {
  @override
  final String viewId;

  _Preview({required this.viewId});
}
