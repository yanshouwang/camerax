abstract base class VNObservation {
  Future<String> getUUID();
  Future<double> getConfidence();

  VNObservation.impl();
}