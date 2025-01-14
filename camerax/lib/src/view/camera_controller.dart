import 'dart:async';

import 'package:camerax/src/core.dart';
import 'package:camerax/src/ml.dart';
import 'package:camerax/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

/// This a high level controller that provides most of the CameraX core features
/// in a single class. It handles camera initialization, creates and configures
/// UseCases. It also listens to device motion sensor and set the target rotation
/// for the use cases.
///
/// The controller is required to be used with a PreviewView. PreviewView provides
/// the UI elements to display camera preview. The layout of the PreviewView is
/// used to set the crop rect so the output from other use cases matches the
/// preview display in a WYSIWYG way. The controller also listens to PreviewView's
/// touch events to handle tap-to-focus and pinch-to-zoom features.
///
/// This class provides features of 4 UseCases: Preview, ImageCapture, ImageAnalysis
/// and VideoCapture. Preview is required and always enabled. ImageCapture and
/// ImageAnalysis are enabled by default. The video capture is disabled by default
/// because it might affect other use cases, especially on lower end devices. It
/// might be necessary to disable ImageCapture and/or ImageAnalysis before the
/// video capture feature can be enabled. Disabling/enabling UseCases freezes the
/// preview for a short period of time. To avoid the glitch, the UseCases need to
/// be enabled/disabled before the controller is set on PreviewView.
final class CameraController with ChangeNotifier {
  final $base.CameraController _obj;

  $base.ZoomState? _zoomState;
  $base.TorchState? _torchState;

  late final StreamSubscription _zoomStateChangedSubscription;
  late final StreamSubscription _torchStateChangedSubscription;

  CameraController()
      : _obj = $base.CameraController(),
        _zoomState = null,
        _torchState = null {
    _zoomStateChangedSubscription = _obj.zoomStateChanged.listen(
      (zoomState) {
        _zoomState = zoomState;
        notifyListeners();
      },
    );
    _torchStateChangedSubscription = _obj.torchStateChanged.listen(
      (torchState) {
        _torchState = torchState;
        notifyListeners();
      },
    );
  }

  @internal
  $base.CameraController get obj => _obj;
  $base.ZoomState? get zoomState => _zoomState;
  $base.TorchState? get torchState => _torchState;

  Future<void> initialize() => _obj.initialize();

  /// Sets the LifecycleOwner to be bound with the controller.
  ///
  /// The state of the lifecycle will determine when the cameras are open, started,
  /// stopped and closed. When the LifecycleOwner's state is start or greater,
  /// the controller receives camera data. It stops once the LifecycleOwner is
  /// destroyed.
  Future<void> bind() => _obj.bind();

  /// Clears the previously set LifecycleOwner and stops the camera.
  Future<void> unbind() => _obj.unbind();

  /// Checks if the given CameraSelector can be resolved to a camera.
  ///
  /// Use this method to check if the device has the given camera.
  ///
  /// Only call this method after camera is initialized. e.g. after the ListenableFuture
  /// from getInitializationFuture is finished. Calling it prematurely throws
  /// IllegalStateException.
  Future<bool> hasCamera($base.CameraSelector cameraSelector) =>
      _obj.hasCamera(cameraSelector);

  /// Gets the CameraSelector.
  ///
  /// The default value isDEFAULT_BACK_CAMERA.
  Future<CameraSelector> getCameraSelector() async {
    final obj = await _obj.getCameraSelector();
    return obj.args;
  }

  /// Sets the CameraSelector.
  ///
  /// Calling this method with a CameraSelector that resolves to a different camera
  /// will change the camera being used by the controller. If camera initialization
  /// is complete, the controller will immediately rebind use cases with the new
  /// CameraSelector; otherwise, the new CameraSelector will be used when the
  /// camera becomes ready.
  ///
  /// The default value is DEFAULT_BACK_CAMERA.
  Future<void> setCameraSelector(CameraSelector cameraSelector) =>
      _obj.setCameraSelector(cameraSelector.obj);

