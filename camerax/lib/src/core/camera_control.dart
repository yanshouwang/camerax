import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'focus_metering_action.dart';

/// The CameraControl provides various asynchronous operations like zoom, focus
/// and metering which affects output of all UseCases currently bound to that
/// camera.
///
/// The application can retrieve the CameraControl instance via getCameraControl.
/// CameraControl is ready to start operations immediately after Camera is retrieved
/// and UseCases are bound to that camera. When all UseCases are unbound, or when
/// camera is closing or closed because lifecycle onStop happens, the CameraControl
/// will reject all operations.
///
/// Each method Of CameraControl returns a ListenableFuture which apps can use to
/// check the asynchronous result. If the operation is not allowed in current
/// state, the returned ListenableFuture will fail immediately with
/// CameraControl.OperationCanceledException.
final class CameraControl {
  final $base.CameraControl _obj;

  CameraControl._native(this._obj);

  @internal
  $base.CameraControl get obj => _obj;

  /// Enable the torch or disable the torch.
  ///
  /// getTorchState can be used to query the torch state. If the camera doesn't
  /// have a flash unit (see hasFlashUnit), then the call will do nothing, the
  /// returned ListenableFuture will complete immediately with a failed result
  /// and the torch state will be OFF.
  ///
  /// When the torch is enabled, the torch will remain enabled during photo capture
  /// regardless of the flashMode setting. When the torch is disabled, flash will
  /// function as the flash mode set by either setFlashMode or setFlashMode.
  Future<void> enableTorch(bool torch) => _obj.enableTorch(torch);

  /// Sets current zoom by ratio.
  ///
  /// It modifies both current zoomRatio and linearZoom so if apps are observing
  /// zoomRatio or linearZoom, they will get the update as well. If the ratio is
  /// smaller than getMinZoomRatio or larger than getMaxZoomRatio, the returned
  /// ListenableFuture will fail with IllegalArgumentException and it won't modify
  /// current zoom ratio. It is the applications' duty to clamp the ratio.
  Future<void> setZoomRatio(double ratio) => _obj.setZoomRatio(ratio);

  /// Sets current zoom by a linear zoom value ranging from 0f to 1.0f. LinearZoom
  /// 0f represents the minimum zoom while linearZoom 1.0f represents the maximum
  /// zoom. The advantage of linearZoom is that it ensures the field of view (FOV)
  /// varies linearly with the linearZoom value, for use with slider UI elements
  /// (while setZoomRatio works well for pinch-zoom gestures).
  ///
  /// It modifies both current zoomRatio and linearZoom so if apps are observing
  /// zoomRatio or linearZoom, they will get the update as well. If the linearZoom
  /// is not in the range [0..1], the returned ListenableFuture will fail with
  /// IllegalArgumentException and it won't modify current linearZoom and zoomRatio.
  /// It is application's duty to clamp the linearZoom within [0..1].
  Future<void> setLinearZoom(double linearZoom) =>
      _obj.setLinearZoom(linearZoom);

  /// Starts a focus and metering action configured by the FocusMeteringAction.
  ///
  /// It will trigger an auto focus action and enable AF/AE/AWB metering regions.
  /// The action is configured by a FocusMeteringAction which contains the
  /// configuration of multiple AF/AE/AWB MeteringPoints and an auto-cancel
  /// duration. See FocusMeteringAction for more details.
  ///
  /// Only one FocusMeteringAction is allowed to run at a time. If multiple
  /// FocusMeteringAction are executed in a row, only the latest one will work
  /// and other actions will be cancelled.
  ///
  /// If the FocusMeteringAction specifies more AF/AE/AWB points than what is
  /// supported on the current device, only the first point and then in order up
  /// to the number of points supported by the device will be enabled.
  ///
  /// If none of the points with either AF/AE/AWB can be supported on the device
  /// or none of the points generates valid metering rectangles, the returned
  /// ListenableFuture in startFocusAndMetering will fail immediately.
  Future<void> startFocusAndMetering(FocusMeteringAction action) =>
      _obj.startFocusAndMetering(action.obj);

  /// Cancels current FocusMeteringAction and clears AF/AE/AWB regions.
  ///
  /// Clear the AF/AE/AWB regions and update current AF mode to continuous AF (if
  /// supported). If current FocusMeteringAction has not completed, the returned
  /// ListenableFuture in startFocusAndMetering will fail with OperationCanceledException.
  Future<void> cancelFocusAndMetering() => _obj.cancelFocusAndMetering();

  /// Set the exposure compensation value for the camera.
  ///
  /// Only one setExposureCompensationIndex is allowed to run at the same time.
  /// If multiple setExposureCompensationIndex are executed in a row, only the
  /// latest one setting will be kept in the camera. The other actions will be
  /// cancelled and the ListenableFuture will fail with the OperationCanceledException.
  /// After all the previous actions is cancelled, the camera device will adjust
  /// the brightness according to the latest setting.
  Future<int> setExposureCompensationIndex(int value) =>
      _obj.setExposureCompensationIndex(value);
}

extension CameraControlObj on $base.CameraControl {
  @internal
  CameraControl get args {
    return CameraControl._native(this);
  }
}
