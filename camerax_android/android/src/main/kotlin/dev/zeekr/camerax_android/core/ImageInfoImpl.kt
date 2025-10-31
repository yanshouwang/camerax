package dev.zeekr.camerax_android.core

import androidx.camera.core.ImageInfo
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiImageInfoApi

class ImageInfoImpl(impl: CameraXRegistrarImpl) : PigeonApiImageInfoApi(impl) {
    override fun timestamp(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun rotationDegrees(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}