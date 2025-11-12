import 'flash_state.dart';

abstract base class ImageInfo {
  ImageInfo.impl();

  FlashState get flashState;
  int get rotationDegrees;
  int get timestamp;
}
