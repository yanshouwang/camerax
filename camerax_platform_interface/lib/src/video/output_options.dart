import 'package:camerax_platform_interface/src/common.dart';

abstract interface class OutputOptions {
  Future<Duration> getDurationLimit();
  Future<int> getFileSizeLimit();
  Future<Location?> getLocation();
}
