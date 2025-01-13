package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiSize

class Size(registrar: CameraXRegistrar) : PigeonApiSize(registrar) {
    override fun pigeon_defaultConstructor(width: Long, height: Long): android.util.Size {
        return android.util.Size(width.toInt(), height.toInt())
    }

    override fun width(pigeon_instance: android.util.Size): Long {
        return pigeon_instance.width.toLong()
    }

    override fun height(pigeon_instance: android.util.Size): Long {
        return pigeon_instance.height.toLong()
    }
}