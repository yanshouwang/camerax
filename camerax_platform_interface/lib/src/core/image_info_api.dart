import 'flash_state_api.dart';

abstract base class ImageInfoApi {
  ImageInfoApi.impl();

  FlashState get flashState;
  int get rotationDegrees;
  int get timestamp;
}
