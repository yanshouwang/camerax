import 'dart:io';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'metadata.dart';

final class OutputFileOptions extends $interface.OutputFileOptions {
  final $native.OutputFileOptions obj;

  OutputFileOptions.$native(this.obj) : super.impl();

  factory OutputFileOptions({
    required File file,
    $interface.Metadata? metadata,
  }) {
    final obj = $native.OutputFileOptions.build(
      file: file.path,
      metadata: metadata?.obj,
    );
    return OutputFileOptions.$native(obj);
  }
}
