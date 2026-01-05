package dev.zeekr.camerax_android.camera2.interop

import android.hardware.camera2.CameraCaptureSession
import android.os.Build
import androidx.annotation.OptIn
import androidx.camera.camera2.interop.Camera2Interop
import androidx.camera.camera2.interop.CaptureRequestOptions
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCamera2InteropCaptureRequestOptionsExtenderProxyApi
import dev.zeekr.camerax_android.camera2.CaptureRequestImpl

@OptIn(ExperimentalCamera2Interop::class)
class Camera2InteropImpl {
    class CaptureRequestOptionsExtenderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiCamera2InteropCaptureRequestOptionsExtenderProxyApi(registrar) {
        override fun pigeon_defaultConstructor(baseBuilder: CaptureRequestOptions.Builder): CaptureRequestOptionsExtender {
            val instance = Camera2Interop.Extender(baseBuilder)
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setIntCaptureRequestOption(
            pigeon_instance: CaptureRequestOptionsExtender, key: CaptureRequestImpl.IntKey, value: Long
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value.toInt())
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setLongCaptureRequestOption(
            pigeon_instance: CaptureRequestOptionsExtender, key: CaptureRequestImpl.LongKey, value: Long
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value)
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setFloatCaptureRequestOption(
            pigeon_instance: CaptureRequestOptionsExtender, key: CaptureRequestImpl.FloatKey, value: Double
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value.toFloat())
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setBooleanCaptureRequestOption(
            pigeon_instance: CaptureRequestOptionsExtender, key: CaptureRequestImpl.BooleanKey, value: Boolean
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setCaptureRequestOption(key.instance, value)
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setPhysicalCameraId(
            pigeon_instance: CaptureRequestOptionsExtender, cameraId: String
        ): CaptureRequestOptionsExtender {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                val instance = pigeon_instance.instance.setPhysicalCameraId(cameraId)
                return CaptureRequestOptionsExtender(instance)
            } else {
                throw UnsupportedOperationException("Call requires API level 28")
            }
        }

        override fun setSessionCaptureCallback(
            pigeon_instance: CaptureRequestOptionsExtender, captureCallback: CameraCaptureSession.CaptureCallback
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setSessionCaptureCallback(captureCallback)
            return CaptureRequestOptionsExtender(instance)
        }

        override fun setSessionStateCallback(
            pigeon_instance: CaptureRequestOptionsExtender, stateCallback: CameraCaptureSession.StateCallback
        ): CaptureRequestOptionsExtender {
            val instance = pigeon_instance.instance.setSessionStateCallback(stateCallback)
            return CaptureRequestOptionsExtender(instance)
        }
    }

    class CaptureRequestOptionsExtender(val instance: Camera2Interop.Extender<CaptureRequestOptions>)
}