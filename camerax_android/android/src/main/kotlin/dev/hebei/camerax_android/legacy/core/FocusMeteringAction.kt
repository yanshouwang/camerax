package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiFocusMeteringAction

class FocusMeteringAction(registrar: CameraXRegistrar) : PigeonApiFocusMeteringAction(registrar) {
    override fun pigeon_defaultConstructor(
        first: MeteringPointArgs.Wrapper,
        others: List<MeteringPointArgs.Wrapper>?,
        disableAutoCancel: Boolean?,
        autoCancelDuration: DurationArgs.Wrapper?
    ): dev.hebei.camerax_android.core.FocusMeteringAction {
        val builder =
            if (first.mode == null) dev.hebei.camerax_android.core.FocusMeteringAction.Builder(first.point)
            else dev.hebei.camerax_android.core.FocusMeteringAction.Builder(first.point, first.mode)
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
}