import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class CameraController extends $interface.CameraController {
  final $native.LifecycleCameraController obj;
  final $native.PreviewView viewObj;

  CameraController.$native(this.obj, this.viewObj) : super.impl();

  factory CameraController() {
    final obj = $native.LifecycleCameraController();
    final viewObj = $native.PreviewView();
    return CameraController.$native(obj, viewObj);
  }

  @override
  Future<void> initialize() async {
    await obj.initialize();
  }

  @override
  Future<bool> hasCamera($interface.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    final hasCamera = await obj.hasCamera(cameraSelector.obj);
    return hasCamera;
  }

  @override
  Future<$interface.CameraSelector> getCameraSelector() async {
    final cameraSelectorObj = await obj.getCameraSelector();
    return CameraSelector.$native(cameraSelectorObj);
  }

  @override
  Future<void> setCameraSelector(
      $interface.CameraSelector cameraSelector) async {
    if (cameraSelector is! CameraSelector) {
      throw TypeError();
    }
    await obj.setCameraSelector(cameraSelector.obj);
  }

  @override
  Future<void> bind() async {
    await obj.bindToLifecycle();
  }

  @override
  Future<void> unbind() async {
    await obj.unbind();
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
  Future<$interface.CameraControl> getCameraControl() {
    // TODO: implement getCameraControl
    throw UnimplementedError();
  }

  @override
  Future<$interface.CameraInfo> getCameraInfo() {
    // TODO: implement getCameraInfo
    throw UnimplementedError();
  }

  @override
  Future<$interface.BackpressureStrategy>
      getImageAnalysisBackpressureStrategy() {
    // TODO: implement getImageAnalysisBackpressureStrategy
    throw UnimplementedError();
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() {
    // TODO: implement getImageAnalysisImageQueueDepth
    throw UnimplementedError();
  }

  @override
  Future<$interface.ImageFormat> getImageAnalysisOutputImageFormat() {
    // TODO: implement getImageAnalysisOutputImageFormat
    throw UnimplementedError();
  }

  @override
  Future<$interface.ResolutionSelector?> getImageAnalysisResolutionSelector() {
    // TODO: implement getImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<$interface.FlashMode> getImageCaptureFlashMode() {
    // TODO: implement getImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<$interface.CaptureMode> getImageCaptureMode() {
    // TODO: implement getImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<$interface.ResolutionSelector?> getImageCaptureResolutionSelector() {
    // TODO: implement getImageCaptureResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<$interface.ResolutionSelector?> getPreviewResolutionSelector() {
    // TODO: implement getPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<bool?> getTorchState() {
    // TODO: implement getTorchState
    throw UnimplementedError();
  }

  @override
  Future<$interface.DynamicRange> getVideoCaptureDynamicRange() {
    // TODO: implement getVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<$interface.MirrorMode> getVideoCaptureMirrorMode() {
    // TODO: implement getVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<$interface.QualitySelector> getVideoCaptureQualitySelector() {
    // TODO: implement getVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<$interface.Range<int>> getVideoCaptureTargetFrameRate() {
    // TODO: implement getVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }

  @override
  Future<$interface.ZoomState?> getZoomState() async {
    final zoomState = await obj.getZoomState();
    final observer = $native.Observer(
      onChanged: (observer, value) {},
    );
    zoomState.observe(observer);
    final value = await zoomState.getValue();
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
  Future<void> setEnabledUseCases(List<$interface.UseCase> useCases) {
    // TODO: implement setEnabledUseCases
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisAnalyzer($interface.Analyzer analyzer) {
    // TODO: implement setImageAnalysisAnalyzer
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      $interface.BackpressureStrategy backpressureStrategy) {
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
      $interface.ImageFormat outputImageFormat) {
    // TODO: implement setImageAnalysisOutputImageFormat
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      $interface.ResolutionSelector? resolutionSelector) {
    // TODO: implement setImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureFlashMode($interface.FlashMode flashMode) {
    // TODO: implement setImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureMode($interface.CaptureMode captureMode) {
    // TODO: implement setImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      $interface.ResolutionSelector? resolutionSelector) {
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
      $interface.ResolutionSelector? resolutionSelector) {
    // TODO: implement setPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) {
    // TODO: implement setTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureDynamicRange(
      $interface.DynamicRange dynamicRange) {
    // TODO: implement setVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureMirrorMode($interface.MirrorMode mirrorMode) {
    // TODO: implement setVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureQualitySelector(
      $interface.QualitySelector qualitySelector) {
    // TODO: implement setVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureTargetFrameRate(
      $interface.Range<int> targetFrameRate) {
    // TODO: implement setVideoCaptureTargetFrameRate
    throw UnimplementedError();
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) {
    // TODO: implement setZoomRatio
    throw UnimplementedError();
  }

  @override
  Future<$interface.Recording> startRecording(
      {required Uri uri,
      required bool enableAudio,
      required $interface.VideoRecordEventCallback listener}) {
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
  // TODO: implement zoomStateChanged
  Stream<$interface.ZoomState?> get zoomStateChanged =>
      throw UnimplementedError();
}
