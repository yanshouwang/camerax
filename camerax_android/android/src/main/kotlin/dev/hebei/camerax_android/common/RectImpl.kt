package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiRectApi

class RectImpl(impl: CameraXImpl) : PigeonApiRectApi(impl) {
    override fun pigeon_defaultConstructor(left: Long, top: Long, right: Long, bottom: Long): android.graphics.Rect {
        return android.graphics.Rect(left.toInt(), top.toInt(), right.toInt(), bottom.toInt())
    }

    override fun left(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.left.toLong()
    }

    override fun top(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.top.toLong()
    }

    override fun right(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.right.toLong()
    }

    override fun bottom(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.bottom.toLong()
    }
}