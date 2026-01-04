import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraCaptureSession$CaptureCallbackImpl
    implements CameraCaptureSession$CaptureCallback {
  final CameraCaptureSessionCaptureCallbackProxyApi api;

  CameraCaptureSession$CaptureCallbackImpl.internal(this.api);
}

final class CameraCaptureSession$StateCallbackImpl
    implements CameraCaptureSession$StateCallback {
  final CameraCaptureSessionStateCallbackProxyApi api;

  CameraCaptureSession$StateCallbackImpl.internal(this.api);
}

final class CameraCaptureSessionImpl implements CameraCaptureSession {
  final CameraCaptureSessionProxyApi api;

  CameraCaptureSessionImpl.internal(this.api);
}

final class CameraCaptureSessionChannelImpl
    extends CameraCaptureSessionChannel {
  @override
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
  }) {
    final api = CameraCaptureSessionCaptureCallbackProxyApi(
      onCaptureStarted: onCaptureStarted == null
          ? null
          : (_, e1, e2, e3, e4) => onCaptureStarted(e1.impl, e2.impl, e3, e4),
      onCaptureProgressed: onCaptureProgressed == null
          ? null
          : (_, e1, e2, e3) => onCaptureProgressed(e1.impl, e2.impl, e3.impl),
      onCaptureSequenceCompleted: onCaptureSequenceCompleted == null
          ? null
          : (_, e1, e2, e3) => onCaptureSequenceCompleted(e1.impl, e2, e3),
      onCaptureSequenceAborted: onCaptureSequenceAborted == null
          ? null
          : (_, e1, e2) => onCaptureSequenceAborted(e1.impl, e2),
      onCaptureBufferLost: onCaptureBufferLost == null
          ? null
          : (_, e1, e2, e3, e4) =>
                onCaptureBufferLost(e1.impl, e2.impl, e3.impl, e4),
      onCaptureCompleted: onCaptureCompleted == null
          ? null
          : (_, e1, e2, e3) => onCaptureCompleted(e1.impl, e2.impl, e3.impl),
      onCaptureFailed: onCaptureFailed == null
          ? null
          : (_, e1, e2, e3) => onCaptureFailed(e1.impl, e2.impl, e3.impl),
      onReadoutStarted: onReadoutStarted == null
          ? null
          : (_, e1, e2, e3, e4) => onReadoutStarted(e1.impl, e2.impl, e3, e4),
    );
    return CameraCaptureSession$CaptureCallbackImpl.internal(api);
  }

  @override
  CameraCaptureSession$StateCallback createStateCallback({
    void Function(CameraCaptureSession session)? onActive,
    void Function(CameraCaptureSession session)? onCaptureQueueEmpty,
    void Function(CameraCaptureSession session)? onClosed,
    void Function(CameraCaptureSession session)? onConfigureFailed,
    void Function(CameraCaptureSession session)? onConfigured,
    void Function(CameraCaptureSession session)? onReady,
    void Function(CameraCaptureSession session, Surface surface)?
    onSurfacePrepared,
  }) {
    final api = CameraCaptureSessionStateCallbackProxyApi(
      onActive: onActive == null ? null : (_, e) => onActive(e.impl),
      onCaptureQueueEmpty: onCaptureQueueEmpty == null
          ? null
          : (_, e) => onCaptureQueueEmpty(e.impl),
      onClosed: onClosed == null ? null : (_, e) => onClosed(e.impl),
      onConfigureFailed: onConfigureFailed == null
          ? null
          : (_, e) => onConfigureFailed(e.impl),
      onConfigured: onConfigured == null
          ? null
          : (_, e) => onConfigured(e.impl),
      onReady: onReady == null ? null : (_, e) => onReady(e.impl),
      onSurfacePrepared: onSurfacePrepared == null
          ? null
          : (_, e1, e2) => onSurfacePrepared(e1.impl, e2.impl),
    );
    return CameraCaptureSession$StateCallbackImpl.internal(api);
  }
}

extension CameraCaptureSession$CaptureCallbackX
    on CameraCaptureSession$CaptureCallback {
  CameraCaptureSessionCaptureCallbackProxyApi get api {
    final impl = this;
    if (impl is! CameraCaptureSession$CaptureCallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraCaptureSession$StateCallbackX
    on CameraCaptureSession$StateCallback {
  CameraCaptureSessionStateCallbackProxyApi get api {
    final impl = this;
    if (impl is! CameraCaptureSession$StateCallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraCaptureSessionProxyApiX on CameraCaptureSessionProxyApi {
  CameraCaptureSession get impl => CameraCaptureSessionImpl.internal(this);
}
