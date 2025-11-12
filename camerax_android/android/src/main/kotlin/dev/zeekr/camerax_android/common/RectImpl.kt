package dev.zeekr.camerax_android.common

import android.graphics.Rect
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiRectProxyApi

class RectImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiRectProxyApi(registrar) {
    override fun pigeon_defaultConstructor(left: Long, top: Long, right: Long, bottom: Long): Rect {
        return Rect(left.toInt(), top.toInt(), right.toInt(), bottom.toInt())
    }

    override fun left(pigeon_instance: Rect): Long {
        return pigeon_instance.left.toLong()
    }

    override fun top(pigeon_instance: Rect): Long {
        return pigeon_instance.top.toLong()
    }

    override fun right(pigeon_instance: Rect): Long {
        return pigeon_instance.right.toLong()
    }

    override fun bottom(pigeon_instance: Rect): Long {
        return pigeon_instance.bottom.toLong()
    }
}