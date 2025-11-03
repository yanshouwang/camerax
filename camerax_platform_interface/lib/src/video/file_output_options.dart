import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

abstract base class FileOutputOptions {
  final File file;

  FileOutputOptions.impl({required this.file});

  factory FileOutputOptions(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => CameraXPlugin.instance.newFileOutputOptions(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );
}
