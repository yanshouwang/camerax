package dev.zeekr.camerax_android.view

import androidx.camera.view.LifecycleCameraController
import androidx.lifecycle.LifecycleOwner
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiLifecycleCameraControllerApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class LifecycleCameraControllerImpl(private val impl: CameraXImpl) : PigeonApiLifecycleCameraControllerApi(impl) {
    override fun pigeon_defaultConstructor(): LifecycleCameraController {
        return LifecycleCameraController(impl.context)
    }

    override fun bindToLifecycle(pigeon_instance: LifecycleCameraController, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val lifecycleOwner = impl.activity as LifecycleOwner
                pigeon_instance.bindToLifecycle(lifecycleOwner)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun unbind(pigeon_instance: LifecycleCameraController, callback: (Result<Unit>) -> Unit) {
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