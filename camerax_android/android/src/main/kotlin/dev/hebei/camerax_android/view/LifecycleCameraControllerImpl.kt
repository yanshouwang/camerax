package dev.hebei.camerax_android.view

import androidx.lifecycle.LifecycleOwner
import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiLifecycleCameraControllerApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class LifecycleCameraControllerImpl(private val registrar: CameraXRegistrar) :
    PigeonApiLifecycleCameraControllerApi(registrar) {
    override fun pigeon_defaultConstructor(): androidx.camera.view.LifecycleCameraController {
        return androidx.camera.view.LifecycleCameraController(registrar.context)
    }

    override fun bindToLifecycle(
        pigeon_instance: androidx.camera.view.LifecycleCameraController, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val lifecycleOwner = registrar.activity as LifecycleOwner
                pigeon_instance.bindToLifecycle(lifecycleOwner)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun unbind(
        pigeon_instance: androidx.camera.view.LifecycleCameraController, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.unbind()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}