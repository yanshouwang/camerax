import 'dart:io';

import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/video.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class FileOutputOptions$Builder {
  factory FileOutputOptions$Builder(File file) =>
      FileOutputOptionsChannel.instance.createBuilder(file);

  Future<FileOutputOptions$Builder> setDurationLimitMillis(
    int durationLimitMillis,
  );
  Future<FileOutputOptions$Builder> setFileSizeLimit(int fileSizeLimitBytes);
  Future<FileOutputOptions$Builder> setLocation(Location? location);
  Future<FileOutputOptions> build();
}

abstract interface class FileOutputOptions implements OutputOptions {
  Future<File> getFile();
}

abstract base class FileOutputOptionsChannel extends PlatformInterface {
  FileOutputOptionsChannel() : super(token: _token);

  static final _token = Object();

  static FileOutputOptionsChannel? _instance;

  static FileOutputOptionsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(FileOutputOptionsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  FileOutputOptions$Builder createBuilder(File file);
}
