package dev.hebei.camerax_android.camera2.interop

import android.hardware.camera2.CameraCharacteristics
import androidx.camera.camera2.interop.Camera2CameraInfo
import androidx.camera.core.CameraInfo
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiCamera2CameraInfoApi
import dev.hebei.camerax_android.common.LongRange

class Camera2CameraInfoImpl(registrar: CameraXRegistrar) : PigeonApiCamera2CameraInfoApi(registrar) {
    override fun from(cameraInfo: CameraInfo): Camera2CameraInfo {
        return Camera2CameraInfo.from(cameraInfo)
    }

    override fun getSensorInfoExposureTimeRange(pigeon_instance: Camera2CameraInfo): LongRange? {
        val obj = pigeon_instance.getCameraCharacteristic(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE)
        return if (obj == null) null
        else LongRange(obj)
    }

    override fun getCameraId(pigeon_instance: Camera2CameraInfo): String {
        return pigeon_instance.cameraId
    }
}