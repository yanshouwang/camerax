import 'dart:io';

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FileOutputOptionsImpl extends FileOutputOptionsApi {
  final FileOutputOptionsProxyApi api;

  FileOutputOptionsImpl.internal(this.api) : super.impl();

  factory FileOutputOptionsImpl(
    File file, {
    Duration? durationLimit,
    int? fileSizeLimitBytes,
    LocationApi? location,
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

extension FileOutputOptionsApiX on FileOutputOptionsApi {
  FileOutputOptionsProxyApi get api {
    final impl = this;
    if (impl is! FileOutputOptionsImpl) throw TypeError();
    return impl.api;
  }
}
