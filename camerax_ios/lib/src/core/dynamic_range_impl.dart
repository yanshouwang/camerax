// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class DynamicRangeImpl extends DynamicRange {
//   static DynamicRangeImpl get unspecifid =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.unspecifid);
//   static DynamicRangeImpl get sdr =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.sdr);
//   static DynamicRangeImpl get hdrUnspecified10Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.hdrUnspecified10Bit);
//   static DynamicRangeImpl get hdr10_10Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.hdr10_10Bit);
//   static DynamicRangeImpl get hdr10Plus10Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.hdr10Plus10Bit);
//   static DynamicRangeImpl get hlg10Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.hlg10Bit);
//   static DynamicRangeImpl get dolbyVision8Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.dolbyVision8Bit);
//   static DynamicRangeImpl get dolbyVision10Bit =>
//       DynamicRangeImpl.internal(DynamicRangeProxyApi.dolbyVision10Bit);

//   final DynamicRangeProxyApi api;

//   DynamicRangeImpl.internal(this.api) : super.impl();

//   factory DynamicRangeImpl({
//     required DynamicRangeEncoding encoding,
//     required DynamicRangeBitDepth bitDepth,
//   }) {
//     final api = DynamicRangeProxyApi(
//       encoding: encoding.api,
//       bitDepth: bitDepth.api,
//     );
//     return DynamicRangeImpl.internal(api);
//   }

//   @override
//   Future<DynamicRangeBitDepth> getBitDepth() =>
//       api.getBitDepth().then((e) => e.impl);

//   @override
//   Future<DynamicRangeEncoding> getEncoding() =>
//       api.getEncoding().then((e) => e.impl);
// }

// extension DynamicRangeEncodingX on DynamicRangeEncoding {
//   DynamicRangeEncodingApi get api => DynamicRangeEncodingApi.values[index];
// }

// extension DynamicRangeEncodingApiX on DynamicRangeEncodingApi {
//   DynamicRangeEncoding get impl => DynamicRangeEncoding.values[index];
// }

// extension DynamicRangeBitDepthX on DynamicRangeBitDepth {
//   DynamicRangeBitDepthApi get api => DynamicRangeBitDepthApi.values[index];
// }

// extension DynamicRangeBitDepthApiX on DynamicRangeBitDepthApi {
//   DynamicRangeBitDepth get impl => DynamicRangeBitDepth.values[index];
// }

// extension DynamicRangeX on DynamicRange {
//   DynamicRangeProxyApi get api {
//     final impl = this;
//     if (impl is! DynamicRangeImpl) throw TypeError();
//     return impl.api;
//   }
// }

// extension DynamicRangeProxyApiX on DynamicRangeProxyApi {
//   DynamicRange get impl => DynamicRangeImpl.internal(this);
// }
