package dev.zeekr.camerax_android.core

import androidx.camera.core.ImageInfo
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiImageInfoApi

class ImageInfoImpl(impl: CameraXImpl) : PigeonApiImageInfoApi(impl) {
    override fun timestamp(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun rotationDegrees(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}