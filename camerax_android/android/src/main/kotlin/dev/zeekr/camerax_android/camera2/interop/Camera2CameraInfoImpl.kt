package dev.zeekr.camerax_android.camera2.interop

import androidx.camera.camera2.interop.Camera2CameraInfo
import androidx.camera.core.CameraInfo
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2CameraInfoProxyApi
import dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl
import dev.zeekr.camerax_android.common.IntRange
import dev.zeekr.camerax_android.common.LongRange

class Camera2CameraInfoImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCamera2CameraInfoProxyApi(registrar) {
    override fun from(cameraInfo: CameraInfo): Camera2CameraInfo {
        return Camera2CameraInfo.from(cameraInfo)
    }

    override fun getCameraId(pigeon_instance: Camera2CameraInfo): String {
        return pigeon_instance.cameraId
    }

    override fun getStringCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.StringKey
    ): String? {
        return pigeon_instance.getCameraCharacteristic(key.instance)
    }

    override fun getIntCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.IntKey
    ): Long? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.toLong()
    }

    override fun getBooleanCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.BooleanKey
    ): Boolean? {
        return pigeon_instance.getCameraCharacteristic(key.instance)
    }

    override fun getIntArrayCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.IntArrayKey
    ): List<Long>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.toLong() }
    }

    override fun getFloatArrayCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.FloatArrayKey
    ): List<Double>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.toDouble() }
    }

    override fun getIntRangeCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.IntRangeKey
    ): IntRange? {
        val value = pigeon_instance.getCameraCharacteristic(key.instance)
        return if (value == null) null
        else IntRange(value)
    }

    override fun getLongRangeCameraCharacteristic(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.LongRangeKey
    ): LongRange? {
        val value = pigeon_instance.getCameraCharacteristic(key.instance)
        return if (value == null) null
        else LongRange(value)
    }
}