import 'bit_depth.dart';
import 'encoding.dart';

final class DynamicRange {
  final Encoding encoding;
  final BitDepth bitDepth;

  const DynamicRange({
    required this.encoding,
    required this.bitDepth,
  });

  static const unspecifid = DynamicRange(
    encoding: Encoding.unspecified,
    bitDepth: BitDepth.bitDepthUnspecified,
  );
  static const sdr = DynamicRange(
    encoding: Encoding.sdr,
    bitDepth: BitDepth.bitDepth8Bit,
  );
  static const hdrUnspecified10Bit = DynamicRange(
    encoding: Encoding.hdrUnspecified,
    bitDepth: BitDepth.bitDepth10Bit,
  );
  static const hlg10Bit = DynamicRange(
    encoding: Encoding.hlg,
    bitDepth: BitDepth.bitDepth10Bit,
  );
  static const hdr10_10Bit = DynamicRange(
    encoding: Encoding.hdr10,
    bitDepth: BitDepth.bitDepth10Bit,
  );
  static const hdr10Plus10Bit = DynamicRange(
    encoding: Encoding.hdr10Plus,
    bitDepth: BitDepth.bitDepth10Bit,
  );
  static const dolbyVision8Bit = DynamicRange(
    encoding: Encoding.dolbyVision,
    bitDepth: BitDepth.bitDepth8Bit,
  );
  static const dolbyVision10Bit = DynamicRange(
    encoding: Encoding.dolbyVision,
    bitDepth: BitDepth.bitDepth10Bit,
  );

  @override
  int get hashCode => Object.hash(encoding, bitDepth);

  @override
  bool operator ==(Object other) {
    return other is DynamicRange &&
        other.encoding == encoding &&
        other.bitDepth == bitDepth;
  }
}
