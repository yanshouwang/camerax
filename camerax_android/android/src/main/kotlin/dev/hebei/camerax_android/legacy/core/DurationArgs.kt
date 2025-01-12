package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiDurationArgs
import dev.hebei.camerax_android.legacy.TimeUnit

class DurationArgs(registrar: CameraXRegistrar) : PigeonApiDurationArgs(registrar) {
    override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnit): Stub {
        return Stub(duration, timeUnit.obj)
    }

    data class Stub(val duration: Long, val timeUnit: java.util.concurrent.TimeUnit)
}

val TimeUnit.obj
    get() = when (this) {
        TimeUnit.NANOSECONDS -> java.util.concurrent.TimeUnit.NANOSECONDS
        TimeUnit.MICROSECONDS -> java.util.concurrent.TimeUnit.MICROSECONDS
        TimeUnit.MILLISECONDS -> java.util.concurrent.TimeUnit.MILLISECONDS
        TimeUnit.SECONDS -> java.util.concurrent.TimeUnit.SECONDS
        TimeUnit.MINUTES -> java.util.concurrent.TimeUnit.MINUTES
        TimeUnit.HOURS -> java.util.concurrent.TimeUnit.HOURS
        TimeUnit.DAYS -> java.util.concurrent.TimeUnit.DAYS
    }