package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureFailure
import android.hardware.camera2.CaptureRequest
import android.os.Build
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.CaptureFailureReasonApi
import dev.zeekr.camerax_android.PigeonApiCaptureFailureProxyApi

class CaptureFailureImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCaptureFailureProxyApi(registrar) {
    override fun getFrameNumber(pigeon_instance: CaptureFailure): Long {
        return pigeon_instance.frameNumber
    }

    override fun getPhysicalCameraId(pigeon_instance: CaptureFailure): String? {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return pigeon_instance.physicalCameraId
        } else {
            throw UnsupportedOperationException("Call requires API level 29")
        }
    }

    override fun getReason(pigeon_instance: CaptureFailure): CaptureFailureReasonApi {
        return pigeon_instance.reason.captureFailureReasonApi
    }

    override fun getRequest(pigeon_instance: CaptureFailure): CaptureRequest {
        return pigeon_instance.request
    }

    override fun getSequenceId(pigeon_instance: CaptureFailure): Long {
        return pigeon_instance.sequenceId.toLong()
    }

    override fun wasImageCaptured(pigeon_instance: CaptureFailure): Boolean {
        return pigeon_instance.wasImageCaptured()
    }
}

val Int.captureFailureReasonApi: CaptureFailureReasonApi
    get() = when (this) {
        CaptureFailure.REASON_ERROR -> CaptureFailureReasonApi.ERROR
        CaptureFailure.REASON_FLUSHED -> CaptureFailureReasonApi.FLUSHED
        else -> throw IllegalArgumentException()
    }
