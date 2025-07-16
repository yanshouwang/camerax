import 'dart:io';

import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FileOutputOptionsImpl extends FileOutputOptions {
  final FileOutputOptionsApi api;

  FileOutputOptionsImpl.impl(
    this.api, {
    required super.file,
  }) : super.impl();

  factory FileOutputOptionsImpl({
    required File file,
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) {
    final api = FileOutputOptionsApi.build(
      file: file.path,
      durationLimitMillis: durationLimit?.inMilliseconds,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location?.api,
    );
    return FileOutputOptionsImpl.impl(
      api,
      file: file,
    );
  }
}
