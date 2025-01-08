import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bit_depth.dart';
import 'encoding.dart';

abstract base class DynamicRange extends PlatformInterface {
  static final _token = Object();

  DynamicRange.impl() : super(token: _token);

  Encoding get encoding;
  BitDepth get bitDepth;

  // static const unspecifid = DynamicRange(
  //   encoding: Encoding.unspecified,
  //   bitDepth: BitDepth.unspecified,
  // );
  // static const sdr = DynamicRange(
  //   encoding: Encoding.sdr,
  //   bitDepth: BitDepth.with_8Bit,
  // );
  // static const hdrUnspecified_10Bit = DynamicRange(
  //   encoding: Encoding.hdrUnspecified,
  //   bitDepth: BitDepth.with_10Bit,
  // );
  // static const hlg_10Bit = DynamicRange(
  //   encoding: Encoding.hlg,
  //   bitDepth: BitDepth.with_10Bit,
  // );
  // static const hdr10_10Bit = DynamicRange(
  //   encoding: Encoding.hdr10,
  //   bitDepth: BitDepth.with_10Bit,
  // );
  // static const hdr10Plus_10Bit = DynamicRange(
  //   encoding: Encoding.hdr10Plus,
  //   bitDepth: BitDepth.with_10Bit,
  // );
  // static const dolbyVision_8Bit = DynamicRange(
  //   encoding: Encoding.dolbyVision,
  //   bitDepth: BitDepth.with_8Bit,
  // );
  // static const dolbyVision_10Bit = DynamicRange(
  //   encoding: Encoding.dolbyVision,
  //   bitDepth: BitDepth.with_10Bit,
  // );
}
