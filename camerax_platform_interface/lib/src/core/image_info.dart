import 'package:camerax_platform_interface/src/core.dart';

abstract interface class ImageInfo {
  FlashState get flashState;
  int get rotationDegrees;
  int get timestamp;
}
