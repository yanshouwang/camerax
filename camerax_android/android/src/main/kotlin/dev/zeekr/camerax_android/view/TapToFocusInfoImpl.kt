package dev.zeekr.camerax_android.view

import android.graphics.PointF
import androidx.camera.view.TapToFocusInfo
import dev.zeekr.camerax_android.CameraControllerTapToFocusApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiTapToFocusInfoProxyApi

class TapToFocusInfoImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiTapToFocusInfoProxyApi(registrar) {
    override fun pigeon_defaultConstructor(
        focusState: CameraControllerTapToFocusApi,
        tapPoint: PointF?
    ): TapToFocusInfo {
        return TapToFocusInfo(focusState.impl, tapPoint)
    }

    override fun focusState(pigeon_instance: TapToFocusInfo): CameraControllerTapToFocusApi {
        return pigeon_instance.focusState.cameraControllerTapToFocusApi
    }

    override fun tapPoint(pigeon_instance: TapToFocusInfo): PointF? {
        return pigeon_instance.tapPoint
    }
}
