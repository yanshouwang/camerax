import 'flash_state.dart';

abstract base class ImageInfo {
  ImageInfo.impl({
    required this.flashState,
    required this.rotationDegrees,
    required this.timestamp,
  });

  final FlashState flashState;
  final int rotationDegrees;
  final int timestamp;
}
