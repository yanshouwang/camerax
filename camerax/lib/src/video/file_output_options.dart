import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class FileOutputOptions {
  final $base.FileOutputOptions _obj;

  FileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    $base.Location? location,
  }) : _obj = $base.FileOutputOptions(
          file: file,
          durationLimit: durationLimit,
          fileSizeLimitBytes: fileSizeLimitBytes,
        );

  @internal
  $base.FileOutputOptions get obj => _obj;
}
