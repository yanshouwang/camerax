package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiIntRange

class IntRange(registrar: CameraXRegistrar) : PigeonApiIntRange(registrar) {
    override fun getLower(pigeon_instance: Wrapper): Long {
        return pigeon_instance.lower
    }

    override fun getUpper(pigeon_instance: Wrapper): Long {
        return pigeon_instance.upper
    }

    class Wrapper(private val obj: android.util.Range<Int>) {
        val lower get() = obj.lower.toLong()
        val upper get() = obj.upper.toLong()
    }
}