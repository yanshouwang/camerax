package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiSize

class Size(registrar: CameraXRegistrar) : PigeonApiSize(registrar) {
    override fun pigeon_defaultConstructor(width: Long, height: Long): android.util.Size {
        return android.util.Size(width.toInt(), height.toInt())
    }

    override fun getWidth(pigeon_instance: android.util.Size): Long {
        return pigeon_instance.width.toLong()
    }

    override fun getHeight(pigeon_instance: android.util.Size): Long {
        return pigeon_instance.height.toLong()
    }
}