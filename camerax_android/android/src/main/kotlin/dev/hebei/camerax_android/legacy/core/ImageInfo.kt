package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiImageInfo

class ImageInfo(registrar: CameraXRegistrar) : PigeonApiImageInfo(registrar) {
    override fun timestamp(pigeon_instance: androidx.camera.core.ImageInfo): Long {
        return pigeon_instance.timestamp
    }

    override fun rotationDegrees(pigeon_instance: androidx.camera.core.ImageInfo): Long {
        return pigeon_instance.rotationDegrees.toLong()
    }
}