  /// Gets the CameraInfo of the currently attached camera.
  ///
  /// For info available directly through CameraController as well as CameraInfo,
  /// it's recommended to use the ones with CameraController, e.g. getTorchState
  /// v.s. getTorchState. CameraInfo is a lower-layer API and may require more
  /// steps to achieve the same effect, and will not maintain values when switching
  /// between cameras.
  Future<CameraInfo?> getCameraInfo() async {
    final obj = await _obj.getCameraInfo();
    return obj?.args;
  }

  /// Gets the CameraControl of the currently attached camera.
  ///
  /// For controls available directly through CameraController as well as
  /// CameraControl, it's recommended to use the ones with CameraController, e.g.
  /// setLinearZoom v.s. setLinearZoom. CameraControl is a lower-layer API and
  /// may require more steps to achieve the same effect, and will not maintain
  /// control values when switching between cameras.
  Future<CameraControl?> getCameraControl() async {
    final obj = await _obj.getCameraControl();
    return obj?.args;
  }

  /// Returns a LiveData of current TorchState.
  ///
  /// The torch can be turned on and off via enableTorch which will trigger the
  /// change event to the returned LiveData.
  Future<$base.TorchState?> getTorchState() => _obj.getTorchState();

  /// Enable the torch or disable the torch.
  ///
  /// If the value is set before the camera is ready, CameraController waits for
  /// the camera to be ready and then enables the torch.
  Future<void> enableTorch(bool enabled) => _obj.enableTorch(enabled);

  /// Returns a LiveData of ZoomState.
  ///
  /// The LiveData will be updated whenever the set zoom state has been changed.
  /// This can occur when the application updates the zoom via setZoomRatio or
  /// setLinearZoom. The zoom state can also change anytime a camera starts up,
  /// for example when setCameraSelector is called.
  Future<$base.ZoomState?> getZoomState() => _obj.getZoomState();

  /// Sets current zoom by ratio.
  ///
  /// Valid zoom values range from getMinZoomRatio to getMaxZoomRatio.
  ///
  /// If the value is set before the camera is ready, CameraController waits for
  /// the camera to be ready and then sets the zoom ratio.
  Future<void> setZoomRatio(double zoomRatio) => _obj.setZoomRatio(zoomRatio);

  /// Sets current zoom by a linear zoom value ranging from 0f to 1.0f.
  ///
  /// LinearZoom 0f represents the minimum zoom while linearZoom 1.0f represents
  /// the maximum zoom. The advantage of linearZoom is that it ensures the field
  /// of view (FOV) varies linearly with the linearZoom value, for use with slider
  /// UI elements (while setZoomRatio works well for pinch-zoom gestures).
  ///
  /// If the value is set before the camera is ready, CameraController waits for
  /// the camera to be ready and then sets the linear zoom.
  Future<void> setLinearZoom(double linearZoom) =>
      _obj.setLinearZoom(linearZoom);

  /// Returns whether pinch-to-zoom is enabled.
  ///
  /// By default pinch-to-zoom is enabled.
  Future<bool> isPinchToZoomEnabled() => _obj.isPinchToZoomEnabled();

  /// Enables/disables pinch-to-zoom.
  ///
  /// Once enabled, end user can pinch on the PreviewView to zoom in/out if the
  /// bound camera supports zooming.
  Future<void> setPinchToZoomEnabled(bool enabled) =>
      _obj.setPinchToZoomEnabled(enabled);

  /// Returns whether tap-to-focus is enabled.
  ///
  /// By default tap-to-focus is enabled.
  Future<bool> isTapToFocusEnabled() => _obj.isTapToFocusEnabled();

  /// Enables/disables tap-to-focus.
  ///
  /// Once enabled, end user can tap on the PreviewView to set focus point.
  Future<void> setTapToFocusEnabled(bool enabled) =>
      _obj.setTapToFocusEnabled(enabled);

  /// Checks if ImageAnalysis is enabled.
  Future<bool> isImageAnalysisEnabled() => _obj.isImageAnalysisEnabled();

  /// Checks if ImageCapture is enabled.
  ///
  /// ImageCapture is enabled by default. It has to be enabled before takePicture
  /// can be called.
  Future<bool> isImageCaptureEnabled() => _obj.isImageCaptureEnabled();

