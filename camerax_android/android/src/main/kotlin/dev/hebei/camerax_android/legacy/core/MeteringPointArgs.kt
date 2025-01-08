package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.MeteringMode
import dev.hebei.camerax_android.legacy.PigeonApiMeteringPointArgs

class MeteringPointArgs(registrar: CameraXRegistrar) : PigeonApiMeteringPointArgs(registrar) {
    override fun pigeon_defaultConstructor(
        point: dev.hebei.camerax_android.core.MeteringPoint, modes: List<MeteringMode>?
    ): Wrapper {
        val mode = if (modes.isNullOrEmpty()) null
        else modes.fold(0) { total, next -> total or next.obj }
        return Wrapper(point, mode)
    }

    data class Wrapper(
        val point: dev.hebei.camerax_android.core.MeteringPoint,
        @dev.hebei.camerax_android.core.FocusMeteringAction.MeteringMode val mode: Int?
    )
}

val MeteringMode.obj
    get() = when (this) {
        MeteringMode.AF -> dev.hebei.camerax_android.core.FocusMeteringAction.FLAG_AF
        MeteringMode.AE -> dev.hebei.camerax_android.core.FocusMeteringAction.FLAG_AE
        MeteringMode.AWB -> dev.hebei.camerax_android.core.FocusMeteringAction.FLAG_AWB
    }