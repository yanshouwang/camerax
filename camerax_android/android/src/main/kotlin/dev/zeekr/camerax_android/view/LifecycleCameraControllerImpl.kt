package dev.zeekr.camerax_android.view

import androidx.camera.view.LifecycleCameraController
import androidx.lifecycle.LifecycleOwner
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiLifecycleCameraControllerProxyApi
import dev.zeekr.camerax_android.activity
import dev.zeekr.camerax_android.context

class LifecycleCameraControllerImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiLifecycleCameraControllerProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): LifecycleCameraController {
        return LifecycleCameraController(registrar.context)
    }

    override fun bindToLifecycle(pigeon_instance: LifecycleCameraController) {
        val lifecycleOwner = registrar.activity as LifecycleOwner
        pigeon_instance.bindToLifecycle(lifecycleOwner)
    }

    override fun unbind(pigeon_instance: LifecycleCameraController) {
        pigeon_instance.unbind()
    }
}