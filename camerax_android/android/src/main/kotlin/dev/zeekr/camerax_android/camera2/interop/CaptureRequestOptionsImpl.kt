package dev.zeekr.camerax_android.camera2.interop

import androidx.annotation.OptIn
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCaptureRequestOptionsBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiCaptureRequestOptionsProxyApi
import dev.zeekr.camerax_android.camera2.CaptureRequestImpl
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.camera2.cameraMetadataControlModeApi
import dev.zeekr.camerax_android.camera2.impl

@OptIn(ExperimentalCamera2Interop::class)
class CaptureRequestOptionsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCaptureRequestOptionsProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCaptureRequestOptionsBuilderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): CaptureRequestOptions.Builder {
            return CaptureRequestOptions.Builder()
        }

        override fun clearIntCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.IntKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearLongCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.LongKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearFloatCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.FloatKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearBooleanCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.BooleanKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearCameraMetadataControlModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.CameraMetadataControlModeKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearCameraMetadataControlAeModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.CameraMetadataControlAeModeKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearCameraMetadataControlAfModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.CameraMetadataControlAfModeKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun clearCameraMetadataControlAwbModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.CameraMetadataControlAwbModeKey
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.clearCaptureRequestOption(key.instance)
        }

        override fun setIntCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.IntKey, value: Long
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.toInt())
        }

        override fun setLongCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.LongKey, value: Long
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value)
        }

        override fun setFloatCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.FloatKey, value: Double
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.toFloat())
        }

        override fun setBooleanCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder, key: CaptureRequestImpl.BooleanKey, value: Boolean
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value)
        }

        override fun setCameraMetadataControlModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder,
            key: CaptureRequestImpl.CameraMetadataControlModeKey,
            value: CameraMetadataControlModeApi
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.impl)
        }

        override fun setCameraMetadataControlAeModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder,
            key: CaptureRequestImpl.CameraMetadataControlAeModeKey,
            value: CameraMetadataControlAeModeApi
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.impl)
        }

        override fun setCameraMetadataControlAfModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder,
            key: CaptureRequestImpl.CameraMetadataControlAfModeKey,
            value: CameraMetadataControlAfModeApi
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.impl)
        }

        override fun setCameraMetadataControlAwbModeCaptureRequestOption(
            pigeon_instance: CaptureRequestOptions.Builder,
            key: CaptureRequestImpl.CameraMetadataControlAwbModeKey,
            value: CameraMetadataControlAwbModeApi
        ): CaptureRequestOptions.Builder {
            return pigeon_instance.setCaptureRequestOption(key.instance, value.impl)
        }

        override fun build(pigeon_instance: CaptureRequestOptions.Builder): CaptureRequestOptions {
            return pigeon_instance.build()
        }
    }

    override fun getIntCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.IntKey
    ): Long? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.toLong()
    }

    override fun getLongCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.LongKey
    ): Long? {
        return pigeon_instance.getCaptureRequestOption(key.instance)
    }

    override fun getFloatCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.FloatKey
    ): Double? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.toDouble()
    }

    override fun getBooleanCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.BooleanKey
    ): Boolean? {
        return pigeon_instance.getCaptureRequestOption(key.instance)
    }

    override fun getCameraMetadataControlModeCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.CameraMetadataControlModeKey
    ): CameraMetadataControlModeApi? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.cameraMetadataControlModeApi
    }

    override fun getCameraMetadataControlAeModeCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.CameraMetadataControlAeModeKey
    ): CameraMetadataControlAeModeApi? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.cameraMetadataControlAeModeApi
    }

    override fun getCameraMetadataControlAfModeCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.CameraMetadataControlAfModeKey
    ): CameraMetadataControlAfModeApi? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.cameraMetadataControlAfModeApi
    }

    override fun getCameraMetadataControlAwbModeCaptureRequestOption(
        pigeon_instance: CaptureRequestOptions, key: CaptureRequestImpl.CameraMetadataControlAwbModeKey
    ): CameraMetadataControlAwbModeApi? {
        return pigeon_instance.getCaptureRequestOption(key.instance)?.cameraMetadataControlAwbModeApi

    }
}