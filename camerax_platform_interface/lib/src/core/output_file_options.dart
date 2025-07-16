import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metadata.dart';

abstract base class OutputFileOptions {
  OutputFileOptions.impl();

  factory OutputFileOptions({
    required File file,
    Metadata? metadata,
  }) =>
      CameraXPlugin.instance.newOutputFileOptions(
        file: file,
        metadata: metadata,
      );
}
