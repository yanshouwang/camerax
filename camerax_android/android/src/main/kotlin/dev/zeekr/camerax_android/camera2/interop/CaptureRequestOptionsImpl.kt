package dev.zeekr.camerax_android.camera2.interop

import android.hardware.camera2.CaptureRequest
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.ControlAeModeApi
import dev.zeekr.camerax_android.ControlAfModeApi
import dev.zeekr.camerax_android.ControlAwbModeApi
import dev.zeekr.camerax_android.ControlModeApi
import dev.zeekr.camerax_android.PigeonApiCaptureRequestOptionsApi
import dev.zeekr.camerax_android.camera2.impl

@ExperimentalCamera2Interop
class CaptureRequestOptionsImpl(impl: CameraXRegistrarImpl) : PigeonApiCaptureRequestOptionsApi(impl) {
    override fun build(
        mode: ControlModeApi?,
        aeMode: ControlAeModeApi?,
        afMode: ControlAfModeApi?,
        awbMode: ControlAwbModeApi?,
        sensorExposureTime: Long?
    ): CaptureRequestOptions {
        val builder = CaptureRequestOptions.Builder()
        if (mode != null) {
            builder.setCaptureRequestOption(CaptureRequest.CONTROL_MODE, mode.impl)
        }
        if (aeMode != null) {
            builder.setCaptureRequestOption(CaptureRequest.CONTROL_AE_MODE, aeMode.impl)
        }
        if (afMode != null) {
            builder.setCaptureRequestOption(CaptureRequest.CONTROL_AF_MODE, afMode.impl)
        }
        if (awbMode != null) {
            builder.setCaptureRequestOption(CaptureRequest.CONTROL_AWB_MODE, awbMode.impl)
        }
        if (sensorExposureTime != null) {
            builder.setCaptureRequestOption(CaptureRequest.SENSOR_EXPOSURE_TIME, sensorExposureTime)
        }
        return builder.build()
    }
}