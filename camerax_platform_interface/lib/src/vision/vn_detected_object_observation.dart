import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/vision.dart';

abstract interface class VNDetectedObjectObservation implements VNObservation {
  Rect<double> get boundingBox;
}
