package dev.hebei.camerax_android.view

import android.content.Context
import androidx.lifecycle.LifecycleOwner
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class LifecycleCameraController : CameraController {
    constructor(context: Context) {
        this.obj = androidx.camera.view.LifecycleCameraController(context)
    }

    internal constructor(obj: androidx.camera.view.LifecycleCameraController) {
        this.obj = obj
    }

    override val obj: androidx.camera.view.LifecycleCameraController

    suspend fun bindToLifecycle(lifecycleOwner: LifecycleOwner) {
        withContext(Dispatchers.Main) {
            obj.bindToLifecycle(lifecycleOwner)
        }
    }

    suspend fun unbind() {
        withContext(Dispatchers.Main) {
            obj.unbind()
        }
    }
}