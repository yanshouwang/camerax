import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CameraCaptureSession$CaptureCallback {
  factory CameraCaptureSession$CaptureCallback({
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      int timestamp,
      int frameNumber,
    )?
    onCaptureStarted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      CaptureResult partialResult,
    )?
    onCaptureProgressed,
    void Function(
      CameraCaptureSession session,
      int sequenceId,
      int frameNumber,
    )?
    onCaptureSequenceCompleted,
    void Function(CameraCaptureSession session, int sequenceId)?
    onCaptureSequenceAborted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      Surface target,
      int frameNumber,
    )?
    onCaptureBufferLost,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      TotalCaptureResult result,
    )?
    onCaptureCompleted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      CaptureFailure failure,
    )?
    onCaptureFailed,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      int timestamp,
      int frameNumber,
    )?
    onReadoutStarted,
  }) => CameraCaptureSessionChannel.instance.createCaptureCallback(
    onCaptureStarted: onCaptureStarted,
    onCaptureProgressed: onCaptureProgressed,
    onCaptureSequenceCompleted: onCaptureSequenceCompleted,
    onCaptureSequenceAborted: onCaptureSequenceAborted,
    onCaptureBufferLost: onCaptureBufferLost,
    onCaptureCompleted: onCaptureCompleted,
    onCaptureFailed: onCaptureFailed,
    onReadoutStarted: onReadoutStarted,
  );
}

abstract interface class CameraCaptureSession$StateCallback {
  factory CameraCaptureSession$StateCallback({
    void Function(CameraCaptureSession session)? onActive,
    void Function(CameraCaptureSession session)? onCaptureQueueEmpty,
    void Function(CameraCaptureSession session)? onClosed,
    void Function(CameraCaptureSession session)? onConfigureFailed,
    void Function(CameraCaptureSession session)? onConfigured,
    void Function(CameraCaptureSession session)? onReady,
    void Function(CameraCaptureSession session, Surface surface)?
    onSurfacePrepared,
  }) => CameraCaptureSessionChannel.instance.createStateCallback(
    onActive: onActive,
    onCaptureQueueEmpty: onCaptureQueueEmpty,
    onClosed: onClosed,
    onConfigureFailed: onConfigureFailed,
    onConfigured: onConfigured,
    onReady: onReady,
    onSurfacePrepared: onSurfacePrepared,
  );
}

abstract interface class CameraCaptureSession {}

abstract base class CameraCaptureSessionChannel extends PlatformInterface {
  CameraCaptureSessionChannel() : super(token: _token);

  static final _token = Object();

  static CameraCaptureSessionChannel? _instance;

  static CameraCaptureSessionChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraCaptureSessionChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  CameraCaptureSession$CaptureCallback createCaptureCallback({
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      int timestamp,
      int frameNumber,
    )?
    onCaptureStarted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      CaptureResult partialResult,
    )?
    onCaptureProgressed,
    void Function(
      CameraCaptureSession session,
      int sequenceId,
      int frameNumber,
    )?
    onCaptureSequenceCompleted,
    void Function(CameraCaptureSession session, int sequenceId)?
    onCaptureSequenceAborted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      Surface target,
      int frameNumber,
    )?
    onCaptureBufferLost,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      TotalCaptureResult result,
    )?
    onCaptureCompleted,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      CaptureFailure failure,
    )?
    onCaptureFailed,
    void Function(
      CameraCaptureSession session,
      CaptureRequest request,
      int timestamp,
      int frameNumber,
    )?
    onReadoutStarted,
  });

  CameraCaptureSession$StateCallback createStateCallback({
    void Function(CameraCaptureSession session)? onActive,
    void Function(CameraCaptureSession session)? onCaptureQueueEmpty,
    void Function(CameraCaptureSession session)? onClosed,
    void Function(CameraCaptureSession session)? onConfigureFailed,
    void Function(CameraCaptureSession session)? onConfigured,
    void Function(CameraCaptureSession session)? onReady,
    void Function(CameraCaptureSession session, Surface surface)?
    onSurfacePrepared,
  });
}
