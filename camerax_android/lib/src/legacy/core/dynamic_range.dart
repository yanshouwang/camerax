import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'bit_depth.dart';
import 'encoding.dart';

final class DynamicRange extends $base.DynamicRange {
  final $native.DynamicRange obj;

  DynamicRange.$native(this.obj) : super.impl();

  @override
  Future<$base.BitDepth> getBitDepth() async {
    final obj = await this.obj.getBitDepth();
    return obj.args;
  }

  @override
  Future<$base.Encoding> getEncoding() async {
    final obj = await this.obj.getEncoding();
    return obj.args;
  }
}
