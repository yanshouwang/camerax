package dev.zeekr.camerax_android.core

import androidx.camera.core.CameraFilter
import androidx.camera.core.CameraInfo
import com.google.android.gms.tasks.TaskCompletionSource
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiCameraFilterProxyApi

class CameraFilterImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiCameraFilterProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): CameraFilter {
        return object : CameraFilter {
            override fun filter(cameraInfos: List<CameraInfo>): List<CameraInfo> {
                // TODO: It is impossible to convert async api to sync api
                val tcs = TaskCompletionSource<List<CameraInfo>>()
                this@CameraFilterImpl.filter(this, cameraInfos) { res ->
                    try {
                        val result = res.getOrThrow()
                        tcs.setResult(result)
                    } catch (e: Exception) {
                        tcs.setException(e)
                    }
                }
                return tcs.task.result
            }
        }
    }
}