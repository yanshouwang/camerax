import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class OutputOptionsImpl implements OutputOptions {
  OutputOptionsProxyApi get api;

  @override
  Future<Duration> getDurationLimit() =>
      api.getDurationLimitMillis().then((e) => Duration(milliseconds: e));

  @override
  Future<int> getFileSizeLimit() => api.getFileSizeLimit();

  @override
  Future<Location?> getLocation() => api.getLocation().then((e) => e?.impl);
}

extension OutputOptionsProxyApiX on OutputOptionsProxyApi {
  OutputOptions get impl {
    final api = this;
    if (api is FileOutputOptionsProxyApi) {
      return FileOutputOptionsImpl.internal(api);
    } else {
      throw TypeError();
    }
  }
}
