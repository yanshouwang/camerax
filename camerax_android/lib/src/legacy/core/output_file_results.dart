import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'image_format.dart';

extension OutputFileResultsObj on $native.OutputFileResults {
  $base.OutputFileResults get args {
    return $base.OutputFileResults(
      imageFormat: imageFormat.args,
      savedUri: Uri.parse(savedUri),
    );
  }
}
