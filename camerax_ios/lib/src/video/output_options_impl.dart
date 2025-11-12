import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'file_output_options_impl.dart';

base mixin OutputOptionsImpl on OutputOptions {
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
