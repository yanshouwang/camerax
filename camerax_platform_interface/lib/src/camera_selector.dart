import 'lens_facing.dart';

final class CameraSelector {
  final LensFacing lensFacing;

  const CameraSelector({
    required this.lensFacing,
  });

  static const CameraSelector front = CameraSelector(
    lensFacing: LensFacing.front,
  );
  static const CameraSelector back = CameraSelector(
    lensFacing: LensFacing.back,
  );
  static const CameraSelector external = CameraSelector(
    lensFacing: LensFacing.external,
  );
}
