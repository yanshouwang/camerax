package dev.hebei.camerax_android.legacy


class Point(registrar: CameraXRegistrar) : PigeonApiPoint(registrar) {
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