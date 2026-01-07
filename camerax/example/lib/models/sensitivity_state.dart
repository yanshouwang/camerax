import 'package:camerax/camerax.dart';

class SensitivityState {
  final Range<int> range;
  final int value;

  const SensitivityState({required this.range, required this.value});

  SensitivityState copyWith({int? value}) {
    return SensitivityState(range: range, value: value ?? this.value);
  }
}
