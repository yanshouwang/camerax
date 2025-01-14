package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.*

class FocusMeteringAction(registrar: CameraXRegistrar) : PigeonApiFocusMeteringAction(registrar) {
    override fun build(
        first: MeteringPointArgs.Stub,
        others: List<MeteringPointArgs.Stub>?,
        disableAutoCancel: Boolean?,
        autoCancelDuration: DurationArgs.Stub?
    ): androidx.camera.core.FocusMeteringAction {
        val builder = if (first.mode == null) androidx.camera.core.FocusMeteringAction.Builder(first.point)
        else androidx.camera.core.FocusMeteringAction.Builder(first.point, first.mode)
        if (others != null) {
            for (otherPoint in others) {
                if (otherPoint.mode == null) builder.addPoint(otherPoint.point)
                else builder.addPoint(otherPoint.point, otherPoint.mode)
            }
        }
        if (disableAutoCancel != null) {
            builder.disableAutoCancel()
        }
        if (autoCancelDuration != null) {
            builder.setAutoCancelDuration(autoCancelDuration.duration, autoCancelDuration.timeUnit)
        }
        return builder.build()
    }

    override fun getAutoCancelDurationInMillis(pigeon_instance: androidx.camera.core.FocusMeteringAction): Long {
        return pigeon_instance.autoCancelDurationInMillis
    }

    override fun getMeteringPointsAe(pigeon_instance: androidx.camera.core.FocusMeteringAction): List<androidx.camera.core.MeteringPoint> {
        return pigeon_instance.meteringPointsAe
    }

    override fun getMeteringPointsAf(pigeon_instance: androidx.camera.core.FocusMeteringAction): List<androidx.camera.core.MeteringPoint> {
        return pigeon_instance.meteringPointsAf
    }

    override fun getMeteringPointsAwb(pigeon_instance: androidx.camera.core.FocusMeteringAction): List<androidx.camera.core.MeteringPoint> {
        return pigeon_instance.meteringPointsAwb
    }

    override fun isAutoCancelEnabled(pigeon_instance: androidx.camera.core.FocusMeteringAction): Boolean {
        return pigeon_instance.isAutoCancelEnabled
    }

    class MeteringPointArgs(registrar: CameraXRegistrar) : PigeonApiMeteringPointArgs(registrar) {
        override fun pigeon_defaultConstructor(
            point: androidx.camera.core.MeteringPoint, modes: List<MeteringMode>?
        ): Stub {
            val mode = if (modes.isNullOrEmpty()) null
            else modes.fold(0) { total, next -> total or next.obj }
            return Stub(point, mode)
        }

        data class Stub(
            val point: androidx.camera.core.MeteringPoint,
            @androidx.camera.core.FocusMeteringAction.MeteringMode val mode: Int?
        )
    }

    class DurationArgs(registrar: CameraXRegistrar) : PigeonApiDurationArgs(registrar) {
        override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnit): Stub {
            return Stub(duration, timeUnit.obj)
        }

        data class Stub(val duration: Long, val timeUnit: java.util.concurrent.TimeUnit)
    }
}

val MeteringMode.obj
    get() = when (this) {
        MeteringMode.AF -> androidx.camera.core.FocusMeteringAction.FLAG_AF
        MeteringMode.AE -> androidx.camera.core.FocusMeteringAction.FLAG_AE
        MeteringMode.AWB -> androidx.camera.core.FocusMeteringAction.FLAG_AWB
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