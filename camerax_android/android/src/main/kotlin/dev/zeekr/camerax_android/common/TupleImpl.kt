package dev.zeekr.camerax_android.common

import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FocusMeteringActionMeteringModeApi
import dev.zeekr.camerax_android.PigeonApiDurationTupleProxyApi
import dev.zeekr.camerax_android.PigeonApiMeteringPointTupleProxyApi
import dev.zeekr.camerax_android.TimeUnitApi
import dev.zeekr.camerax_android.core.impl
import java.util.concurrent.TimeUnit

class DurationTupleImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiDurationTupleProxyApi(registrar) {
    override fun pigeon_defaultConstructor(duration: Long, timeUnit: TimeUnitApi): DurationTuple {
        return DurationTuple(duration, timeUnit.impl)
    }
}

class MeteringPointTupleImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiMeteringPointTupleProxyApi(registrar) {
    override fun pigeon_defaultConstructor(
        point: MeteringPoint,
        modes: List<FocusMeteringActionMeteringModeApi>?
    ): MeteringPointTuple {
        val mode = if (modes.isNullOrEmpty()) null
        else modes.map { it.impl }.reduce { acc, i -> acc or i }
        return MeteringPointTuple(point, mode)
    }
}

data class DurationTuple(val duration: Long, val timeUnit: TimeUnit)

data class MeteringPointTuple(val point: MeteringPoint, @param:FocusMeteringAction.MeteringMode val mode: Int?)
