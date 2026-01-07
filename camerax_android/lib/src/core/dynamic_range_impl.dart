import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class DynamicRangeImpl implements DynamicRange {
  final DynamicRangeProxyApi api;

  DynamicRangeImpl.internal(this.api);

  @override
  Future<DynamicRange$BitDepth> getBitDepth() =>
      api.getBitDepth().then((e) => e.impl);

  @override
  Future<DynamicRange$Encoding> getEncoding() =>
      api.getEncoding().then((e) => e.impl);
}

final class DynamicRangeChannelImpl extends DynamicRangeChannel {
  @override
  DynamicRange get unspecifid =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.unspecifid);
  @override
  DynamicRange get sdr => DynamicRangeImpl.internal(DynamicRangeProxyApi.sdr);
  @override
  DynamicRange get hdrUnspecified10Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.hdrUnspecified10Bit);
  @override
  DynamicRange get hdr10_10Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.hdr10_10Bit);
  @override
  DynamicRange get hdr10Plus10Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.hdr10Plus10Bit);
  @override
  DynamicRange get hlg10Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.hlg10Bit);
  @override
  DynamicRange get dolbyVision8Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.dolbyVision8Bit);
  @override
  DynamicRange get dolbyVision10Bit =>
      DynamicRangeImpl.internal(DynamicRangeProxyApi.dolbyVision10Bit);

  @override
  DynamicRange create({
    required DynamicRange$Encoding encoding,
    required DynamicRange$BitDepth bitDepth,
  }) {
    final api = DynamicRangeProxyApi(
      encoding: encoding.api,
      bitDepth: bitDepth.api,
    );
    return DynamicRangeImpl.internal(api);
  }
}

extension DynamicRange$EncodingX on DynamicRange$Encoding {
  DynamicRangeEncodingApi get api => DynamicRangeEncodingApi.values[index];
}

extension DynamicRangeEncodingApiX on DynamicRangeEncodingApi {
  DynamicRange$Encoding get impl => DynamicRange$Encoding.values[index];
}

extension DynamicRange$BitDepthX on DynamicRange$BitDepth {
  DynamicRangeBitDepthApi get api => DynamicRangeBitDepthApi.values[index];
}

extension DynamicRangeBitDepthApiX on DynamicRangeBitDepthApi {
  DynamicRange$BitDepth get impl => DynamicRange$BitDepth.values[index];
}

extension DynamicRangeX on DynamicRange {
  DynamicRangeProxyApi get api {
    final impl = this;
    if (impl is! DynamicRangeImpl) throw TypeError();
    return impl.api;
  }
}

extension DynamicRangeProxyApiX on DynamicRangeProxyApi {
  DynamicRange get impl => DynamicRangeImpl.internal(this);
}
