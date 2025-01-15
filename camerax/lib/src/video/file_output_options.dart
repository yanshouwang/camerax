import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class FileOutputOptions {
  final $interface.FileOutputOptions _obj;

  FileOutputOptions({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    $interface.Location? location,
  }) : _obj = $interface.FileOutputOptions(
          file: file,
          durationLimit: durationLimit,
          fileSizeLimitBytes: fileSizeLimitBytes,
        );

  @internal
  $interface.FileOutputOptions get obj => _obj;
}
