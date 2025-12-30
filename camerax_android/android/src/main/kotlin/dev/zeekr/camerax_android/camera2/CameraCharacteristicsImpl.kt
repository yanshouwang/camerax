package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CameraCharacteristics
import android.util.Range
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraCharacteristicsKeyProxyApi
import dev.zeekr.camerax_android.PigeonApiCameraCharacteristicsProxyApi

class CameraCharacteristicsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraCharacteristicsProxyApi(registrar) {
    class KeyImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCameraCharacteristicsKeyProxyApi(registrar) {
        override fun getName(pigeon_instance: Key): String {
            return pigeon_instance.instance.name
        }
    }

    open class Key(open val instance: CameraCharacteristics.Key<*>)
    class StringKey(override val instance: CameraCharacteristics.Key<String>) : Key(instance)
    class IntKey(override val instance: CameraCharacteristics.Key<Int>) : Key(instance)
    class BooleanKey(override val instance: CameraCharacteristics.Key<Boolean>) : Key(instance)
    class IntArrayKey(override val instance: CameraCharacteristics.Key<IntArray>) : Key(instance)
    class FloatArrayKey(override val instance: CameraCharacteristics.Key<FloatArray>) : Key(instance)
    class IntRangeKey(override val instance: CameraCharacteristics.Key<Range<Int>>) : Key(instance)
    class LongRangeKey(override val instance: CameraCharacteristics.Key<Range<Long>>) : Key(instance)

    override fun controlAeAvailableModes(): IntArrayKey {
        return IntArrayKey(CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES)
    }

    override fun controlAeLockAvailable(): BooleanKey {
        return BooleanKey(CameraCharacteristics.CONTROL_AE_LOCK_AVAILABLE)
    }

    override fun controlAfAvailableModes(): IntArrayKey {
        return IntArrayKey(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES)
    }

    override fun controlAvailableModes(): IntArrayKey {
        return IntArrayKey(CameraCharacteristics.CONTROL_AVAILABLE_MODES)
    }

    override fun controlAwbAvailableModes(): IntArrayKey {
        return IntArrayKey(CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES)
    }

    override fun controlAwbLockAvailable(): BooleanKey {
        return BooleanKey(CameraCharacteristics.CONTROL_AWB_LOCK_AVAILABLE)
    }

    override fun infoSupportedHardwareLevel(): IntKey {
        return IntKey(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)
    }

    override fun infoVersion(): StringKey {
        return StringKey(CameraCharacteristics.INFO_VERSION)
    }

    override fun lensInfoAvailableApertures(): FloatArrayKey {
        return FloatArrayKey(CameraCharacteristics.LENS_INFO_AVAILABLE_APERTURES)
    }

    override fun sensorInfoExposureTimeRange(): LongRangeKey {
        return LongRangeKey(CameraCharacteristics.SENSOR_INFO_EXPOSURE_TIME_RANGE)
    }

    override fun sensorInfoSensitivityRange(): IntRangeKey {
        return IntRangeKey(CameraCharacteristics.SENSOR_INFO_SENSITIVITY_RANGE)
    }

    override fun sensorOrientation(): IntKey {
        return IntKey(CameraCharacteristics.SENSOR_ORIENTATION)
    }
}