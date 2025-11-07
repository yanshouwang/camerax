package dev.zeekr.camerax_android.core

import androidx.camera.core.ImageInfo
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FlashStateApi
import dev.zeekr.camerax_android.PigeonApiImageInfoProxyApi

class ImageInfoImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiImageInfoProxyApi(registrar) {
    override fun timestamp(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun flashState(pigeon_instance: ImageInfo): FlashStateApi {
        return pigeon_instance.flashState.flashStateApi
    }

    override fun rotationDegrees(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}