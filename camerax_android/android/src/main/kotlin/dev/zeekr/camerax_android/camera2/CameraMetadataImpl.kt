package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CameraMetadata
import android.os.Build
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi

val CameraMetadataControlModeApi.impl: Int
    get() = when (this) {
        CameraMetadataControlModeApi.AUTO -> CameraMetadata.CONTROL_MODE_AUTO
        CameraMetadataControlModeApi.OFF -> CameraMetadata.CONTROL_MODE_OFF
        CameraMetadataControlModeApi.OFF_KEEP_STATE -> CameraMetadata.CONTROL_MODE_OFF_KEEP_STATE
        CameraMetadataControlModeApi.USE_EXTENDED_SCENE_MODE -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) CameraMetadata.CONTROL_MODE_USE_EXTENDED_SCENE_MODE
        else throw UnsupportedOperationException()

        CameraMetadataControlModeApi.USE_SCENE_MODE -> CameraMetadata.CONTROL_MODE_USE_SCENE_MODE
    }

val CameraMetadataControlAeModeApi.impl: Int
    get() = when (this) {
        CameraMetadataControlAeModeApi.OFF -> CameraMetadata.CONTROL_AE_MODE_OFF
        CameraMetadataControlAeModeApi.ON -> CameraMetadata.CONTROL_AE_MODE_ON
        CameraMetadataControlAeModeApi.ON_ALWAYS_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_ALWAYS_FLASH
        CameraMetadataControlAeModeApi.ON_AUTO_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH
        CameraMetadataControlAeModeApi.ON_AUTO_FLASH_REDEYE -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH_REDEYE
        CameraMetadataControlAeModeApi.ON_EXTERNAL_FLASH -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) CameraMetadata.CONTROL_AE_MODE_ON_EXTERNAL_FLASH
        else throw UnsupportedOperationException()

        CameraMetadataControlAeModeApi.ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) CameraMetadata.CONTROL_AE_MODE_ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY
        else throw UnsupportedOperationException()

    }

val CameraMetadataControlAfModeApi.impl: Int
    get() = when (this) {
        CameraMetadataControlAfModeApi.AUTO -> CameraMetadata.CONTROL_AF_MODE_AUTO
        CameraMetadataControlAfModeApi.CONTINUOUS_PICTURE -> CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_PICTURE
        CameraMetadataControlAfModeApi.EDOF -> CameraMetadata.CONTROL_AF_MODE_EDOF
        CameraMetadataControlAfModeApi.MACRO -> CameraMetadata.CONTROL_AF_MODE_MACRO
        CameraMetadataControlAfModeApi.OFF -> CameraMetadata.CONTROL_AF_MODE_OFF
    }

val CameraMetadataControlAwbModeApi.impl: Int
    get() = when (this) {
        CameraMetadataControlAwbModeApi.AUTO -> CameraMetadata.CONTROL_AWB_MODE_AUTO
        CameraMetadataControlAwbModeApi.CLOUDY_DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_CLOUDY_DAYLIGHT
        CameraMetadataControlAwbModeApi.DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_DAYLIGHT
        CameraMetadataControlAwbModeApi.FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_FLUORESCENT
        CameraMetadataControlAwbModeApi.INCANDESECENT -> CameraMetadata.CONTROL_AWB_MODE_INCANDESCENT
        CameraMetadataControlAwbModeApi.OFF -> CameraMetadata.CONTROL_AWB_MODE_OFF
        CameraMetadataControlAwbModeApi.SHADE -> CameraMetadata.CONTROL_AWB_MODE_SHADE
        CameraMetadataControlAwbModeApi.TWILIGHT -> CameraMetadata.CONTROL_AWB_MODE_TWILIGHT
        CameraMetadataControlAwbModeApi.WARM_FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_WARM_FLUORESCENT
    }