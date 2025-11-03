import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

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

extension DynamicRangeX on DynamicRange {
  DynamicRangeApi get api {
    return DynamicRangeApi(encoding: encoding.api, bitDepth: bitDepth.api);
  }
}

extension DynamicRangeApiX on DynamicRangeApi {
  DynamicRange get impl {
    return DynamicRange(encoding: encoding.impl, bitDepth: bitDepth.impl);
  }
}
