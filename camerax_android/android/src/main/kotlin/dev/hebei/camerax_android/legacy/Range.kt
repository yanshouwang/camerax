package dev.hebei.camerax_android.legacy

import android.util.Range

class IntRange(registrar: CameraXRegistrar) : PigeonApiIntRange(registrar) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): Stub {
        val obj = Range(lower.toInt(), upper.toInt())
        return Stub(obj)
    }

    override fun getLower(pigeon_instance: Stub): Long {
        return pigeon_instance.lower
    }

    override fun getUpper(pigeon_instance: Stub): Long {
        return pigeon_instance.upper
    }

    class Stub(internal val obj: Range<Int>) {
        val lower get() = obj.lower.toLong()
        val upper get() = obj.upper.toLong()
    }
}