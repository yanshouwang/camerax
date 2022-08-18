abstract class UseCase {}

abstract class Preview extends UseCase {
  int get viewId;

  factory Preview({required int viewId}) => _Preview(viewId: viewId);
}

abstract class ImageAnalysis extends UseCase {}

abstract class ImageCapture extends UseCase {}

abstract class VideoCapture extends UseCase {}

class _Preview implements Preview {
  @override
  final int viewId;

  _Preview({required this.viewId});
}
