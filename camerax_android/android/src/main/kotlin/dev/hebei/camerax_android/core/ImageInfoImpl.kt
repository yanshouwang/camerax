package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiImageInfoApi

class ImageInfoImpl(registrar: CameraXRegistrar) : PigeonApiImageInfoApi(registrar) {
    override fun timestamp(pigeon_instance: androidx.camera.core.ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun rotationDegrees(pigeon_instance: androidx.camera.core.ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}