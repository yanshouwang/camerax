import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_selector.dart';
import 'camera_state.dart';
import 'dynamic_range.dart';
import 'exposure_state.dart';
import 'focus_metering_action.dart';
import 'lens_facing.dart';
import 'range.dart';
import 'zoom_state.dart';

/// An interface for retrieving camera information.
///
/// Applications can retrieve an instance via getCameraInfo.
abstract base class CameraInfo extends PlatformInterface {
  static final _token = Object();

  CameraInfo.impl() : super(token: _token);

  Stream<CameraState> get cameraStateChanged;
  Stream<bool> get torchStateChanged;
  Stream<ZoomState> get zoomStateChanged;

  /// Returns a CameraSelector unique to this camera.
  Future<CameraSelector> getCameraSelector();

  /// Returns a LiveData of the camera's state.
  ///
  /// The LiveData will be updated whenever the camera's state changes, and can
  /// be any of the following: PENDING_OPEN, OPENING, OPEN, CLOSING and CLOSED.
  ///
  /// Due to the inner workings of LiveData, some reported camera states may be
  /// ignored if a newer value is posted before the observers are updated. For
  /// instance, this can occur when the camera is opening or closing, the OPENING
  /// and CLOSING states may not be reported to observers if they are rapidly
  /// followed by the OPEN and CLOSED states respectively.
  Future<CameraState> getCameraState();

  /// Returns a LiveData of current TorchState.
  ///
  /// The torch can be turned on and off via enableTorch which will trigger the
  /// change event to the returned LiveData. Apps can either get immediate value
  /// via getValue or observe it via observe to update torch UI accordingly.
  ///
  /// If the camera doesn't have a flash unit (see hasFlashUnit), then the torch
  /// state will be OFF.
  Future<bool> getTorchState();

  /// Returns a LiveData of ZoomState.
  ///
  /// The LiveData will be updated whenever the set zoom state has been changed.
  /// This can occur when the application updates the zoom via setZoomRatio or
  /// setLinearZoom. The zoom state can also change anytime a camera starts up,
  /// for example when a UseCase is bound to it.
  Future<ZoomState> getZoomState();

  /// Returns a ExposureState.
  ///
  /// The ExposureState contains the current exposure related information.
  Future<ExposureState> getExposureState();

  /// Returns the intrinsic zoom ratio of this camera.
  ///
  /// The intrinsic zoom ratio is defined as the ratio between the angle of view
  /// of the default camera and this camera. The default camera is the camera
  /// selected by DEFAULT_FRONT_CAMERA or DEFAULT_BACK_CAMERA depending on the
  /// lens facing of this camera. For example, if the default camera has angle of
  /// view 60 degrees and this camera has 30 degrees, this camera will have
  /// intrinsic zoom ratio 2.0.
  ///
  /// The intrinsic zoom ratio is calculated approximately based on the focal
  /// length and the sensor size. It's considered an inexact attribute of the
  /// camera and might not be hundred percent accurate when compared with the
  /// output image. Especially for the case that the camera doesn't read the whole
  /// sensor area due to cropping being applied.
  ///
  /// The default camera is guaranteed to have intrinsic zoom ratio 1.0. Other
  /// cameras that have intrinsic zoom ratio greater than 1.0 are considered
  /// telephoto cameras and cameras that have intrinsic zoom ratio less than 1.0
  /// are considered ultra wide-angle cameras.
  ///
  /// If the camera is unable to provide necessary information to resolve its
  /// intrinsic zoom ratio, it will be considered as a standard camera which has
  /// intrinsic zoom ratio 1.0.
  Future<double> getIntrinsicZoomRatio();

  /// Returns the lens facing of this camera.
  Future<LensFacing> getLensFacing();

  /// Returns a set of physical camera CameraInfos.
  ///
  /// A logical camera is a grouping of two or more of those physical cameras.
  /// See Multi-camera API
  ///
  /// Check isLogicalMultiCameraSupported to see if the device is supporting
  /// physical camera or not. If the device doesn't support physical camera,
  /// empty set will be returned.
  Future<Set<CameraInfo>> getPhysicalCameraInfos();

  /// Returns an unordered set of the frame rate ranges, in frames per second,
  /// supported by this device's AE algorithm.
  ///
  /// These are the frame rate ranges that the AE algorithm on the device can
  /// support. When CameraX is configured to run with the camera2 implementation,
  /// this list will be derived from #CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES,
  /// though ranges may be added or removed for compatibility reasons.
  ///
  /// There is no guarantee that these ranges can be used for every size surface
  /// or combination of use cases. If attempting to run the device using an
  /// unsupported range, there may be stability issues or the device may quietly
  /// choose another frame rate operating range.
  ///
  /// The returned set does not have any ordering guarantees and frame rate ranges
  /// may overlap.
  Future<Set<Range<int>>> getSupportedFrameRateRanges();

  /// Returns if flash unit is available or not.
  Future<bool> hasFlashUnit();

  /// Returns if the given FocusMeteringAction is supported on the devices.
  ///
  /// It returns true if at least one valid AF/AE/AWB region generated by the
  /// given FocusMeteringAction is supported on the current camera. For example,
  /// on a camera supporting only AF regions, passing in a FocusMeteringAction
  /// specifying AF/AE regions to this API will still return true. But it will
  /// return false if the FocusMeteringAction specifies only the AE region since
  /// none of the specified regions are supported.
  ///
  /// If it returns false, invoking startFocusAndMetering with the given
  /// FocusMeteringAction will always fail.
  Future<bool> isFocusMeteringSupported(FocusMeteringAction action);

  /// Returns if logical multi camera is supported on the device.
  ///
  /// A logical camera is a grouping of two or more of those physical cameras.
  /// See Multi-camera API
  Future<bool> isLogicalMultiCameraSupported();

  /// Returns if CAPTURE_MODE_ZERO_SHUTTER_LAG is supported on the current device.
  ///
  /// ZERO_SHUTTER_LAG will be supported when all of the following conditions are met
  ///
  /// * API Level >= 23
  /// * PRIVATE reprocessing is supported
  Future<bool> isZslSupported();

  /// Returns whether the shutter sound must be played in accordance to regional
  /// restrictions.
  ///
  /// This method provides the general rule of playing shutter sounds. The exact
  /// requirements of playing shutter sounds may vary among regions.
  ///
  /// For image capture, the shutter sound is recommended to be played when
  /// receiving onCaptureStarted or onCaptureStarted. For video capture, it's
  /// recommended to play the start recording sound when receiving VideoRecordEvent.Start
  /// and the stop recording sound when receiving VideoRecordEvent.Finalize.
  ///
  /// To play the system default sounds, it's recommended to use play. For image
  /// capture, play SHUTTER_CLICK. For video capture, play START_VIDEO_RECORDING
  /// and STOP_VIDEO_RECORDING.
  ///
  /// This method and mustPlayShutterSound serve the same purpose, while this
  /// method is compatible on API level lower than TIRAMISU.
  Future<bool> mustPlayShutterSound();

  /// Returns the supported dynamic ranges of this camera from a set of candidate
  /// dynamic ranges.
  ///
  /// Dynamic range specifies how the range of colors, highlights and shadows
  /// captured by the frame producer are represented on a display. Some dynamic
  /// ranges allow the preview surface to make full use of the extended range of
  /// brightness of the display.
  ///
  /// The returned dynamic ranges are those which the camera can produce. However,
  /// because care usually needs to be taken to ensure the frames produced can be
  /// displayed correctly, the returned dynamic ranges will be limited to those
  /// passed in to candidateDynamicRanges. For example, if the device display
  /// supports HLG, HDR10 and HDR10+, and you're attempting to use a UI component
  /// to receive frames from those dynamic ranges that you know will be display
  /// correctly, you would use a candidateDynamicRanges set consisting of
  /// {DynamicRange.HLG_10_BIT, DynamicRange.HDR10_10_BIT, DynamicRange.HDR10_PLUS_10_BIT}.
  /// If the only 10-bit/HDR DynamicRange the camera can produce is HLG_10_BIT,
  /// then that will be the only dynamic range returned by this method given the
  /// above candidate list.
  ///
  /// Consult the documentation of each use case to determine whether using the
  /// dynamic ranges published here are appropriate. Some use cases may have
  /// complex requirements that prohibit them from publishing a candidate list
  /// for use with this method, such as Recorder. For those cases, alternative
  /// APIs may be present for querying the supported dynamic ranges that can be
  /// set on the use case.
  ///
  /// The dynamic ranges published as return values by this method are fully-defined.
  /// That is, the resulting set will not contain dynamic ranges such as UNSPECIFIED
  /// or HDR_UNSPECIFIED_10_BIT. However, non-fully-defined dynamic ranges can be
  /// used in candidateDynamicRanges, and will resolve to fully-defined dynamic
  /// ranges in the resulting set. To query all dynamic ranges the camera can
  /// produce, Collections.singleton(DynamicRange.UNSPECIFIED} can be used as the
  /// candidate set.
  ///
  /// Because SDR is always supported, including SDR in candidateDynamicRanges
  /// will always result in SDR being present in the result set. If an empty
  /// candidate set is provided, an IllegalArgumentException will be thrown.
  Future<Set<DynamicRange>> querySupportedDynamicRanges(
      Set<DynamicRange> candidateDynamicRanges);
}
