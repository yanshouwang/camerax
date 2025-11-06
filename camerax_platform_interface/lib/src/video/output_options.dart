import 'package:camerax_platform_interface/src/common.dart';

abstract base class OutputOptions {
  OutputOptions.impl();

  Future<Duration> getDurationLimit();
  Future<int> getFileSizeLimit();
  Future<Location?> getLocation();
}
