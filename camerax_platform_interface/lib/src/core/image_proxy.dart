import 'image_format.dart';
import 'plane_proxy.dart';

abstract interface class ImageProxy {
  ImageFormat get format;
  int get width;
  int get height;
  int get rotationDegrees;
  List<PlaneProxy> get planeProxies;
  int get timestamp;

  void close();
}
