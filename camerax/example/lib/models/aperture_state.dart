class ApertureState {
  final List<double> availableValues;
  final double value;

  const ApertureState({required this.availableValues, required this.value});

  ApertureState copyWith({double? value}) {
    return ApertureState(
      availableValues: availableValues,
      value: value ?? this.value,
    );
  }
}
