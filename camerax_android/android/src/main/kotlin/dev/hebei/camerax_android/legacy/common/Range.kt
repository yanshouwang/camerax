package dev.hebei.camerax_android.legacy.common

import android.util.Range
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiIntRange

class IntRange(registrar: CameraXRegistrar) : PigeonApiIntRange(registrar) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): Stub {
        val obj = Range(lower.toInt(), upper.toInt())
        return Stub(obj)
    }

    override fun lower(pigeon_instance: Stub): Long {
        return pigeon_instance.lower
    }

    override fun upper(pigeon_instance: Stub): Long {
        return pigeon_instance.upper
    }

    class Stub(internal val obj: Range<Int>) {
        val lower get() = obj.lower.toLong()
        val upper get() = obj.upper.toLong()
    }
}