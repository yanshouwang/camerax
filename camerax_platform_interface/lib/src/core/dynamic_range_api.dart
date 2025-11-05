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

abstract base class DynamicRangeApi {
  static DynamicRangeApi get unspecifid =>
      CameraXPlugin.instance.$DynamicRangeApiUnspecifid;
  static DynamicRangeApi get sdr => CameraXPlugin.instance.$DynamicRangeApiSdr;
  static DynamicRangeApi get hdrUnspecified10Bit =>
      CameraXPlugin.instance.$DynamicRangeApiHdrUnspecified10Bit;
  static DynamicRangeApi get hlg10Bit =>
      CameraXPlugin.instance.$DynamicRangeApiHlg10Bit;
  static DynamicRangeApi get hdr10_10Bit =>
      CameraXPlugin.instance.$DynamicRangeApiHdr10_10Bit;
  static DynamicRangeApi get hdr10Plus10Bit =>
      CameraXPlugin.instance.$DynamicRangeApiHdr10Plus10Bit;
  static DynamicRangeApi get dolbyVision8Bit =>
      CameraXPlugin.instance.$DynamicRangeApiDolbyVision8Bit;
  static DynamicRangeApi get dolbyVision10Bit =>
      CameraXPlugin.instance.$DynamicRangeApiDolbyVision10Bit;

  DynamicRangeApi.impl();

  factory DynamicRangeApi({
    required DynamicRangeEncoding encoding,
    required DynamicRangeBitDepth bitDepth,
  }) => CameraXPlugin.instance.$DynamicRangeApi(
    encoding: encoding,
    bitDepth: bitDepth,
  );

  DynamicRangeBitDepth get bitDepth;
  DynamicRangeEncoding get encoding;
}
