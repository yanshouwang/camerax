abstract base class VNObservation {
  final String uuid;
  final double confidence;

  VNObservation.impl({
    required this.uuid,
    required this.confidence,
  });
}