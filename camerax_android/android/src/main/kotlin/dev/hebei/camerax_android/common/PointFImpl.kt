package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiPointFApi

class PointFImpl(registrar: CameraXRegistrar) : PigeonApiPointFApi(registrar) {
    override fun pigeon_defaultConstructor(x: Double, y: Double): android.graphics.PointF {
        return android.graphics.PointF(x.toFloat(), y.toFloat())
    }

    override fun x(pigeon_instance: android.graphics.PointF): Double {
        return pigeon_instance.x.toDouble()
    }

    override fun y(pigeon_instance: android.graphics.PointF): Double {
        return pigeon_instance.y.toDouble()
    }
}