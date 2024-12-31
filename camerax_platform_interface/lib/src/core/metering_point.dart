/// A MeteringPoint is used to specify a region which can then be converted to
/// sensor coordinate system for focus and metering purpose.
///
/// Conceptually, a MeteringPoint is a opaque handle to a metering point created
/// by a MeteringPointFactory, for use when building a FocusMeteringAction. The
/// coordinates of the point are specified by the application when creating points
/// from the factory, and then the coordinates are converted into an internal
/// representation stored by this class. Because of the nature of internal
/// representation, the X and Y of the MeteringPoint is not publicly visible.
/// These are for internal use only.
///
/// When a FocusMeteringAction is submitted via startFocusAndMetering, the
/// MeteringPoint is converted to a point in the sensor coordinate system where
/// it defines the center of a metering rectangle. If zoom is applied via
/// CameraControl , it will set a crop region calculated by the zoom and the final
/// coordinates will be mapped into the crop region. If not set, it is mapped to
/// the sensor active array.
///
/// Besides defining the center point of the metering rectangle, there is also
/// the size of the MeteringPoint. The size of the MeteringPoint ranges from 0 to
/// 1.0. The size is the percentage of sensor width and height (or crop region
/// width/height if crop region is set). See formula below:
///
/// ```
/// Metering rectangle width = size * sensorSizeOrCropRegion.width
/// Metering rectangle height = size * sensorSizeOrCropRegion.height
/// ```
///
/// The metering rectangle defined by the MeteringPoint has the same shape as the
/// sensor array.
abstract interface class MeteringPoint {
  /// Size of the MeteringPoint width and height (ranging from 0 to 1). It is the
  /// percentage of the sensor width/height (or crop region width/height if crop
  /// region is set).
  ///
  /// Crop region is set when zoom is set in CameraControl and it is the region
  /// inside the sensor active array and it defines the output region of the
  /// sensor. See formula below:
  ///
  /// ```
  /// Metering rectangle width = size * sensorSizeOrCropRegion.width
  /// Metering rectangle height = size * sensorSizeOrCropRegion.height
  /// ```
  double get size;
}
