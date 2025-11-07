package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FocusMeteringActionMeteringModeApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionProxyApi
import dev.zeekr.camerax_android.common.DurationTuple
import dev.zeekr.camerax_android.common.MeteringPointTuple

class FocusMeteringActionImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFocusMeteringActionProxyApi(registrar) {
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
}

val FocusMeteringActionMeteringModeApi.impl: Int
    get() = when (this) {
        FocusMeteringActionMeteringModeApi.AF -> FocusMeteringAction.FLAG_AF
        FocusMeteringActionMeteringModeApi.AE -> FocusMeteringAction.FLAG_AE
        FocusMeteringActionMeteringModeApi.AWB -> FocusMeteringAction.FLAG_AWB
    }
