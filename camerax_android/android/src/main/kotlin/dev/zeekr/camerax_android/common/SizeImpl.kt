package dev.zeekr.camerax_android.common

import android.util.Size
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiSizeApi

class SizeImpl(impl: CameraXImpl) : PigeonApiSizeApi(impl) {
    override fun pigeon_defaultConstructor(width: Long, height: Long): Size {
        return Size(width.toInt(), height.toInt())
    }

    override fun width(pigeon_instance: Size): Long {
        return pigeon_instance.width.toLong()
    }

    override fun height(pigeon_instance: Size): Long {
        return pigeon_instance.height.toLong()
    }
}