package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiSizeApi

class SizeImpl(impl: CameraXImpl) : PigeonApiSizeApi(impl) {
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