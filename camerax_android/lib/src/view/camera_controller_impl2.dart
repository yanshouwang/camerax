import 'package:camerax_android/src/api.dart' as api;
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraControllerImpl extends CameraController {
  final api.LifecycleCameraController obj;
  final api.PreviewView _viewObj;

  CameraControllerImpl()
      : obj = api.LifecycleCameraController(),
        _viewObj = api.PreviewView(),
        super.impl();

  int get viewId => _viewObj.pigeon_instanceManager.getIdentifier(_viewObj)!;

  @override
  Future<void> bindToLifecycle() async {
    await obj.bindToLifecycle();
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() {
    // TODO: implement clearImageAnalysisAnalyzer
    throw UnimplementedError();
  }

  @override
  Future<void> enableTorch(bool enabled) {
    // TODO: implement enableTorch
    throw UnimplementedError();
  }

  @override
  Future<CameraControl> getCameraControl() {
    // TODO: implement getCameraControl
    throw UnimplementedError();
  }

  @override
  Future<CameraInfo> getCameraInfo() {
    // TODO: implement getCameraInfo
    throw UnimplementedError();
  }

  @override
  Future<CameraSelector> getCameraSelector() async {
    final cameraSelectorObj = await obj.getCameraSelector();
    return CameraSelectorImpl2.native(cameraSelectorObj);
  }

  @override
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy() {
    // TODO: implement getImageAnalysisBackpressureStrategy
    throw UnimplementedError();
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() {
    // TODO: implement getImageAnalysisImageQueueDepth
    throw UnimplementedError();
  }

  @override
  Future<ImageFormat> getImageAnalysisOutputImageFormat() {
    // TODO: implement getImageAnalysisOutputImageFormat
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector() {
    // TODO: implement getImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() {
    // TODO: implement getImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<CaptureMode> getImageCaptureMode() {
    // TODO: implement getImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() {
    // TODO: implement getImageCaptureResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getPreviewResolutionSelector() {
    // TODO: implement getPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<bool?> getTorchState() {
    // TODO: implement getTorchState
    throw UnimplementedError();
  }

  @override
  Future<DynamicRange> getVideoCaptureDynamicRange() {
    // TODO: implement getVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() {
    // TODO: implement getVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<QualitySelector> getVideoCaptureQualitySelector() {
    // TODO: implement getVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<Range<int>> getVideoCaptureTargetFrameRate() {
    // TODO: implement getVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }

  @override
  Future<ZoomState?> getZoomState() {
    // TODO: implement getZoomState
    throw UnimplementedError();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelectorImpl2) {
      throw TypeError();
    }
    final hasCamera = await obj.hasCamera(cameraSelector.obj);
    return hasCamera;
  }

  @override
  Future<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<bool> isImageAnalysisEnabled() {
    // TODO: implement isImageAnalysisEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isImageCaptureEnabled() {
    // TODO: implement isImageCaptureEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isPinchToZoomEnabled() {
    // TODO: implement isPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isRecording() {
    // TODO: implement isRecording
    throw UnimplementedError();
  }

  @override
  Future<bool> isTapToFocusEnabled() {
    // TODO: implement isTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isVideoCaptureEnabled() {
    // TODO: implement isVideoCaptureEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelectorImpl2) {
      throw TypeError();
    }
    await obj.setCameraSelector(cameraSelector.obj);
  }

  @override
  Future<void> setEnabledUseCases(List<UseCase> useCases) {
    // TODO: implement setEnabledUseCases
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer) {
    // TODO: implement setImageAnalysisAnalyzer
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      BackpressureStrategy backpressureStrategy) {
    // TODO: implement setImageAnalysisBackpressureStrategy
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisImageQueueDepth(int imageQueueDepth) {
    // TODO: implement setImageAnalysisImageQueueDepth
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      ImageFormat outputImageFormat) {
    // TODO: implement setImageAnalysisOutputImageFormat
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) {
    // TODO: implement setImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureMode(CaptureMode captureMode) {
    // TODO: implement setImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setImageCaptureResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setLinearZoom(double linearZoom) {
    // TODO: implement setLinearZoom
    throw UnimplementedError();
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) {
    // TODO: implement setPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setPreviewResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) {
    // TODO: implement setTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange) {
    // TODO: implement setVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) {
    // TODO: implement setVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureQualitySelector(QualitySelector qualitySelector) {
    // TODO: implement setVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureTargetFrameRate(Range<int> targetFrameRate) {
    // TODO: implement setVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) {
    // TODO: implement setZoomRatio
    throw UnimplementedError();
  }

  @override
  Future<Recording> startRecording(
      {required Uri uri,
      required bool enableAudio,
      required VideoRecordEventCallback listener}) {
    // TODO: implement startRecording
    throw UnimplementedError();
  }

  @override
  Future<Uri> takePicture({required Uri uri}) {
    // TODO: implement takePicture
    throw UnimplementedError();
  }

  @override
  // TODO: implement torchStateChanged
  Stream<bool?> get torchStateChanged => throw UnimplementedError();

  @override
  Future<void> unbind() async {
    await obj.unbind();
  }

  @override
  // TODO: implement zoomStateChanged
  Stream<ZoomState?> get zoomStateChanged => throw UnimplementedError();
}
