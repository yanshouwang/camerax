import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/native_comparator.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class DynamicRange extends $base.DynamicRange with NativeComparator {
  @override
  final $native.DynamicRange obj;

  DynamicRange.$native(this.obj) : super.impl();

  @override
  $base.BitDepth get bitDepth => throw UnimplementedError();

  @override
  $base.Encoding get encoding => throw UnimplementedError();
}
