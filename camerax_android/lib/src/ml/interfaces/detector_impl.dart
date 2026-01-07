import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class DetectorImpl<T> extends CloseableImpl
    implements Detector<T> {}
