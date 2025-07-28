package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.MeteringModeApi
import dev.zeekr.camerax_android.PigeonApiDurationTupleApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionApi
import dev.zeekr.camerax_android.PigeonApiMeteringPointTupleApi
import dev.zeekr.camerax_android.TimeUnitApi
import java.util.concurrent.TimeUnit

class FocusMeteringActionImpl(impl: CameraXImpl) : PigeonApiFocusMeteringActionApi(impl) {
    override fun build(
        first: MeteringPointTuple,
        others: List<MeteringPointTuple>?,
        disableAutoCancel: Boolean?,
        autoCancelDuration: DurationTuple?
    ): FocusMeteringAction {
        val builder = if (first.mode == null) FocusMeteringAction.Builder(first.point)
        else FocusMeteringAction.Builder(first.point, first.mode)
        if (others != null) {
            for (other in others) {
                if (other.mode == null) builder.addPoint(other.point)
                else builder.addPoint(other.point, other.mode)
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

    override fun getAutoCancelDurationInMillis(pigeon_instance: FocusMeteringAction): Long {
        return pigeon_instance.autoCancelDurationInMillis
    }

    override fun getMeteringPointsAe(pigeon_instance: FocusMeteringAction): List<MeteringPoint> {
        return pigeon_instance.meteringPointsAe
    }

    override fun getMeteringPointsAf(pigeon_instance: FocusMeteringAction): List<MeteringPoint> {
        return pigeon_instance.meteringPointsAf
    }

    override fun getMeteringPointsAwb(pigeon_instance: FocusMeteringAction): List<MeteringPoint> {
        return pigeon_instance.meteringPointsAwb
    }

    override fun isAutoCancelEnabled(pigeon_instance: FocusMeteringAction): Boolean {
        return pigeon_instance.isAutoCancelEnabled
    }

    class MeteringPointTupleImpl(impl: CameraXImpl) : PigeonApiMeteringPointTupleApi(impl) {
        override fun pigeon_defaultConstructor(
            point: MeteringPoint, modes: List<MeteringModeApi>?
        ): MeteringPointTuple {
            val mode = if (modes.isNullOrEmpty()) null
            else modes.fold(0) { total, next -> total or next.impl }
            return MeteringPointTuple(point, mode)
        }
    }

    class DurationTupleImpl(impl: CameraXImpl) : PigeonApiDurationTupleApi(impl) {
        override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnitApi): DurationTuple {
            return DurationTuple(duration, timeUnit.impl)
        }
    }
}

data class MeteringPointTuple(val point: MeteringPoint, @FocusMeteringAction.MeteringMode val mode: Int?)

data class DurationTuple(val duration: Long, val timeUnit: TimeUnit)

val MeteringModeApi.impl
    get() = when (this) {
        MeteringModeApi.AF -> FocusMeteringAction.FLAG_AF
        MeteringModeApi.AE -> FocusMeteringAction.FLAG_AE
        MeteringModeApi.AWB -> FocusMeteringAction.FLAG_AWB
    }

val TimeUnitApi.impl
    get() = when (this) {
        TimeUnitApi.NANOSECONDS -> TimeUnit.NANOSECONDS
        TimeUnitApi.MICROSECONDS -> TimeUnit.MICROSECONDS
        TimeUnitApi.MILLISECONDS -> TimeUnit.MILLISECONDS
        TimeUnitApi.SECONDS -> TimeUnit.SECONDS
        TimeUnitApi.MINUTES -> TimeUnit.MINUTES
        TimeUnitApi.HOURS -> TimeUnit.HOURS
        TimeUnitApi.DAYS -> TimeUnit.DAYS
    }