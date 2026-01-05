package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CameraCaptureSession
import android.hardware.camera2.CaptureFailure
import android.hardware.camera2.CaptureRequest
import android.hardware.camera2.CaptureResult
import android.hardware.camera2.TotalCaptureResult
import android.view.Surface
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraCaptureSessionCaptureCallbackProxyApi
import dev.zeekr.camerax_android.PigeonApiCameraCaptureSessionStateCallbackProxyApi

class CameraCaptureSessionImpl {
    class CaptureCallbackImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCameraCaptureSessionCaptureCallbackProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): CameraCaptureSession.CaptureCallback {
            return object : CameraCaptureSession.CaptureCallback() {
                override fun onCaptureBufferLost(
                    session: CameraCaptureSession, request: CaptureRequest, target: Surface, frameNumber: Long
                ) {
                    super.onCaptureBufferLost(session, request, target, frameNumber)
                    this@CaptureCallbackImpl.onCaptureBufferLost(this, session, request, target, frameNumber) {}
                }

                override fun onCaptureCompleted(
                    session: CameraCaptureSession, request: CaptureRequest, result: TotalCaptureResult
                ) {
                    super.onCaptureCompleted(session, request, result)
                    this@CaptureCallbackImpl.onCaptureCompleted(this, session, request, result) {}
                }

                override fun onCaptureFailed(
                    session: CameraCaptureSession, request: CaptureRequest, failure: CaptureFailure
                ) {
                    super.onCaptureFailed(session, request, failure)
                    this@CaptureCallbackImpl.onCaptureFailed(this, session, request, failure) {}
                }

                override fun onCaptureProgressed(
                    session: CameraCaptureSession, request: CaptureRequest, partialResult: CaptureResult
                ) {
                    super.onCaptureProgressed(session, request, partialResult)
                    this@CaptureCallbackImpl.onCaptureProgressed(this, session, request, partialResult) {}
                }

                override fun onCaptureSequenceAborted(session: CameraCaptureSession, sequenceId: Int) {
                    super.onCaptureSequenceAborted(session, sequenceId)
                    this@CaptureCallbackImpl.onCaptureSequenceAborted(this, session, sequenceId.toLong()) {}
                }

                override fun onCaptureSequenceCompleted(
                    session: CameraCaptureSession, sequenceId: Int, frameNumber: Long
                ) {
                    super.onCaptureSequenceCompleted(session, sequenceId, frameNumber)
                    this@CaptureCallbackImpl.onCaptureSequenceCompleted(
                        this, session, sequenceId.toLong(), frameNumber
                    ) {}
                }

                override fun onCaptureStarted(
                    session: CameraCaptureSession, request: CaptureRequest, timestamp: Long, frameNumber: Long
                ) {
                    super.onCaptureStarted(session, request, timestamp, frameNumber)
                    this@CaptureCallbackImpl.onCaptureStarted(this, session, request, timestamp, frameNumber) {}
                }

                override fun onReadoutStarted(
                    session: CameraCaptureSession, request: CaptureRequest, timestamp: Long, frameNumber: Long
                ) {
                    super.onReadoutStarted(session, request, timestamp, frameNumber)
                    this@CaptureCallbackImpl.onReadoutStarted(this, session, request, timestamp, frameNumber) {}
                }
            }
        }
    }

    class StateCallbackImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCameraCaptureSessionStateCallbackProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): CameraCaptureSession.StateCallback {
            return object : CameraCaptureSession.StateCallback() {
                override fun onConfigureFailed(session: CameraCaptureSession) {
                    this@StateCallbackImpl.onConfigureFailed(this, session) {}
                }

                override fun onConfigured(session: CameraCaptureSession) {
                    this@StateCallbackImpl.onConfigured(this, session) {}
                }

                override fun onActive(session: CameraCaptureSession) {
                    super.onActive(session)
                    this@StateCallbackImpl.onActive(this, session) {}
                }

                override fun onCaptureQueueEmpty(session: CameraCaptureSession) {
                    super.onCaptureQueueEmpty(session)
                    this@StateCallbackImpl.onCaptureQueueEmpty(this, session) {}
                }

                override fun onClosed(session: CameraCaptureSession) {
                    super.onClosed(session)
                    this@StateCallbackImpl.onClosed(this, session) {}
                }

                override fun onReady(session: CameraCaptureSession) {
                    super.onReady(session)
                    this@StateCallbackImpl.onReady(this, session) {}
                }

                override fun onSurfacePrepared(session: CameraCaptureSession, surface: Surface) {
                    super.onSurfacePrepared(session, surface)
                    this@StateCallbackImpl.onSurfacePrepared(this, session, surface) {}
                }
            }
        }
    }
}