import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'output_options.dart';

abstract base class FileOutputOptions extends OutputOptions {
  FileOutputOptions.impl() : super.impl();

  factory FileOutputOptions(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => CameraXPlugin.instance.$FileOutputOptions(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  Future<File> getFile();
}
