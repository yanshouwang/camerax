import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class DynamicRangeImpl extends DynamicRangeApi {
  final DynamicRangeProxyApi api;

  DynamicRangeImpl.internal(this.api) : super.impl();

  factory DynamicRangeImpl({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  }) {
    final api = DynamicRangeProxyApi(
      encoding: encoding.api,
      bitDepth: bitDepth.api,
    );
    return DynamicRangeImpl.internal(api);
  }

  @override
  Future<DynamicRangeBitDepth> getBitDepth() =>
      api.getBitDepth().then((e) => e.impl);

  @override
  Future<DynamicRangeEncoding> getEncoding() =>
      api.getEncoding().then((e) => e.impl);
}

extension DynamicRangeEncodingX on DynamicRangeEncoding {
  DynamicRangeEncodingApi get api => DynamicRangeEncodingApi.values[index];
}

extension DynamicRangeEncodingApiX on DynamicRangeEncodingApi {
  DynamicRangeEncoding get impl => DynamicRangeEncoding.values[index];
}

extension DynamicRangeBitDepthX on DynamicRangeBitDepth {
  DynamicRangeBitDepthApi get api => DynamicRangeBitDepthApi.values[index];
}

extension DynamicRangeBitDepthApiX on DynamicRangeBitDepthApi {
  DynamicRangeBitDepth get impl => DynamicRangeBitDepth.values[index];
}

extension DynamicRangeApiX on DynamicRangeApi {
  DynamicRangeProxyApi get api {
    final impl = this;
    if (impl is! DynamicRangeImpl) throw TypeError();
    return impl.api;
  }
}

extension DynamicRangeProxyApiX on DynamicRangeProxyApi {
  DynamicRangeApi get impl => DynamicRangeImpl.internal(this);
}
