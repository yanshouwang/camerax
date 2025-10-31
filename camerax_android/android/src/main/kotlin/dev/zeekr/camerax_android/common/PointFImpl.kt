package dev.zeekr.camerax_android.common

import android.graphics.PointF
import dev.zeekr.camerax_android.CameraXRegistrarImpl
import dev.zeekr.camerax_android.PigeonApiPointFApi

class PointFImpl(impl: CameraXRegistrarImpl) : PigeonApiPointFApi(impl) {
    override fun pigeon_defaultConstructor(x: Double, y: Double): PointF {
        return PointF(x.toFloat(), y.toFloat())
    }

    override fun x(pigeon_instance: PointF): Double {
        return pigeon_instance.x.toDouble()
    }

    override fun y(pigeon_instance: PointF): Double {
        return pigeon_instance.y.toDouble()
    }
}