import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metadata.dart';

final _token = Object();

abstract interface class OutputFileOptions {
  factory OutputFileOptions({
    required File file,
    Metadata? metadata,
  }) {
    final instance = CameraXPlugin.instance.newOutputFileOptions(
      file: file,
      metadata: metadata,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class OutputFileOptionsChannel extends PlatformInterface
    implements OutputFileOptions {
  OutputFileOptionsChannel.impl() : super(token: _token);
}
