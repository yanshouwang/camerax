import 'dart:io';

import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'output_options_impl.dart';

final class FileOutputOptionsImpl extends FileOutputOptions
    with OutputOptionsImpl {
  @override
  final FileOutputOptionsProxyApi api;

  FileOutputOptionsImpl.internal(this.api) : super.impl();

  factory FileOutputOptionsImpl(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    Location? location,
  }) {
    final api = FileOutputOptionsProxyApi.build(
      file: file.api,
      durationLimitMillis: durationLimit?.inMilliseconds,
      fileSizeLimitBytes: fileSizeLimitBytes,
      location: location?.api,
    );
    return FileOutputOptionsImpl.internal(api);
  }

  @override
  Future<File> getFile() => api.getFile().then((e) => e.fileImpl);
}

extension FileOutputOptionsX on FileOutputOptions {
  FileOutputOptionsProxyApi get api {
    final impl = this;
    if (impl is! FileOutputOptionsImpl) throw TypeError();
    return impl.api;
  }
}
