import 'dart:io';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

abstract base class FileOutputOptionsApi {
  FileOutputOptionsApi.impl();

  factory FileOutputOptionsApi(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    LocationApi? location,
  }) => CameraXPlugin.instance.$FileOutputOptionsApi(
    file,
    durationLimit: durationLimit,
    fileSizeLimitBytes: fileSizeLimitBytes,
    location: location,
  );

  File get file;
}
