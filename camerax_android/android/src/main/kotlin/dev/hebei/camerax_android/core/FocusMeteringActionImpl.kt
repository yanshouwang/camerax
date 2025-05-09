package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.MeteringModeApi
import dev.hebei.camerax_android.PigeonApiDurationTupleApi
import dev.hebei.camerax_android.PigeonApiFocusMeteringActionApi
import dev.hebei.camerax_android.PigeonApiMeteringPointTupleApi
import dev.hebei.camerax_android.TimeUnitApi

class FocusMeteringActionImpl(registrar: CameraXRegistrar) : PigeonApiFocusMeteringActionApi(registrar) {
    override fun build(
        first: MeteringPointTuple,
        others: List<MeteringPointTuple>?,
        disableAutoCancel: Boolean?,
        autoCancelDuration: DurationTuple?
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

    class MeteringPointTupleImpl(registrar: CameraXRegistrar) : PigeonApiMeteringPointTupleApi(registrar) {
        override fun pigeon_defaultConstructor(
            point: androidx.camera.core.MeteringPoint, modes: List<MeteringModeApi>?
        ): MeteringPointTuple {
            val mode = if (modes.isNullOrEmpty()) null
            else modes.fold(0) { total, next -> total or next.impl }
            return MeteringPointTuple(point, mode)
        }
    }

    class DurationTupleImpl(registrar: CameraXRegistrar) : PigeonApiDurationTupleApi(registrar) {
        override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnitApi): DurationTuple {
            return DurationTuple(duration, timeUnit.impl)
        }
    }
}

data class MeteringPointTuple(
    val point: androidx.camera.core.MeteringPoint, @androidx.camera.core.FocusMeteringAction.MeteringMode val mode: Int?
)

data class DurationTuple(val duration: Long, val timeUnit: java.util.concurrent.TimeUnit)

val MeteringModeApi.impl
    get() = when (this) {
        MeteringModeApi.AF -> androidx.camera.core.FocusMeteringAction.FLAG_AF
        MeteringModeApi.AE -> androidx.camera.core.FocusMeteringAction.FLAG_AE
        MeteringModeApi.AWB -> androidx.camera.core.FocusMeteringAction.FLAG_AWB
    }

val TimeUnitApi.impl
    get() = when (this) {
        TimeUnitApi.NANOSECONDS -> java.util.concurrent.TimeUnit.NANOSECONDS
        TimeUnitApi.MICROSECONDS -> java.util.concurrent.TimeUnit.MICROSECONDS
        TimeUnitApi.MILLISECONDS -> java.util.concurrent.TimeUnit.MILLISECONDS
        TimeUnitApi.SECONDS -> java.util.concurrent.TimeUnit.SECONDS
        TimeUnitApi.MINUTES -> java.util.concurrent.TimeUnit.MINUTES
        TimeUnitApi.HOURS -> java.util.concurrent.TimeUnit.HOURS
        TimeUnitApi.DAYS -> java.util.concurrent.TimeUnit.DAYS
    }