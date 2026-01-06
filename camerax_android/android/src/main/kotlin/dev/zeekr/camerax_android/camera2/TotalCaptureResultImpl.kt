package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureResult
import android.hardware.camera2.TotalCaptureResult
import android.os.Build
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiTotalCaptureResultProxyApi

class TotalCaptureResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTotalCaptureResultProxyApi(registrar) {
    override fun getPartialResults(pigeon_instance: TotalCaptureResult): List<CaptureResult> {
        return pigeon_instance.partialResults
    }

    override fun getPhysicalCameraResults(pigeon_instance: TotalCaptureResult): Map<String, CaptureResult> {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            return pigeon_instance.physicalCameraResults
        } else {
            throw UnsupportedOperationException("Call requires API level 28")
        }
    }

    override fun getPhysicalCameraTotalResults(pigeon_instance: TotalCaptureResult): Map<String, TotalCaptureResult> {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return pigeon_instance.physicalCameraTotalResults
        } else {
            throw UnsupportedOperationException("Call requires API level 31")
        }
    }
}