import 'dart:io';

import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FileOutputOptions$BuilderImpl implements FileOutputOptions$Builder {
  final FileOutputOptionsBuilderProxyApi api;

  FileOutputOptions$BuilderImpl.internal(this.api);

  @override
  Future<FileOutputOptions$Builder> setDurationLimitMillis(
    int durationLimitMillis,
  ) => api.setDurationLimitMillis(durationLimitMillis).then((e) => e.impl);

  @override
  Future<FileOutputOptions$Builder> setFileSizeLimit(int fileSizeLimitBytes) =>
      api.setFileSizeLimit(fileSizeLimitBytes).then((e) => e.impl);

  @override
  Future<FileOutputOptions$Builder> setLocation(Location? location) =>
      api.setLocation(location?.api).then((e) => e.impl);

  @override
  Future<FileOutputOptions> build() => api.build().then((e) => e.impl);
}

final class FileOutputOptionsImpl extends OutputOptionsImpl
    implements FileOutputOptions {
  @override
  final FileOutputOptionsProxyApi api;

  FileOutputOptionsImpl.internal(this.api);

  @override
  Future<File> getFile() => api.getFile().then((e) => e.fileImpl);
}

final class FileOutputOptionsChannelImpl extends FileOutputOptionsChannel {
  @override
  FileOutputOptions$Builder createBuilder(File file) {
    final api = FileOutputOptionsBuilderProxyApi(file: file.api);
    return FileOutputOptions$BuilderImpl.internal(api);
  }
}

extension FileOutputOptionsBuilderProxyApiX
    on FileOutputOptionsBuilderProxyApi {
  FileOutputOptions$Builder get impl =>
      FileOutputOptions$BuilderImpl.internal(this);
}

extension FileOutputOptionsX on FileOutputOptions {
  FileOutputOptionsProxyApi get api {
    final impl = this;
    if (impl is! FileOutputOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension FileOutputOptionsProxyApiX on FileOutputOptionsProxyApi {
  FileOutputOptions get impl => FileOutputOptionsImpl.internal(this);
}
