package dev.zeekr.camerax_android.core.resolutionselector

import android.util.Size
import androidx.camera.core.resolutionselector.ResolutionFilter
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiResolutionFilterProxyApi

class ResolutionFilterImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiResolutionFilterProxyApi(registrar) {
    override fun pigeon_defaultConstructor(): ResolutionFilter {
        return object : ResolutionFilter {
            override fun filter(supportedSizes: MutableList<Size>, rotationDegrees: Int): MutableList<Size> {
                // TODO: It is impossible to convert async api to sync api
                val tcs = com.google.android.gms.tasks.TaskCompletionSource<List<Size>>()
                this@ResolutionFilterImpl.filter(this, supportedSizes, rotationDegrees.toLong()) { res ->
                    try {
                        val sizes = res.getOrThrow()
                        tcs.setResult(sizes)
                    } catch (e: Exception) {
                        tcs.setException(e)
                    }
                }
                return tcs.task.result.toMutableList()
            }
        }
    }
}