package dev.hebei.camerax_android.common

import android.util.Range
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiIntRangeApi
import dev.hebei.camerax_android.PigeonApiLongRangeApi

class IntRangeImpl(impl: CameraXImpl) : PigeonApiIntRangeApi(impl) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): IntRange {
        val obj = Range(lower.toInt(), upper.toInt())
        return IntRange(obj)
    }

    override fun lower(pigeon_instance: IntRange): Long {
        return pigeon_instance.lower
    }

    override fun upper(pigeon_instance: IntRange): Long {
        return pigeon_instance.upper
    }
}

class LongRangeImpl(impl: CameraXImpl) : PigeonApiLongRangeApi(impl) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): LongRange {
        val obj = Range(lower, upper)
        return LongRange(obj)
    }

    override fun lower(pigeon_instance: LongRange): Long {
        return pigeon_instance.lower
    }

    override fun upper(pigeon_instance: LongRange): Long {
        return pigeon_instance.upper
    }
}

class IntRange(internal val obj: Range<Int>) {
    val lower get() = obj.lower.toLong()
    val upper get() = obj.upper.toLong()
}

class LongRange(internal val obj: Range<Long>) {
    val lower: Long get() = obj.lower
    val upper: Long get() = obj.upper
}