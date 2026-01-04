package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureRequest
import android.hardware.camera2.CaptureResult
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCaptureResultKeyProxyApi
import dev.zeekr.camerax_android.PigeonApiCaptureResultProxyApi

class CaptureResultImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCaptureResultProxyApi(registrar) {
    class KeyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCaptureResultKeyProxyApi(registrar) {
        override fun getName(pigeon_instance: Key): String {
            return pigeon_instance.instance.name
        }
    }

    open class Key(open val instance: CaptureResult.Key<*>)
    class IntKey(override val instance: CaptureResult.Key<Int>) : Key(instance)
    class LongKey(override val instance: CaptureResult.Key<Long>) : Key(instance)
    class FloatKey(override val instance: CaptureResult.Key<Float>) : Key(instance)
    class BooleanKey(override val instance: CaptureResult.Key<Boolean>) : Key(instance)

    override fun controlAeLock(): BooleanKey {
        return BooleanKey(CaptureResult.CONTROL_AE_LOCK)
    }

    override fun controlAeMode(): IntKey {
        return IntKey(CaptureResult.CONTROL_AE_MODE)
    }

    override fun controlAfMode(): IntKey {
        return IntKey(CaptureResult.CONTROL_AF_MODE)
    }

    override fun controlAwbLock(): BooleanKey {
        return BooleanKey(CaptureResult.CONTROL_AWB_LOCK)
    }

    override fun controlAwbMode(): IntKey {
        return IntKey(CaptureResult.CONTROL_AWB_MODE)
    }

    override fun controlMode(): IntKey {
        return IntKey(CaptureResult.CONTROL_MODE)
    }

    override fun lensAperture(): FloatKey {
        return FloatKey(CaptureResult.LENS_APERTURE)
    }

    override fun sensorExposureTime(): LongKey {
        return LongKey(CaptureResult.SENSOR_EXPOSURE_TIME)
    }

    override fun sensorSensitivity(): IntKey {
        return IntKey(CaptureResult.SENSOR_SENSITIVITY)
    }

    override fun getInt(
        pigeon_instance: CaptureResult,
        key: IntKey
    ): Long? {
        return pigeon_instance.get(key.instance)?.toLong()
    }

    override fun getLong(
        pigeon_instance: CaptureResult,
        key: LongKey
    ): Long? {
        return pigeon_instance.get(key.instance)
    }

    override fun getFloat(
        pigeon_instance: CaptureResult,
        key: FloatKey
    ): Double? {
        return pigeon_instance.get(key.instance)?.toDouble()
    }

    override fun getBoolean(
        pigeon_instance: CaptureResult,
        key: BooleanKey
    ): Boolean? {
        return pigeon_instance.get(key.instance)
    }

    override fun getCameraId(pigeon_instance: CaptureResult): String {
        return pigeon_instance.cameraId
    }

    override fun getFrameNumber(pigeon_instance: CaptureResult): Long {
        return pigeon_instance.frameNumber
    }

    override fun getRequest(pigeon_instance: CaptureResult): CaptureRequest {
        return pigeon_instance.request
    }

    override fun getSequenceId(pigeon_instance: CaptureResult): Long {
        return pigeon_instance.sequenceId.toLong()
    }
}