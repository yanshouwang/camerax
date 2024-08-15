import 'bit_depth.dart';
import 'encoding.dart';

class DynamicRange {
  final Encoding encoding;
  final BitDepth bitDepth;

  const DynamicRange({
    required this.encoding,
    required this.bitDepth,
  });

  static const unspecifid = DynamicRange(
    encoding: Encoding.unspecified,
    bitDepth: BitDepth.unspecified,
  );
  static const sdr = DynamicRange(
    encoding: Encoding.sdr,
    bitDepth: BitDepth.with_8Bit,
  );
  static const hdrUnspecified_10Bit = DynamicRange(
    encoding: Encoding.hdrUnspecified,
    bitDepth: BitDepth.with_10Bit,
  );
  static const hlg_10Bit = DynamicRange(
    encoding: Encoding.hlg,
    bitDepth: BitDepth.with_10Bit,
  );
  static const hdr10_10Bit = DynamicRange(
    encoding: Encoding.hdr10,
    bitDepth: BitDepth.with_10Bit,
  );
  static const hdr10Plus_10Bit = DynamicRange(
    encoding: Encoding.hdr10Plus,
    bitDepth: BitDepth.with_10Bit,
  );
  static const dolbyVision_8Bit = DynamicRange(
    encoding: Encoding.dolbyVision,
    bitDepth: BitDepth.with_8Bit,
  );
  static const dolbyVision_10Bit = DynamicRange(
    encoding: Encoding.dolbyVision,
    bitDepth: BitDepth.with_10Bit,
  );
}
