package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.MeteringMode
import dev.hebei.camerax_android.legacy.PigeonApiMeteringPointArgs

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

val MeteringMode.obj
    get() = when (this) {
        MeteringMode.AF -> androidx.camera.core.FocusMeteringAction.FLAG_AF
        MeteringMode.AE -> androidx.camera.core.FocusMeteringAction.FLAG_AE
        MeteringMode.AWB -> androidx.camera.core.FocusMeteringAction.FLAG_AWB
    }