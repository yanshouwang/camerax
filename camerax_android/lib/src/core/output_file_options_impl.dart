import 'dart:io';

import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metadata_impl.dart';

final class OutputFileOptionsImpl extends OutputFileOptions {
  final OutputFileOptionsApi api;

  OutputFileOptionsImpl.internal(this.api) : super.impl();

  factory OutputFileOptionsImpl({
    required File file,
    Metadata? metadata,
  }) {
    final api = OutputFileOptionsApi.build(
      file: file.path,
      metadata: metadata?.api,
    );
    return OutputFileOptionsImpl.internal(api);
  }
}
