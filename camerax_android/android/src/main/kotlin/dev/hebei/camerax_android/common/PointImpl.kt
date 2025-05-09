package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiPointApi


class PointImpl(registrar: CameraXRegistrar) : PigeonApiPointApi(registrar) {
    override fun pigeon_defaultConstructor(x: Long, y: Long): android.graphics.Point {
        return android.graphics.Point(x.toInt(), y.toInt())
    }

    override fun x(pigeon_instance: android.graphics.Point): Long {
        return pigeon_instance.x.toLong()
    }

    override fun y(pigeon_instance: android.graphics.Point): Long {
        return pigeon_instance.y.toLong()
    }
}