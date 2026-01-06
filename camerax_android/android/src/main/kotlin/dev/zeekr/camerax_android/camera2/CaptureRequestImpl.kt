package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureRequest
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCaptureRequestKeyProxyApi
import dev.zeekr.camerax_android.PigeonApiCaptureRequestProxyApi

class CaptureRequestImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCaptureRequestProxyApi(registrar) {
    class KeyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCaptureRequestKeyProxyApi(registrar) {
        override fun getName(pigeon_instance: Key): String {
            return pigeon_instance.instance.name
        }
    }

    open class Key(open val instance: CaptureRequest.Key<*>)
    class IntKey(override val instance: CaptureRequest.Key<Int>) : Key(instance)
    class LongKey(override val instance: CaptureRequest.Key<Long>) : Key(instance)
    class FloatKey(override val instance: CaptureRequest.Key<Float>) : Key(instance)
    class BooleanKey(override val instance: CaptureRequest.Key<Boolean>) : Key(instance)
    class CameraMetadataControlModeKey(override val instance: CaptureRequest.Key<Int>) : Key(instance)
    class CameraMetadataControlAeModeKey(override val instance: CaptureRequest.Key<Int>) : Key(instance)
    class CameraMetadataControlAfModeKey(override val instance: CaptureRequest.Key<Int>) : Key(instance)
    class CameraMetadataControlAwbModeKey(override val instance: CaptureRequest.Key<Int>) : Key(instance)

    override fun controlAeLock(): BooleanKey {
        return BooleanKey(CaptureRequest.CONTROL_AE_LOCK)
    }

    override fun controlAeMode(): CameraMetadataControlAeModeKey {
        return CameraMetadataControlAeModeKey(CaptureRequest.CONTROL_AE_MODE)
    }

    override fun controlAfMode(): CameraMetadataControlAfModeKey {
        return CameraMetadataControlAfModeKey(CaptureRequest.CONTROL_AF_MODE)
    }

    override fun controlAwbLock(): BooleanKey {
        return BooleanKey(CaptureRequest.CONTROL_AWB_LOCK)
    }

    override fun controlAwbMode(): CameraMetadataControlAwbModeKey {
        return CameraMetadataControlAwbModeKey(CaptureRequest.CONTROL_AWB_MODE)
    }

    override fun controlMode(): CameraMetadataControlModeKey {
        return CameraMetadataControlModeKey(CaptureRequest.CONTROL_MODE)
    }

    override fun lensAperture(): FloatKey {
        return FloatKey(CaptureRequest.LENS_APERTURE)
    }

    override fun sensorExposureTime(): LongKey {
        return LongKey(CaptureRequest.SENSOR_EXPOSURE_TIME)
    }

    override fun sensorSensitivity(): IntKey {
        return IntKey(CaptureRequest.SENSOR_SENSITIVITY)
    }

    override fun getInt(pigeon_instance: CaptureRequest, key: IntKey): Long? {
        return pigeon_instance.get(key.instance)?.toLong()
    }

    override fun getLong(pigeon_instance: CaptureRequest, key: LongKey): Long? {
        return pigeon_instance.get(key.instance)
    }

    override fun getFloat(pigeon_instance: CaptureRequest, key: FloatKey): Double? {
        return pigeon_instance.get(key.instance)?.toDouble()
    }

    override fun getBoolean(pigeon_instance: CaptureRequest, key: BooleanKey): Boolean? {
        return pigeon_instance.get(key.instance)
    }

    override fun getCameraMetadataControlMode(
        pigeon_instance: CaptureRequest, key: CameraMetadataControlModeKey
    ): CameraMetadataControlModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlModeApi
    }

    override fun getCameraMetadataControlAeMode(
        pigeon_instance: CaptureRequest, key: CameraMetadataControlAeModeKey
    ): CameraMetadataControlAeModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAeModeApi
    }

    override fun getCameraMetadataControlAfMode(
        pigeon_instance: CaptureRequest, key: CameraMetadataControlAfModeKey
    ): CameraMetadataControlAfModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAfModeApi
    }

    override fun getCameraMetadataControlAwbMode(
        pigeon_instance: CaptureRequest, key: CameraMetadataControlAwbModeKey
    ): CameraMetadataControlAwbModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAwbModeApi
    }

    override fun isReprocess(pigeon_instance: CaptureRequest): Boolean {
        return pigeon_instance.isReprocess
    }
}