import 'dart:io';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class FileOutputOptions extends $interface.FileOutputOptions {
  final $native.FileOutputOptions obj;

  FileOutputOptions.$native(
    this.obj, {
    required super.file,
  }) : super.impl();

  factory FileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    $interface.Location? location,
  }) {
    final obj = $native.FileOutputOptions.build(
      file: file.path,
      durationLimitMillis: durationLimit?.inMilliseconds,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location?.obj,
    );
    return FileOutputOptions.$native(
      obj,
      file: file,
    );
  }
}
