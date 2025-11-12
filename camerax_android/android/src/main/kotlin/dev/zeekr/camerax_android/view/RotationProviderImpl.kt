package dev.zeekr.camerax_android.view

import androidx.camera.view.RotationProvider
import androidx.core.content.ContextCompat
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiRotationProviderListenerProxyApi
import dev.zeekr.camerax_android.PigeonApiRotationProviderProxyApi
import dev.zeekr.camerax_android.common.surfaceRotationApi
import dev.zeekr.camerax_android.context

class RotationProviderImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiRotationProviderProxyApi(registrar) {
    class ListenerImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiRotationProviderListenerProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): RotationProvider.Listener {
            return object : RotationProvider.Listener {
                override fun onRotationChanged(rotation: Int) {
                    this@ListenerImpl.onRotationChanged(this, rotation.surfaceRotationApi) {}
                }
            }
        }
    }

    override fun pigeon_defaultConstructor(): RotationProvider {
        return RotationProvider(registrar.context)
    }

    override fun addListener(pigeon_instance: RotationProvider, listener: RotationProvider.Listener): Boolean {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        return pigeon_instance.addListener(executor, listener)
    }

    override fun removeListener(pigeon_instance: RotationProvider, listener: RotationProvider.Listener) {
        pigeon_instance.removeListener(listener)
    }
}