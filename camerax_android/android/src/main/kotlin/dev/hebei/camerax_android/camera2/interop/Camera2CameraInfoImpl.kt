package dev.hebei.camerax_android.camera2.interop

import android.hardware.camera2.CameraCharacteristics
import androidx.camera.camera2.interop.Camera2CameraInfo
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import androidx.camera.core.CameraInfo
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiCamera2CameraInfoApi
import dev.hebei.camerax_android.common.LongRange

@ExperimentalCamera2Interop
class Camera2CameraInfoImpl(impl: CameraXImpl) : PigeonApiCamera2CameraInfoApi(impl) {
    override fun from(cameraInfo: CameraInfo): Camera2CameraInfo {
        return Camera2CameraInfo.from(cameraInfo)
    }

    override fun getSensorInfoExposureTimeRange(pigeon_instance: Camera2CameraInfo): LongRange? {
        val instance = pigeon_instance.getCameraCharacteristic(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE)
        return if (instance == null) null
        else LongRange(instance)
    }

    override fun getCameraId(pigeon_instance: Camera2CameraInfo): String {
        return pigeon_instance.cameraId
    }
}