package dev.hebei.camerax_android.common

import android.util.Range
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiIntRangeApi
import dev.hebei.camerax_android.PigeonApiLongRangeApi

class IntRangeImpl(impl: CameraXImpl) : PigeonApiIntRangeApi(impl) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): IntRange {
        val instance = Range(lower.toInt(), upper.toInt())
        return IntRange(instance)
    }

    override fun lower(pigeon_instance: IntRange): Long {
        return pigeon_instance.instance.lower.toLong()
    }

    override fun upper(pigeon_instance: IntRange): Long {
        return pigeon_instance.instance.upper.toLong()
    }
}

class LongRangeImpl(impl: CameraXImpl) : PigeonApiLongRangeApi(impl) {
    override fun pigeon_defaultConstructor(lower: Long, upper: Long): LongRange {
        val instance = Range(lower, upper)
        return LongRange(instance)
    }

    override fun lower(pigeon_instance: LongRange): Long {
        return pigeon_instance.instance.lower
    }

    override fun upper(pigeon_instance: LongRange): Long {
        return pigeon_instance.instance.upper
    }
}

class IntRange(internal val instance: Range<Int>)

class LongRange(internal val instance: Range<Long>)