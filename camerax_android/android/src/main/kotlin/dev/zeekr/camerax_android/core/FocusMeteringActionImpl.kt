package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FocusMeteringActionMeteringModeApi
import dev.zeekr.camerax_android.PigeonApiDurationTupleApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionApi
import dev.zeekr.camerax_android.PigeonApiMeteringPointTupleApi
import dev.zeekr.camerax_android.TimeUnitApi
import dev.zeekr.camerax_android.common.impl
import java.util.concurrent.TimeUnit

class FocusMeteringActionImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFocusMeteringActionApi(registrar) {
    override fun build(
        point: MeteringPointTuple,
        morePoints: List<MeteringPointTuple>?,
        disableAutoCancel: Boolean?,
        autoCancelDuration: DurationTuple?
    ): FocusMeteringAction {
        val builder = if (point.mode == null) FocusMeteringAction.Builder(point.point)
        else FocusMeteringAction.Builder(point.point, point.mode)
        if (morePoints != null) {
            for (other in morePoints) {
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

    class MeteringPointTupleImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiMeteringPointTupleApi(registrar) {
        override fun pigeon_defaultConstructor(
            point: MeteringPoint,
            modes: List<FocusMeteringActionMeteringModeApi>?
        ): MeteringPointTuple {
            val mode = if (modes.isNullOrEmpty()) null
            else modes.map { it.impl }.reduce { acc, i -> acc or i }
            return MeteringPointTuple(point, mode)
        }
    }

    class DurationTupleImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiDurationTupleApi(registrar) {
        override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnitApi): DurationTuple {
            return DurationTuple(duration, timeUnit.impl)
        }
    }
}

data class MeteringPointTuple(val point: MeteringPoint, @param:FocusMeteringAction.MeteringMode val mode: Int?)

data class DurationTuple(val duration: Long, val timeUnit: TimeUnit)

val FocusMeteringActionMeteringModeApi.impl: Int
    get() = when (this) {
        FocusMeteringActionMeteringModeApi.AF -> FocusMeteringAction.FLAG_AF
        FocusMeteringActionMeteringModeApi.AE -> FocusMeteringAction.FLAG_AE
        FocusMeteringActionMeteringModeApi.AWB -> FocusMeteringAction.FLAG_AWB
    }
