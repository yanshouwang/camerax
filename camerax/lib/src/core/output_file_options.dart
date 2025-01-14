import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class OutputFileOptions {
  final $base.OutputFileOptions _obj;

  OutputFileOptions({
    required File file,
    $base.Metadata? metadata,
  }) : _obj = $base.OutputFileOptions(
          file: file,
          metadata: metadata,
        );

  $base.OutputFileOptions get obj => _obj;
}
