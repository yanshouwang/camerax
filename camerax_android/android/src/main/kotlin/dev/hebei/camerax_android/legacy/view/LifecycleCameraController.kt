package dev.hebei.camerax_android.legacy.view

import androidx.lifecycle.LifecycleOwner
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiLifecycleCameraController
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class LifecycleCameraController(private val registrar: CameraXRegistrar) :
    PigeonApiLifecycleCameraController(registrar) {
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