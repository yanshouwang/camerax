enum DynamicRangeEncoding {
  unspecified,
  sdr,
  hdrUnspecified,
  hlg,
  hdr10,
  hdr10Plus,
  dolbyVision,
}

enum DynamicRangeBitDepth { unspecified, eightBit, tenBit }

final class DynamicRange {
  final DynamicRangeEncoding encoding;
  final DynamicRangeBitDepth bitDepth;

  const DynamicRange({required this.encoding, required this.bitDepth});

  static const unspecifid = DynamicRange(
    encoding: DynamicRangeEncoding.unspecified,
    bitDepth: DynamicRangeBitDepth.unspecified,
  );
  static const sdr = DynamicRange(
    encoding: DynamicRangeEncoding.sdr,
    bitDepth: DynamicRangeBitDepth.eightBit,
  );
  static const hdrUnspecified10Bit = DynamicRange(
    encoding: DynamicRangeEncoding.hdrUnspecified,
    bitDepth: DynamicRangeBitDepth.tenBit,
  );
  static const hlg10Bit = DynamicRange(
    encoding: DynamicRangeEncoding.hlg,
    bitDepth: DynamicRangeBitDepth.tenBit,
  );
  static const hdr10_10Bit = DynamicRange(
    encoding: DynamicRangeEncoding.hdr10,
    bitDepth: DynamicRangeBitDepth.tenBit,
  );
  static const hdr10Plus10Bit = DynamicRange(
    encoding: DynamicRangeEncoding.hdr10Plus,
    bitDepth: DynamicRangeBitDepth.tenBit,
  );
  static const dolbyVision8Bit = DynamicRange(
    encoding: DynamicRangeEncoding.dolbyVision,
    bitDepth: DynamicRangeBitDepth.eightBit,
  );
  static const dolbyVision10Bit = DynamicRange(
    encoding: DynamicRangeEncoding.dolbyVision,
    bitDepth: DynamicRangeBitDepth.tenBit,
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
