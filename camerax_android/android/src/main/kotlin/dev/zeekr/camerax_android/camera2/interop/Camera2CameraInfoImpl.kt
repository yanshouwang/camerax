package dev.zeekr.camerax_android.camera2.interop

import android.hardware.camera2.CameraCharacteristics
import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2CameraInfo
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import androidx.camera.core.CameraInfo
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2CameraInfoProxyApi
import dev.zeekr.camerax_android.common.LongRange

@OptIn(ExperimentalCamera2Interop::class)
class Camera2CameraInfoImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCamera2CameraInfoProxyApi(registrar) {
    override fun from(cameraInfo: CameraInfo): Camera2CameraInfo {
        return Camera2CameraInfo.from(cameraInfo)
    }

    override fun getCameraId(pigeon_instance: Camera2CameraInfo): String {
        return pigeon_instance.cameraId
    }

    override fun getSensorInfoExposureTimeRange(pigeon_instance: Camera2CameraInfo): LongRange? {
        val instance = pigeon_instance.getCameraCharacteristic(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE)
        return if (instance == null) null
        else LongRange(instance)
    }
}