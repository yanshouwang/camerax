import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum DynamicRange$Encoding {
  unspecified,
  sdr,
  hdrUnspecified,
  hlg,
  hdr10,
  hdr10Plus,
  dolbyVision,
}

enum DynamicRange$BitDepth { unspecified, $8Bit, $10Bit }

abstract interface class DynamicRange {
  static DynamicRange get unspecifid => DynamicRangeChannel.instance.unspecifid;
  static DynamicRange get sdr => DynamicRangeChannel.instance.sdr;
  static DynamicRange get hdrUnspecified10Bit =>
      DynamicRangeChannel.instance.hdrUnspecified10Bit;
  static DynamicRange get hdr10_10Bit =>
      DynamicRangeChannel.instance.hdr10_10Bit;
  static DynamicRange get hdr10Plus10Bit =>
      DynamicRangeChannel.instance.hdr10Plus10Bit;
  static DynamicRange get hlg10Bit => DynamicRangeChannel.instance.hlg10Bit;
  static DynamicRange get dolbyVision8Bit =>
      DynamicRangeChannel.instance.dolbyVision8Bit;
  static DynamicRange get dolbyVision10Bit =>
      DynamicRangeChannel.instance.dolbyVision10Bit;

  factory DynamicRange({
    required DynamicRange$Encoding encoding,
    required DynamicRange$BitDepth bitDepth,
  }) => DynamicRangeChannel.instance.create(
    encoding: encoding,
    bitDepth: bitDepth,
  );

  Future<DynamicRange$BitDepth> getBitDepth();
  Future<DynamicRange$Encoding> getEncoding();
}

abstract base class DynamicRangeChannel extends PlatformInterface {
  DynamicRangeChannel() : super(token: _token);

  static final _token = Object();

  static DynamicRangeChannel? _instance;

  static DynamicRangeChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(DynamicRangeChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  DynamicRange get unspecifid;
  DynamicRange get sdr;
  DynamicRange get hdrUnspecified10Bit;
  DynamicRange get hdr10_10Bit;
  DynamicRange get hdr10Plus10Bit;
  DynamicRange get hlg10Bit;
  DynamicRange get dolbyVision8Bit;
  DynamicRange get dolbyVision10Bit;

  DynamicRange create({
    required DynamicRange$Encoding encoding,
    required DynamicRange$BitDepth bitDepth,
  });
}
