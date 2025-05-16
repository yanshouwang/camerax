package dev.hebei.camerax_android.core

import androidx.camera.core.ImageInfo
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiImageInfoApi

class ImageInfoImpl(impl: CameraXImpl) : PigeonApiImageInfoApi(impl) {
    override fun timestamp(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun rotationDegrees(pigeon_instance: ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}