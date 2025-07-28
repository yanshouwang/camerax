import 'package:camerax_platform_interface/src/common.dart';

import 'camera_selector.dart';
import 'camera_state.dart';
import 'dynamic_range.dart';
import 'exposure_state.dart';
import 'focus_metering_action.dart';
import 'lens_facing.dart';
import 'torch_state.dart';
import 'zoom_state.dart';

abstract base class CameraInfo {
  CameraInfo.impl();

  Stream<CameraState> get cameraStateChanged;
  Stream<TorchState> get torchStateChanged;
  Stream<ZoomState> get zoomStateChanged;

  Future<CameraSelector> getCameraSelector();
  Future<CameraState?> getCameraState();
  Future<TorchState?> getTorchState();
  Future<ZoomState?> getZoomState();
  Future<ExposureState> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<LensFacing> getLensFacing();
  Future<Set<CameraInfo>> getPhysicalCameraInfos();
  Future<Set<Range<int>>> getSupportedFrameRateRanges();
  Future<bool> hasFlashUnit();
  Future<bool> isFocusMeteringSupported(FocusMeteringAction action);
  Future<bool> isLogicalMultiCameraSupported();
  Future<bool> isZslSupported();
  Future<Set<DynamicRange>> querySupportedDynamicRanges(
      Set<DynamicRange> candidateDynamicRanges);
}
