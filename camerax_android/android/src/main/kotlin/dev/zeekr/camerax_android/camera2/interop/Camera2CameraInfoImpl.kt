package dev.zeekr.camerax_android.camera2.interop

import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2CameraInfo
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import androidx.camera.core.CameraInfo
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
import dev.zeekr.camerax_android.CameraMetadataInfoSupportedHardwareLevelApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2CameraInfoProxyApi
import dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataInfoSupportedHardwareLevelApi
import dev.zeekr.camerax_android.common.IntRange
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

    override fun getCameraMetadataControlModeArray(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.CameraMetadataControlModeArrayKey
    ): List<CameraMetadataControlModeApi>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.cameraMetadataControlModeApi }
    }

    override fun getCameraMetadataControlAeModeArray(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.CameraMetadataControlAeModeArrayKey
    ): List<CameraMetadataControlAeModeApi>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.cameraMetadataControlAeModeApi }
    }

    override fun getCameraMetadataControlAfModeArray(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.CameraMetadataControlAfModeArrayKey
    ): List<CameraMetadataControlAfModeApi>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.cameraMetadataControlAfModeApi }
    }

    override fun getCameraMetadataControlAwbModeArray(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.CameraMetadataControlAwbModeArrayKey
    ): List<CameraMetadataControlAwbModeApi>? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.map { it.cameraMetadataControlAwbModeApi }
    }

    override fun getCameraMetadataInfoSupportedHardwareLevel(
        pigeon_instance: Camera2CameraInfo, key: CameraCharacteristicsImpl.CameraMetadataInfoSupportedHardwareLevelKey
    ): CameraMetadataInfoSupportedHardwareLevelApi? {
        return pigeon_instance.getCameraCharacteristic(key.instance)?.cameraMetadataInfoSupportedHardwareLevelApi
    }
}