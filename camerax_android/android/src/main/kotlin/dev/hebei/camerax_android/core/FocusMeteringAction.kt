package dev.hebei.camerax_android.core

import androidx.annotation.IntDef
import androidx.annotation.IntRange
import androidx.annotation.RestrictTo
import java.util.concurrent.TimeUnit

class FocusMeteringAction internal constructor(internal val obj: androidx.camera.core.FocusMeteringAction) {
    companion object {
        const val FLAG_AF = androidx.camera.core.FocusMeteringAction.FLAG_AF
        const val FLAG_AE = androidx.camera.core.FocusMeteringAction.FLAG_AE
        const val FLAG_AWB = androidx.camera.core.FocusMeteringAction.FLAG_AWB
    }

    val autoCancelDurationInMills get() = obj.autoCancelDurationInMillis
    val meteringPointsAe get() = obj.meteringPointsAe
    val meteringPointsAf get() = obj.meteringPointsAf
    val meteringPointsAwb get() = obj.meteringPointsAwb
    val isAutoCancelEnabled get() = obj.isAutoCancelEnabled

    class Builder {
        constructor(point: MeteringPoint) {
            builder = androidx.camera.core.FocusMeteringAction.Builder(point.obj)
        }

        constructor(point: MeteringPoint, @MeteringMode meteringMode: Int) {
            builder = androidx.camera.core.FocusMeteringAction.Builder(point.obj, meteringMode)
        }

        private val builder: androidx.camera.core.FocusMeteringAction.Builder

        fun addPoint(point: MeteringPoint): Builder {
            builder.addPoint(point.obj)
            return this
        }

        fun addPoint(point: MeteringPoint, @MeteringMode meteringMode: Int): Builder {
            builder.addPoint(point.obj, meteringMode)
            return this
        }

        fun disableAutoCancel(): Builder {
            builder.disableAutoCancel()
            return this
        }

        fun setAutoCancelDuration(@IntRange(from = 1) duration: Long, timeUnit: TimeUnit): Builder {
            builder.setAutoCancelDuration(duration, timeUnit)
            return this
        }

        fun build(): FocusMeteringAction {
            val obj = builder.build()
            return FocusMeteringAction(obj)
        }
    }

    @IntDef(flag = true, value = [FLAG_AF, FLAG_AE, FLAG_AWB])
    @Retention(AnnotationRetention.SOURCE)
    @RestrictTo(RestrictTo.Scope.LIBRARY_GROUP)
    annotation class MeteringMode
}
