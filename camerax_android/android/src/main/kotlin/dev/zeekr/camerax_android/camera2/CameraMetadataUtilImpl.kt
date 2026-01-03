package dev.zeekr.camerax_android.camera2

import dev.zeekr.camerax_android.*

class CameraMetadataUtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraMetadataUtilProxyApi(registrar) {
    override fun fromInfoSupportedHardwareLevel(value: Long): CameraMetadataInfoSupportedHardwareLevelApi {
        return CameraMetadataUtil.fromInfoSupportedHardwareLevel(value)
    }

    override fun fromControlMode(value: Long): CameraMetadataControlModeApi {
        return CameraMetadataUtil.fromControlMode(value)
    }

    override fun fromControlAeMode(value: Long): CameraMetadataControlAeModeApi {
        return CameraMetadataUtil.fromControlAeMode(value)
    }

    override fun fromControlAfMode(value: Long): CameraMetadataControlAfModeApi {
        return CameraMetadataUtil.fromControlAfMode(value)
    }

    override fun fromControlAwbMode(value: Long): CameraMetadataControlAwbModeApi {
        return CameraMetadataUtil.fromControlAwbMode(value)
    }

    override fun toInfoSupportedHardwareLevel(level: CameraMetadataInfoSupportedHardwareLevelApi): Long {
        return CameraMetadataUtil.toInfoSupportedHardwareLevel(level)
    }

    override fun toControlMode(mode: CameraMetadataControlModeApi): Long {
        return CameraMetadataUtil.toControlMode(mode)
    }

    override fun toControlAeMode(mode: CameraMetadataControlAeModeApi): Long {
        return CameraMetadataUtil.toControlAeMode(mode)
    }

    override fun toControlAfMode(mode: CameraMetadataControlAfModeApi): Long {
        return CameraMetadataUtil.toControlAfMode(mode)
    }

    override fun toControlAwbMode(mode: CameraMetadataControlAwbModeApi): Long {
        return CameraMetadataUtil.toControlAwbMode(mode)
    }
}