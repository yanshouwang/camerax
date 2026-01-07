import 'package:camerax/camerax.dart';

class ExposureTimeState {
  final Range<int> range;
  final int value;

  const ExposureTimeState({required this.range, required this.value});

  ExposureTimeState copyWith({int? value}) {
    return ExposureTimeState(range: range, value: value ?? this.value);
  }
}
