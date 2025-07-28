final class Location {
  final double latitude;
  final double longitude;

  const Location({required this.latitude, required this.longitude});

  @override
  bool operator ==(Object other) {
    return other is Location &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude);
}
