package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CameraMetadata
import android.os.Build
import dev.zeekr.camerax_android.ControlAeModeApi
import dev.zeekr.camerax_android.ControlAfModeApi
import dev.zeekr.camerax_android.ControlAwbModeApi
import dev.zeekr.camerax_android.ControlModeApi

val ControlModeApi.impl
    get() = when (this) {
        ControlModeApi.AUTO -> CameraMetadata.CONTROL_MODE_AUTO
        ControlModeApi.OFF -> CameraMetadata.CONTROL_MODE_OFF
        ControlModeApi.OFF_KEEP_STATE -> CameraMetadata.CONTROL_MODE_OFF_KEEP_STATE
        ControlModeApi.USE_EXTENDED_SCENE_MODE -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            CameraMetadata.CONTROL_MODE_USE_EXTENDED_SCENE_MODE
        } else {
            throw UnsupportedOperationException()
        }

        ControlModeApi.USE_SCENE_MODE -> CameraMetadata.CONTROL_MODE_USE_SCENE_MODE
    }

val ControlAeModeApi.impl
    get() = when (this) {
        ControlAeModeApi.OFF -> CameraMetadata.CONTROL_AE_MODE_OFF
        ControlAeModeApi.ON -> CameraMetadata.CONTROL_AE_MODE_ON
        ControlAeModeApi.ON_ALWAYS_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_ALWAYS_FLASH
        ControlAeModeApi.ON_AUTO_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH
        ControlAeModeApi.ON_AUTO_FLASH_REDEYE -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH_REDEYE
        ControlAeModeApi.ON_EXTERNAL_FLASH -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            CameraMetadata.CONTROL_AE_MODE_ON_EXTERNAL_FLASH
        } else {
            throw UnsupportedOperationException()
        }

        ControlAeModeApi.ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
            CameraMetadata.CONTROL_AE_MODE_ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY
        } else {
            throw UnsupportedOperationException()
        }
    }

val ControlAfModeApi.impl
    get() = when (this) {
        ControlAfModeApi.AUTO -> CameraMetadata.CONTROL_AF_MODE_AUTO
        ControlAfModeApi.CONTINUOUS_PICTURE -> CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_PICTURE
        ControlAfModeApi.EDOF -> CameraMetadata.CONTROL_AF_MODE_EDOF
        ControlAfModeApi.MACRO -> CameraMetadata.CONTROL_AF_MODE_MACRO
        ControlAfModeApi.OFF -> CameraMetadata.CONTROL_AF_MODE_OFF
    }

val ControlAwbModeApi.impl
    get() = when (this) {
        ControlAwbModeApi.AUTO -> CameraMetadata.CONTROL_AWB_MODE_AUTO
        ControlAwbModeApi.CLOUDY_DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_CLOUDY_DAYLIGHT
        ControlAwbModeApi.DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_DAYLIGHT
        ControlAwbModeApi.FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_FLUORESCENT
        ControlAwbModeApi.INCANDESECENT -> CameraMetadata.CONTROL_AWB_MODE_INCANDESCENT
        ControlAwbModeApi.OFF -> CameraMetadata.CONTROL_AWB_MODE_OFF
        ControlAwbModeApi.SHADE -> CameraMetadata.CONTROL_AWB_MODE_SHADE
        ControlAwbModeApi.TWILIGHT -> CameraMetadata.CONTROL_AWB_MODE_TWILIGHT
        ControlAwbModeApi.WARM_FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_WARM_FLUORESCENT
    }