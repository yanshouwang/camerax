package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureResult
import android.hardware.camera2.TotalCaptureResult
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiTotalCaptureResultProxyApi

class TotalCaptureResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiTotalCaptureResultProxyApi(registrar) {
    override fun getPartialResults(pigeon_instance: TotalCaptureResult): List<CaptureResult> {
        return pigeon_instance.partialResults
    }

    override fun getPhysicalCameraResults(pigeon_instance: TotalCaptureResult): Map<String, CaptureResult> {
        return pigeon_instance.physicalCameraResults
    }

    override fun getPhysicalCameraTotalResults(pigeon_instance: TotalCaptureResult): Map<String, TotalCaptureResult> {
        return pigeon_instance.physicalCameraTotalResults
    }
}