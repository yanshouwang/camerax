import 'package:camerax_platform_interface/src/common.dart';

abstract base class OutputOptionsApi {
  OutputOptionsApi.impl();

  Future<int> getDurationLimitMillis();
  Future<int> getFileSizeLimit();
  Future<Location?> getLocation();
}
