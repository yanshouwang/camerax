// ignore_for_file: camel_case_extensions

import 'dart:io';
import 'dart:math' as math;

extension doubleX on double {
  String trancateStringAsFixed(int fractionDigits) {
    final factor = math.pow(10, fractionDigits);
    final newValue = (this * factor).truncate() / factor;
    return newValue.toStringAsFixed(fractionDigits);
  }
}

extension FileX on File {
  bool get isVideo {
    return path.toUpperCase().endsWith('.MOV') ||
        path.toUpperCase().endsWith('.MP4') ||
        path.toUpperCase().endsWith('.HEVC');
  }
}