  /// Checks if video capture is enabled.
  ///
  /// Video capture is disabled by default. It has to be enabled before startRecording can be called.
  Future<bool> isVideoCaptureEnabled() => _obj.isVideoCaptureEnabled();

  /// Enables or disables use cases.
  ///
  /// Use cases need to be enabled before they can be used. By default, IMAGE_CAPTURE
  /// and IMAGE_ANALYSIS are enabled, and VIDEO_CAPTURE is disabled. This is
  /// necessary because VIDEO_CAPTURE may affect the available resolutions for
  /// other use cases, especially on lower end devices.
  ///
  /// To make sure getting the maximum resolution, only enable VIDEO_CAPTURE when
  /// shooting video.
  Future<void> setEnabledUseCases(List<$base.UseCase> useCases) =>
      _obj.setEnabledUseCases(useCases);

  /// Returns the ResolutionSelector for Preview.
  ///
  /// This method returns the value set by setPreviewResolutionSelector. It returns
  /// null if the value has not been set.
  Future<$base.ResolutionSelector?> getPreviewResolutionSelector() =>
      _obj.getPreviewResolutionSelector();

  /// Sets the ResolutionSelector for Preview.
  ///
  /// CameraX uses this value as a hint to select the resolution for preview. The
  /// actual output may differ from the requested value due to device constraints.
  /// When set to null, CameraX will use the default config of Preview. By default,
  /// the selected resolution will be limited by the PREVIEW size which is defined
  /// as the best size match to the device's screen resolution, or to 1080p
  /// (1920x1080), whichever is smaller.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setPreviewResolutionSelector(
          $base.ResolutionSelector? resolutionSelector) =>
      _obj.setPreviewResolutionSelector(resolutionSelector);

  /// Gets the flash mode for ImageCapture.
  Future<$base.FlashMode> getImageCaptureFlashMode() =>
      _obj.getImageCaptureFlashMode();

  /// Sets the flash mode for ImageCapture.
  ///
  /// If not set, the flash mode will default to FLASH_MODE_OFF.
  ///
  /// If FLASH_MODE_SCREEN is set, a valid android.view.Window instance must be
  /// set to a PreviewView or ScreenFlashView which this controller is set to.
  /// Trying to use FLASH_MODE_SCREEN with a non-front camera or without setting
  /// a non-null window will be no-op. While switching the camera, it is the
  /// application's responsibility to change flash mode to the desired one if it
  /// leads to a no-op case (e.g. switching to rear camera while FLASH_MODE_SCREEN
  /// is still set). Otherwise, FLASH_MODE_OFF will be set.
  Future<void> setImageCaptureFlashMode($base.FlashMode flashMode) =>
      _obj.setImageCaptureFlashMode(flashMode);

  /// Returns the image capture mode.
  Future<$base.CaptureMode> getImageCaptureMode() => _obj.getImageCaptureMode();

  /// Sets the image capture mode.
  ///
  /// Valid capture modes are CAPTURE_MODE_MINIMIZE_LATENCY, which prioritizes
  /// latency over image quality, or CAPTURE_MODE_MAXIMIZE_QUALITY, which prioritizes
  /// image quality over latency.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setImageCaptureMode($base.CaptureMode captureMode) =>
      _obj.setImageCaptureMode(captureMode);

  /// Returns the ResolutionSelector for ImageCapture.
  ///
  /// This method returns the value set by setImageCaptureResolutionSelector
  /// (ResolutionSelector)}. It returns null if the value has not been set.
  Future<$base.ResolutionSelector?> getImageCaptureResolutionSelector() =>
      _obj.getImageCaptureResolutionSelector();

  /// Sets the ResolutionSelector for ImageCapture.
  ///
  /// CameraX uses this value as a hint to select the resolution for captured
  /// images. The actual output may differ from the requested value due to device
  /// constraints. When set to null, CameraX will use the default config of
  /// ImageCapture. The default resolution strategy for ImageCapture is
  /// HIGHEST_AVAILABLE_STRATEGY, which will select the largest available resolution
  /// to use.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setImageCaptureResolutionSelector(
          $base.ResolutionSelector? resolutionSelector) =>
      _obj.setImageCaptureResolutionSelector(resolutionSelector);

  /// Captures a new still image for in memory access.
  ///
  /// The listener is responsible for calling close on the returned image.
  Future<void> takePictureToMemory({
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    CaptureSuccessCallback? onCaptureSuccess,
    $base.CaptureErrorCallback? onError,
  }) =>
      _obj.takePictureToMemory(
        onCaptureStarted: onCaptureStarted,
        onCaptureProcessProgressed: onCaptureProcessProgressed,
        onPostviewBitmapAvailable: onPostviewBitmapAvailable,
        onCaptureSuccess: onCaptureSuccess == null
            ? null
            : (image) => onCaptureSuccess(image.args),
        onError: onError,
      );

  /// Captures a new still image and saves to a file along with application
  /// specified metadata.
  ///
  /// The callback will be called only once for every invocation of this method.
  ///
  /// By default, the saved image is mirrored to match the output of the preview
  /// if front camera is used. To override this behavior, the app needs to explicitly
  /// set the flag to false using setReversedHorizontal and setMetadata.
  ///
  /// The saved image is cropped to match the aspect ratio of the PreviewView. To
  /// take a picture with the maximum available resolution, make sure that the
  /// PreviewView's aspect ratio matches the max JPEG resolution supported by the
  /// camera.
  Future<void> takePictureToFile(
    OutputFileOptions outputFileOptions, {
    $base.CaptureStartedCallback? onCaptureStarted,
    $base.CaptureProcessProgressedCallback? onCaptureProcessProgressed,
    $base.PostviewBitmapAvailableCallback? onPostviewBitmapAvailable,
    $base.ImageSavedCallback? onImageSaved,
    $base.CaptureErrorCallback? onError,
  }) =>
      _obj.takePictureToFile(
        outputFileOptions.obj,
        onCaptureStarted: onCaptureStarted,
        onCaptureProcessProgressed: onCaptureProcessProgressed,
        onPostviewBitmapAvailable: onPostviewBitmapAvailable,
        onImageSaved: onImageSaved,
        onError: onError,
      );

  /// Returns the mode with which images are acquired.
  ///
  /// If not set, it defaults to STRATEGY_KEEP_ONLY_LATEST.
  Future<$base.BackpressureStrategy> getImageAnalysisBackpressureStrategy() =>
      _obj.getImageAnalysisBackpressureStrategy();

  /// Sets the backpressure strategy to apply to the image producer to deal with
  /// scenarios where images may be produced faster than they can be analyzed.
  ///
  /// The available values are STRATEGY_BLOCK_PRODUCER and STRATEGY_KEEP_ONLY_LATEST.
  /// If not set, the backpressure strategy will default to STRATEGY_KEEP_ONLY_LATEST.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setImageAnalysisBackpressureStrategy(
          $base.BackpressureStrategy strategy) =>
      _obj.setImageAnalysisBackpressureStrategy(strategy);

  /// Gets the image queue depth of ImageAnalysis.
  Future<int> getImageAnalysisImageQueueDepth() =>
      _obj.getImageAnalysisImageQueueDepth();

  /// Sets the image queue depth of ImageAnalysis.
  ///
  /// This sets the number of images available in parallel to ImageAnalysis.Analyzer.
  /// The value is only used if the backpressure strategy is STRATEGY_BLOCK_PRODUCER.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setImageAnalysisImageQueueDepth(int depth) =>
      _obj.setImageAnalysisImageQueueDepth(depth);

  /// Gets the output image format for ImageAnalysis.
  ///
  /// The returned image format can be either OUTPUT_IMAGE_FORMAT_YUV_420_888 or
  /// OUTPUT_IMAGE_FORMAT_RGBA_8888.
  Future<$base.ImageFormat> getImageAnalysisOutputImageFormat() =>
      _obj.getImageAnalysisOutputImageFormat();

  /// Sets the output image format for ImageAnalysis.
  ///
  /// The supported output image format are OUTPUT_IMAGE_FORMAT_YUV_420_888 and
  /// OUTPUT_IMAGE_FORMAT_RGBA_8888.
  ///
  /// If not set, OUTPUT_IMAGE_FORMAT_YUV_420_888 will be used.
  ///
  /// Requesting OUTPUT_IMAGE_FORMAT_RGBA_8888 causes extra overhead because format
  /// conversion takes time.
  ///
  /// Changing the value will reconfigure the camera, which may cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  /// If the value is changed when the camera is active, check the getFormat value
  /// to determine when the new format takes effect.
  Future<void> setImageAnalysisOutputImageFormat($base.ImageFormat format) =>
      _obj.setImageAnalysisOutputImageFormat(format);

  /// Returns the ResolutionSelector for ImageAnalysis.
  ///
  /// This method returns the value set by setImageAnalysisResolutionSelector. It
  /// returns null if the value has not been set.
  Future<$base.ResolutionSelector?> getImageAnalysisResolutionSelector() =>
      _obj.getImageAnalysisResolutionSelector();

  /// Sets the ResolutionSelector for ImageAnalysis.
  ///
  /// CameraX uses this value as a hint to select the resolution for images.
  /// The actual output may differ from the requested value due to device constraints.
  /// When set to null, CameraX will use the default config of ImageAnalysis.
  /// ImageAnalysis has a default ResolutionStrategy with bound size as 640x480
  /// and fallback rule of FALLBACK_RULE_CLOSEST_HIGHER_THEN_LOWER.
  ///
  /// Changing the value will reconfigure the camera which will cause additional
  /// latency. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setImageAnalysisResolutionSelector(
          $base.ResolutionSelector? resolutionSelector) =>
      _obj.setImageAnalysisResolutionSelector(resolutionSelector);

  /// Sets an analyzer to receive and analyze images.
  ///
  /// Applications can process or copy the image by implementing the ImageAnalysis.Analyzer.
  /// The image needs to be closed by calling close when the analyzing is done.
  ///
  /// Setting an analyzer function replaces any previous analyzer. Only one analyzer
  /// can be set at any time.
  ///
  /// If the getTargetCoordinateSystem returns COORDINATE_SYSTEM_VIEW_REFERENCED,
  /// the analyzer will receive a transformation via updateTransform that converts
  /// coordinates from the ImageAnalysis's coordinate system to the PreviewView's
  /// coordinate system.
  ///
  /// If the getDefaultTargetResolution returns a non-null value, calling this
  /// method will reconfigure the camera which might cause additional latency.
  /// To avoid this, set the value before controller is bound to the lifecycle.
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer) async {
    if (analyzer is MlKitAnalyzer) {
      await _obj.setImageAnalysisAnalyzer(analyzer.obj);
    } else {
      final obj = _RawAnalyzer(analyzer);
      await _obj.setImageAnalysisAnalyzer(obj);
    }
  }

  /// Removes a previously set analyzer.
  ///
  /// This will stop data from streaming to the ImageAnalysis.
  ///
  /// If the current getDefaultTargetResolution returns non-null value, calling
  /// this method will reconfigure the camera which might cause additional latency.
  /// To avoid this, call this method when the lifecycle is not active.
  Future<void> clearImageAnalysisAnalyzer() =>
      _obj.clearImageAnalysisAnalyzer();

  /// Gets the DynamicRange for video capture.
  Future<$base.DynamicRange> getVideoCaptureDynamicRange() =>
      _obj.getVideoCaptureDynamicRange();

  /// Sets the DynamicRange for video capture.
  ///
  /// The dynamic range specifies how the range of colors, highlights and shadows
  /// that are captured by the video producer are displayed on a display. Some
  /// dynamic ranges will allow the video to make full use of the extended range
  /// of brightness of a display when the video is played back.
  ///
  /// The supported dynamic ranges for video capture can be queried through the
  /// androidx.camera.video.VideoCapabilities returned by getVideoCapabilities
  /// via getSupportedDynamicRanges.
  ///
  /// It is possible to choose a high dynamic range (HDR) with unspecified encoding
  /// by providing HDR_UNSPECIFIED_10_BIT.
  ///
  /// If the dynamic range is not provided, the default value is SDR.
  Future<void> setVideoCaptureDynamicRange($base.DynamicRange dynamicRange) =>
      _obj.setVideoCaptureDynamicRange(dynamicRange);

  /// Gets the mirror mode for video capture.
  Future<$base.MirrorMode> getVideoCaptureMirrorMode() =>
      _obj.getVideoCaptureMirrorMode();

  /// Sets the mirror mode for video capture.
  ///
  /// Valid values include: MIRROR_MODE_OFF, MIRROR_MODE_ON and MIRROR_MODE_ON_FRONT_ONLY.
  /// If not set, it defaults to MIRROR_MODE_OFF.
  Future<void> setVideoCaptureMirrorMode($base.MirrorMode mirrorMode) =>
      _obj.setVideoCaptureMirrorMode(mirrorMode);

  /// Returns the QualitySelector for VIDEO_CAPTURE.
  Future<QualitySelector> getVideoCaptureQualitySelector() async {
    final obj = await _obj.getVideoCaptureQualitySelector();
    return obj.args;
  }

  /// Sets the QualitySelector for VIDEO_CAPTURE.
  ///
  /// The provided quality selector is used to select the resolution of the
  /// recording depending on the resolutions supported by the camera and codec
  /// capabilities.
  ///
  /// If no quality selector is provided, the default is DEFAULT_QUALITY_SELECTOR.
  ///
  /// Changing the value will reconfigure the camera which will cause video capture
  /// to stop. To avoid this, set the value before controller is bound to lifecycle.
  Future<void> setVideoCaptureQualitySelector(
          QualitySelector qualitySelector) =>
      _obj.setVideoCaptureQualitySelector(qualitySelector.obj);

  /// Gets the target frame rate in frames per second for video capture.
  Future<$base.Range<int>> getVideoCaptureTargetFrameRate() =>
      _obj.getVideoCaptureTargetFrameRate();

  /// Sets the target frame rate range in frames per second for video capture.
  ///
  /// This target will be used as a part of the heuristics for the algorithm that
  /// determines the final frame rate range and resolution of all concurrently
  /// bound use cases.
  ///
  /// It is not guaranteed that this target frame rate will be the final range,
  /// as other use cases as well as frame rate restrictions of the device may
  /// affect the outcome of the algorithm that chooses the actual frame rate.
  ///
  /// By default, the value is FRAME_RATE_RANGE_UNSPECIFIED. For supported frame
  /// rates, see getSupportedFrameRateRanges.
  Future<void> setVideoCaptureTargetFrameRate(
          $base.Range<int> targetFrameRate) =>
      _obj.setVideoCaptureTargetFrameRate(targetFrameRate);

  /// Returns whether there is an in-progress video recording.
  Future<bool> isRecording() => _obj.isRecording();

  /// Takes a video to a given file.
  ///
  /// Only a single recording can be active at a time, so if isRecording is true,
  /// this will throw an IllegalStateException.
  ///
  /// Upon successfully starting the recording, a VideoRecordEvent.Start event
  /// will be the first event sent to the provided event listener.
  ///
  /// If errors occur while starting the recording, a VideoRecordEvent.Finalize
  /// event will be the first event sent to the provided listener, and information
  /// about the error can be found in that event's getError method.
  ///
  /// Recording with audio requires the RECORD_AUDIO permission; without it,
  /// starting a recording will fail with a SecurityException.
  Future<Recording> startRecording(
    FileOutputOptions outputOptions, {
    required $base.AudioConfig audioConfig,
    required $base.VideoRecordEventConsumer listener,
  }) async {
    final obj = await _obj.startRecording(
      outputOptions.obj,
      audioConfig: audioConfig,
      listener: listener,
    );
    return obj.args;
  }

  @override
  void dispose() {
    _zoomStateChangedSubscription.cancel();
    _torchStateChangedSubscription.cancel();
    super.dispose();
  }
}

final class _RawAnalyzer implements $base.Analyzer {
  final Analyzer _analyzer;

  _RawAnalyzer(this._analyzer);

  @override
  void analyze($base.ImageProxy image) {
    _analyzer.analyze(image.args);
  }
}
