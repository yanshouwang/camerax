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
      CameraXPlugin.instance.$DynamicRange$unspecifid;
  static DynamicRange get sdr => CameraXPlugin.instance.$DynamicRange$sdr;
  static DynamicRange get hdrUnspecified10Bit =>
      CameraXPlugin.instance.$DynamicRange$hdrUnspecified10Bit;
  static DynamicRange get hdr10_10Bit =>
      CameraXPlugin.instance.$DynamicRange$hdr10_10Bit;
  static DynamicRange get hdr10Plus10Bit =>
      CameraXPlugin.instance.$DynamicRange$hdr10Plus10Bit;
  static DynamicRange get hlg10Bit =>
      CameraXPlugin.instance.$DynamicRange$hlg10Bit;
  static DynamicRange get dolbyVision8Bit =>
      CameraXPlugin.instance.$DynamicRange$dolbyVision8Bit;
  static DynamicRange get dolbyVision10Bit =>
      CameraXPlugin.instance.$DynamicRange$dolbyVision10Bit;

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
