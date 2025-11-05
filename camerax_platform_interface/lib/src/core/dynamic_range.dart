import 'package:camerax_platform_interface/src/camerax_plugin.dart';

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

abstract base class DynamicRange {
  static DynamicRange get unspecifid =>
      CameraXPlugin.instance.$DynamicRangeUnspecifid;
  static DynamicRange get sdr => CameraXPlugin.instance.$DynamicRangeSdr;
  static DynamicRange get hdrUnspecified10Bit =>
      CameraXPlugin.instance.$DynamicRangeHdrUnspecified10Bit;
  static DynamicRange get hlg10Bit =>
      CameraXPlugin.instance.$DynamicRangeHlg10Bit;
  static DynamicRange get hdr10_10Bit =>
      CameraXPlugin.instance.$DynamicRangeHdr10_10Bit;
  static DynamicRange get hdr10Plus10Bit =>
      CameraXPlugin.instance.$DynamicRangeHdr10Plus10Bit;
  static DynamicRange get dolbyVision8Bit =>
      CameraXPlugin.instance.$DynamicRangeDolbyVision8Bit;
  static DynamicRange get dolbyVision10Bit =>
      CameraXPlugin.instance.$DynamicRangeDolbyVision10Bit;

  DynamicRange.impl();

  factory DynamicRange({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  }) => CameraXPlugin.instance.$DynamicRange(
    encoding: encoding,
    bitDepth: bitDepth,
  );

  Future<DynamicRangeBitDepth> getBitDepth();
  Future<DynamicRangeEncoding> getEncoding();
}
