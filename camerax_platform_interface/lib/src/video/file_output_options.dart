import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _token = Object();

abstract interface class FileOutputOptions {
  File get file;

  factory FileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) {
    final instance = CameraXPlugin.instance.newFileOutputOptions(
      file: file,
      durationLimit: durationLimit,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class FileOutputOptionsChannel extends PlatformInterface
    implements FileOutputOptions {
  @override
  final File file;

  FileOutputOptionsChannel.impl({
    required this.file,
  }) : super(token: _token);
}
