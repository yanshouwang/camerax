import 'dart:io';

import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metadata.dart';

abstract base class OutputFileOptions extends PlatformInterface {
  static final _token = Object();

  OutputFileOptions.impl() : super(token: _token);

  factory OutputFileOptions({
    required File file,
    Metadata? metadata,
  }) =>
      CameraX.instance.createOutputFileOptions(
        file: file,
        metadata: metadata,
      );
}
