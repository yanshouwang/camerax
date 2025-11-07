package dev.zeekr.camerax_android.camera2.interop

import android.hardware.camera2.CaptureRequest
import androidx.annotation.OptIn
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCaptureRequestOptionsProxyApi
import dev.zeekr.camerax_android.camera2.impl

@OptIn(ExperimentalCamera2Interop::class)
class CaptureRequestOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCaptureRequestOptionsProxyApi(registrar) {
    override fun build(
        mode: CameraMetadataControlModeApi?,
        aeMode: CameraMetadataControlAeModeApi?,
        afMode: CameraMetadataControlAfModeApi?,
        awbMode: CameraMetadataControlAwbModeApi?,
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