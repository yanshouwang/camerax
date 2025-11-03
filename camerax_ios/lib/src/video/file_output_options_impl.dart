import 'dart:io';

import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FileOutputOptionsImpl extends FileOutputOptions {
  final FileOutputOptionsApi api;

  FileOutputOptionsImpl.internal(this.api, {required super.file})
    : super.impl();

  factory FileOutputOptionsImpl(
    File file, {
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
    return FileOutputOptionsImpl.internal(api, file: file);
  }
}

extension FileOutputOptionsX on FileOutputOptions {
  FileOutputOptionsApi get api {
    final impl = this;
    if (impl is! FileOutputOptionsImpl) throw TypeError();
    return impl.api;
  }
}
