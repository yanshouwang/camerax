import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class OutputFileOptions {
  final $interface.OutputFileOptions _obj;

  OutputFileOptions({
    required File file,
    $interface.Metadata? metadata,
  }) : _obj = $interface.OutputFileOptions(
          file: file,
          metadata: metadata,
        );

  $interface.OutputFileOptions get obj => _obj;
}
