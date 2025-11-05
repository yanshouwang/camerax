import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'output_options_api.dart';

abstract base class FileOutputOptionsApi extends OutputOptionsApi {
  FileOutputOptionsApi.impl() : super.impl();

  factory FileOutputOptionsApi(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) => CameraXPlugin.instance.$FileOutputOptionsApi(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  Future<File> getFile();
}
