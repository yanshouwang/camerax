package dev.zeekr.camerax_android.camera2.interop

import android.hardware.camera2.CameraCaptureSession
import android.os.Build
import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2Interop
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2InteropExtenderProxyApi
import dev.zeekr.camerax_android.camera2.CaptureRequestImpl

@OptIn(ExperimentalCamera2Interop::class)
class Camera2InteropImpl {
    class ExtenderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCamera2InteropExtenderProxyApi(registrar) {
        override fun fromCaptureRequestOptionsBuilder(builder: CaptureRequestOptions.Builder): Extender {
            val instance = Camera2Interop.Extender(builder)
            return Extender(instance)
        }

        override fun setIntCaptureRequestOption(
            pigeon_instance: Extender, key: CaptureRequestImpl.IntKey, value: Long
        ): Extender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value.toInt())
            return Extender(instance)
        }

        override fun setLongCaptureRequestOption(
            pigeon_instance: Extender, key: CaptureRequestImpl.LongKey, value: Long
        ): Extender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value)
            return Extender(instance)
        }

        override fun setFloatCaptureRequestOption(
            pigeon_instance: Extender, key: CaptureRequestImpl.FloatKey, value: Double
        ): Extender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value.toFloat())
            return Extender(instance)
        }

        override fun setBooleanCaptureRequestOption(
            pigeon_instance: Extender, key: CaptureRequestImpl.BooleanKey, value: Boolean
        ): Extender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value)
            return Extender(instance)
        }

        override fun setPhysicalCameraId(
            pigeon_instance: Extender, cameraId: String
        ): Extender {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                val instance = pigeon_instance.instance.setPhysicalCameraId(cameraId)
                return Extender(instance)
            } else {
                throw UnsupportedOperationException("Call requires API level 28")
            }
        }

        override fun setSessionCaptureCallback(
            pigeon_instance: Extender, captureCallback: CameraCaptureSession.CaptureCallback
        ): Extender {
            val instance = pigeon_instance.instance.setSessionCaptureCallback(captureCallback)
            return Extender(instance)
        }

        override fun setSessionStateCallback(
            pigeon_instance: Extender, stateCallback: CameraCaptureSession.StateCallback
        ): Extender {
            val instance = pigeon_instance.instance.setSessionStateCallback(stateCallback)
            return Extender(instance)
        }
    }

    class Extender(val instance: Camera2Interop.Extender<*>)
}