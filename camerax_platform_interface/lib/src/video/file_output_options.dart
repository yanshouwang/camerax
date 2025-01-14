import 'dart:io';

import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class FileOutputOptions extends PlatformInterface {
  static final _token = Object();

  final File file;

  FileOutputOptions.impl({
    required this.file,
  }) : super(token: _token);

  factory FileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) =>
      CameraX.instance.createFileOutputOptions(
        file: file,
        durationLimit: durationLimit,
        fileSizeLimitBytes: fileSizeLimitBytes,
        location: location,
      );
}
