// ignore_for_file: camel_case_extensions

import 'dart:math' as math;

extension doubleX on double {
  String trancateStringAsFixed(int fractionDigits) {
    final factor = math.pow(10, fractionDigits);
    final newValue = (this * factor).truncate() / factor;
    return newValue.toStringAsFixed(fractionDigits);
  }
}
