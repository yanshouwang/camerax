import 'range.dart';

/// An interface which contains the camera exposure related information.
///
/// Applications can retrieve an instance via getExposureState.
abstract interface class ExposureState {
  /// Get the current exposure compensation index.
  ///
  /// The exposure value (EV) is the compensation index multiplied by the step
  /// value which is given by getExposureCompensationStep. Increasing the compensation
  /// index by using the setExposureCompensationIndex will increase exposure making
  /// the capture result brighter, decreasing the value making it darker.
  ///
  /// For example, if the exposure value (EV) step size is 0.333, set the exposure
  /// compensation index value '6' will mean an exposure compensation of +2 EV;
  /// -3 will mean an exposure compensation of -1 EV.
  ///
  /// The exposure value resets to default when there is no UseCase associated
  /// with the camera. For example, unbind all use cases from the camera or when
  /// the lifecycle changed that all the use case stopping data from the camera.
  int get exposureCompensationIndex;

  /// Get the maximum and minimum exposure compensation values for setExposureCompensationIndex
  ///
  /// The actual exposure value (EV) range that supported by the camera can be
  /// calculated by multiplying the getExposureCompensationStep with the maximum
  /// and minimum values:
  ///
  /// ```
  /// Min.exposure compensation * getExposureCompensationStep <= minimum supported EV
  /// Max.exposure compensation * getExposureCompensationStep >= maximum supported EV
  /// ```
  Range<int> get exposureCompensationRange;

  /// Get the smallest step by which the exposure compensation can be changed.
  double get exposureCompensationStep;

  /// Whether exposure compensation is supported for this camera.
  bool get isExposureCompensationSupported;
}
