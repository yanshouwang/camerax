package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CaptureRequest
import android.hardware.camera2.CaptureResult
import android.os.Build
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
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
    class CameraMetadataControlModeKey(override val instance: CaptureResult.Key<Int>) : Key(instance)
    class CameraMetadataControlAeModeKey(override val instance: CaptureResult.Key<Int>) : Key(instance)
    class CameraMetadataControlAfModeKey(override val instance: CaptureResult.Key<Int>) : Key(instance)
    class CameraMetadataControlAwbModeKey(override val instance: CaptureResult.Key<Int>) : Key(instance)

    override fun controlAeLock(): BooleanKey {
        return BooleanKey(CaptureResult.CONTROL_AE_LOCK)
    }

    override fun controlAeMode(): CameraMetadataControlAeModeKey {
        return CameraMetadataControlAeModeKey(CaptureResult.CONTROL_AE_MODE)
    }

    override fun controlAfMode(): CameraMetadataControlAfModeKey {
        return CameraMetadataControlAfModeKey(CaptureResult.CONTROL_AF_MODE)
    }

    override fun controlAwbLock(): BooleanKey {
        return BooleanKey(CaptureResult.CONTROL_AWB_LOCK)
    }

    override fun controlAwbMode(): CameraMetadataControlAwbModeKey {
        return CameraMetadataControlAwbModeKey(CaptureResult.CONTROL_AWB_MODE)
    }

    override fun controlMode(): CameraMetadataControlModeKey {
        return CameraMetadataControlModeKey(CaptureResult.CONTROL_MODE)
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

    override fun getInt(pigeon_instance: CaptureResult, key: IntKey): Long? {
        return pigeon_instance.get(key.instance)?.toLong()
    }

    override fun getLong(pigeon_instance: CaptureResult, key: LongKey): Long? {
        return pigeon_instance.get(key.instance)
    }

    override fun getFloat(pigeon_instance: CaptureResult, key: FloatKey): Double? {
        return pigeon_instance.get(key.instance)?.toDouble()
    }

    override fun getBoolean(pigeon_instance: CaptureResult, key: BooleanKey): Boolean? {
        return pigeon_instance.get(key.instance)
    }

    override fun getCameraMetadataControlMode(
        pigeon_instance: CaptureResult, key: CameraMetadataControlModeKey
    ): CameraMetadataControlModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlModeApi
    }

    override fun getCameraMetadataControlAeMode(
        pigeon_instance: CaptureResult, key: CameraMetadataControlAeModeKey
    ): CameraMetadataControlAeModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAeModeApi
    }

    override fun getCameraMetadataControlAfMode(
        pigeon_instance: CaptureResult, key: CameraMetadataControlAfModeKey
    ): CameraMetadataControlAfModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAfModeApi
    }

    override fun getCameraMetadataControlAwbMode(
        pigeon_instance: CaptureResult, key: CameraMetadataControlAwbModeKey
    ): CameraMetadataControlAwbModeApi? {
        return pigeon_instance.get(key.instance)?.cameraMetadataControlAwbModeApi
    }

    override fun getCameraId(pigeon_instance: CaptureResult): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            return pigeon_instance.cameraId
        } else {
            throw UnsupportedOperationException("Call requires API level 31")
        }
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