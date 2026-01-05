package dev.zeekr.camerax_android.core

import androidx.camera.core.FocusMeteringAction
import androidx.camera.core.MeteringPoint
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.FocusMeteringActionMeteringModeApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionBuilderProxyApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionProxyApi
import dev.zeekr.camerax_android.PigeonApiFocusMeteringActionUtilProxyApi
import dev.zeekr.camerax_android.TimeUnitApi
import dev.zeekr.camerax_android.common.impl

class FocusMeteringActionImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiFocusMeteringActionProxyApi(registrar) {
    class BuilderImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiFocusMeteringActionBuilderProxyApi(registrar) {
        override fun new1(point: MeteringPoint): FocusMeteringAction.Builder {
            return FocusMeteringAction.Builder(point)
        }

        override fun new2(point: MeteringPoint, meteringMode: Long): FocusMeteringAction.Builder {
            return FocusMeteringAction.Builder(point, meteringMode.toInt())
        }

        override fun addPoint1(
            pigeon_instance: FocusMeteringAction.Builder, point: MeteringPoint
        ): FocusMeteringAction.Builder {
            return pigeon_instance.addPoint(point)
        }

        override fun addPoint2(
            pigeon_instance: FocusMeteringAction.Builder, point: MeteringPoint, meteringMode: Long
        ): FocusMeteringAction.Builder {
            return pigeon_instance.addPoint(point, meteringMode.toInt())
        }

        override fun disableAutoCancel(pigeon_instance: FocusMeteringAction.Builder): FocusMeteringAction.Builder {
            return pigeon_instance.disableAutoCancel()
        }

        override fun setAutoCancelDuration(
            pigeon_instance: FocusMeteringAction.Builder, duration: Long, timeUnit: TimeUnitApi
        ): FocusMeteringAction.Builder {
            return pigeon_instance.setAutoCancelDuration(duration, timeUnit.impl)
        }

        override fun build(pigeon_instance: FocusMeteringAction.Builder): FocusMeteringAction {
            return pigeon_instance.build()
        }
    }

    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiFocusMeteringActionUtilProxyApi(registrar) {
        override fun fromMeteringMode(value: Long): FocusMeteringActionMeteringModeApi {
            return Util.fromMeteringMode(value.toInt())
        }

        override fun toMeteringMode(api: FocusMeteringActionMeteringModeApi): Long {
            return Util.toMeteringMode(api).toLong()
        }
    }

    object Util {
        fun fromMeteringMode(value: Int): FocusMeteringActionMeteringModeApi {
            return when (value) {
                FocusMeteringAction.FLAG_AF -> FocusMeteringActionMeteringModeApi.AF
                FocusMeteringAction.FLAG_AE -> FocusMeteringActionMeteringModeApi.AE
                FocusMeteringAction.FLAG_AWB -> FocusMeteringActionMeteringModeApi.AWB
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toMeteringMode(api: FocusMeteringActionMeteringModeApi): Int {
            return when (api) {
                FocusMeteringActionMeteringModeApi.AF -> FocusMeteringAction.FLAG_AF
                FocusMeteringActionMeteringModeApi.AE -> FocusMeteringAction.FLAG_AE
                FocusMeteringActionMeteringModeApi.AWB -> FocusMeteringAction.FLAG_AWB
            }
        }
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
