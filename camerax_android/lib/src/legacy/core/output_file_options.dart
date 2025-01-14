import 'dart:io';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'metadata.dart';

final class OutputFileOptions extends $base.OutputFileOptions {
  final $native.OutputFileOptions obj;

  OutputFileOptions.$native(this.obj) : super.impl();

  factory OutputFileOptions({
    required File file,
    $base.Metadata? metadata,
  }) {
    final obj = $native.OutputFileOptions.build(
      file: file.path,
      metadata: metadata?.obj,
    );
    return OutputFileOptions.$native(obj);
  }
}
