package dev.hebei.camerax_android.common

import android.graphics.Point
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiPointApi

class PointImpl(impl: CameraXImpl) : PigeonApiPointApi(impl) {
    override fun pigeon_defaultConstructor(x: Long, y: Long): Point {
        return Point(x.toInt(), y.toInt())
    }

    override fun x(pigeon_instance: Point): Long {
        return pigeon_instance.x.toLong()
    }

    override fun y(pigeon_instance: Point): Long {
        return pigeon_instance.y.toLong()
    }
}