import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/vision.dart';

abstract interface class VNRectangleObservation
    implements VNDetectedObjectObservation {
  Point<double> get bottomLeft;
  Point<double> get bottomRight;
  Point<double> get topLeft;
  Point<double> get topRight;
}
