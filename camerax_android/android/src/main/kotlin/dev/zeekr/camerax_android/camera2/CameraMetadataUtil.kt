package dev.zeekr.camerax_android.camera2

import android.hardware.camera2.CameraMetadata
import dev.zeekr.camerax_android.CameraMetadataControlAeModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAfModeApi
import dev.zeekr.camerax_android.CameraMetadataControlAwbModeApi
import dev.zeekr.camerax_android.CameraMetadataControlModeApi
import dev.zeekr.camerax_android.CameraMetadataInfoSupportedHardwareLevelApi

object CameraMetadataUtil {
    fun fromInfoSupportedHardwareLevel(value: Long): CameraMetadataInfoSupportedHardwareLevelApi {
        return when (value.toInt()) {
            CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED -> CameraMetadataInfoSupportedHardwareLevelApi.LIMITED
            CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_FULL -> CameraMetadataInfoSupportedHardwareLevelApi.FULL
            CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY -> CameraMetadataInfoSupportedHardwareLevelApi.LEGACY
            CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_3 -> CameraMetadataInfoSupportedHardwareLevelApi.LEVEL3
            CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL -> CameraMetadataInfoSupportedHardwareLevelApi.EXTERNAL
            else -> throw IllegalArgumentException()
        }
    }

    fun fromControlMode(value: Long): CameraMetadataControlModeApi {
        return when (value.toInt()) {
            CameraMetadata.CONTROL_MODE_OFF -> CameraMetadataControlModeApi.OFF
            CameraMetadata.CONTROL_MODE_AUTO -> CameraMetadataControlModeApi.AUTO
            CameraMetadata.CONTROL_MODE_USE_SCENE_MODE -> CameraMetadataControlModeApi.USE_SCENE_MODE
            CameraMetadata.CONTROL_MODE_OFF_KEEP_STATE -> CameraMetadataControlModeApi.OFF_KEEP_STATE
            CameraMetadata.CONTROL_MODE_USE_EXTENDED_SCENE_MODE -> CameraMetadataControlModeApi.USE_EXTENDED_SCENE_MODE
            else -> throw IllegalArgumentException()
        }
    }

    fun fromControlAeMode(value: Long): CameraMetadataControlAeModeApi {
        return when (value.toInt()) {
            CameraMetadata.CONTROL_AE_MODE_OFF -> CameraMetadataControlAeModeApi.OFF
            CameraMetadata.CONTROL_AE_MODE_ON -> CameraMetadataControlAeModeApi.ON
            CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH -> CameraMetadataControlAeModeApi.ON_AUTO_FLASH
            CameraMetadata.CONTROL_AE_MODE_ON_ALWAYS_FLASH -> CameraMetadataControlAeModeApi.ON_ALWAYS_FLASH
            CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH_REDEYE -> CameraMetadataControlAeModeApi.ON_AUTO_FLASH_REDEYE
            CameraMetadata.CONTROL_AE_MODE_ON_EXTERNAL_FLASH -> CameraMetadataControlAeModeApi.ON_EXTERNAL_FLASH
            CameraMetadata.CONTROL_AE_MODE_ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY -> CameraMetadataControlAeModeApi.ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY
            else -> throw IllegalArgumentException()
        }
    }

    fun fromControlAfMode(value: Long): CameraMetadataControlAfModeApi {
        return when (value.toInt()) {
            CameraMetadata.CONTROL_AF_MODE_OFF -> CameraMetadataControlAfModeApi.OFF
            CameraMetadata.CONTROL_AF_MODE_AUTO -> CameraMetadataControlAfModeApi.AUTO
            CameraMetadata.CONTROL_AF_MODE_MACRO -> CameraMetadataControlAfModeApi.MACRO
            CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_VIDEO -> CameraMetadataControlAfModeApi.CONTINUOUS_VIDEO
            CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_PICTURE -> CameraMetadataControlAfModeApi.CONTINUOUS_PICTURE
            CameraMetadata.CONTROL_AF_MODE_EDOF -> CameraMetadataControlAfModeApi.EDOF
            else -> throw IllegalArgumentException()
        }
    }

    fun fromControlAwbMode(value: Long): CameraMetadataControlAwbModeApi {
        return when (value.toInt()) {
            CameraMetadata.CONTROL_AWB_MODE_OFF -> CameraMetadataControlAwbModeApi.OFF
            CameraMetadata.CONTROL_AWB_MODE_AUTO -> CameraMetadataControlAwbModeApi.AUTO
            CameraMetadata.CONTROL_AWB_MODE_INCANDESCENT -> CameraMetadataControlAwbModeApi.INCANDESECENT
            CameraMetadata.CONTROL_AWB_MODE_FLUORESCENT -> CameraMetadataControlAwbModeApi.FLUORESCENT
            CameraMetadata.CONTROL_AWB_MODE_WARM_FLUORESCENT -> CameraMetadataControlAwbModeApi.WARM_FLUORESCENT
            CameraMetadata.CONTROL_AWB_MODE_DAYLIGHT -> CameraMetadataControlAwbModeApi.DAYLIGHT
            CameraMetadata.CONTROL_AWB_MODE_CLOUDY_DAYLIGHT -> CameraMetadataControlAwbModeApi.CLOUDY_DAYLIGHT
            CameraMetadata.CONTROL_AWB_MODE_TWILIGHT -> CameraMetadataControlAwbModeApi.TWILIGHT
            CameraMetadata.CONTROL_AWB_MODE_SHADE -> CameraMetadataControlAwbModeApi.SHADE
            else -> throw IllegalArgumentException()
        }
    }

    fun toInfoSupportedHardwareLevel(level: CameraMetadataInfoSupportedHardwareLevelApi): Long {
        return when (level) {
            CameraMetadataInfoSupportedHardwareLevelApi.LIMITED -> CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED
            CameraMetadataInfoSupportedHardwareLevelApi.FULL -> CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_FULL
            CameraMetadataInfoSupportedHardwareLevelApi.LEGACY -> CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY
            CameraMetadataInfoSupportedHardwareLevelApi.LEVEL3 -> CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_3
            CameraMetadataInfoSupportedHardwareLevelApi.EXTERNAL -> CameraMetadata.INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL
        }.toLong()
    }

    fun toControlMode(mode: CameraMetadataControlModeApi): Long {
        return when (mode) {
            CameraMetadataControlModeApi.OFF -> CameraMetadata.CONTROL_MODE_OFF
            CameraMetadataControlModeApi.AUTO -> CameraMetadata.CONTROL_MODE_AUTO
            CameraMetadataControlModeApi.USE_SCENE_MODE -> CameraMetadata.CONTROL_MODE_USE_SCENE_MODE
            CameraMetadataControlModeApi.OFF_KEEP_STATE -> CameraMetadata.CONTROL_MODE_OFF_KEEP_STATE
            CameraMetadataControlModeApi.USE_EXTENDED_SCENE_MODE -> CameraMetadata.CONTROL_MODE_USE_EXTENDED_SCENE_MODE
        }.toLong()
    }

    fun toControlAeMode(mode: CameraMetadataControlAeModeApi): Long {
        return when (mode) {
            CameraMetadataControlAeModeApi.OFF -> CameraMetadata.CONTROL_AE_MODE_OFF
            CameraMetadataControlAeModeApi.ON -> CameraMetadata.CONTROL_AE_MODE_ON
            CameraMetadataControlAeModeApi.ON_AUTO_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH
            CameraMetadataControlAeModeApi.ON_ALWAYS_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_ALWAYS_FLASH
            CameraMetadataControlAeModeApi.ON_AUTO_FLASH_REDEYE -> CameraMetadata.CONTROL_AE_MODE_ON_AUTO_FLASH_REDEYE
            CameraMetadataControlAeModeApi.ON_EXTERNAL_FLASH -> CameraMetadata.CONTROL_AE_MODE_ON_EXTERNAL_FLASH
            CameraMetadataControlAeModeApi.ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY -> CameraMetadata.CONTROL_AE_MODE_ON_LOW_LIGHT_BOOST_BRIGHTNESS_PRIORITY
        }.toLong()
    }

    fun toControlAfMode(mode: CameraMetadataControlAfModeApi): Long {
        return when (mode) {
            CameraMetadataControlAfModeApi.OFF -> CameraMetadata.CONTROL_AF_MODE_OFF
            CameraMetadataControlAfModeApi.AUTO -> CameraMetadata.CONTROL_AF_MODE_AUTO
            CameraMetadataControlAfModeApi.MACRO -> CameraMetadata.CONTROL_AF_MODE_MACRO
            CameraMetadataControlAfModeApi.CONTINUOUS_VIDEO -> CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_VIDEO
            CameraMetadataControlAfModeApi.CONTINUOUS_PICTURE -> CameraMetadata.CONTROL_AF_MODE_CONTINUOUS_PICTURE
            CameraMetadataControlAfModeApi.EDOF -> CameraMetadata.CONTROL_AF_MODE_EDOF
        }.toLong()
    }

    fun toControlAwbMode(mode: CameraMetadataControlAwbModeApi): Long {
        return when (mode) {
            CameraMetadataControlAwbModeApi.OFF -> CameraMetadata.CONTROL_AWB_MODE_OFF
            CameraMetadataControlAwbModeApi.AUTO -> CameraMetadata.CONTROL_AWB_MODE_AUTO
            CameraMetadataControlAwbModeApi.INCANDESECENT -> CameraMetadata.CONTROL_AWB_MODE_INCANDESCENT
            CameraMetadataControlAwbModeApi.FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_FLUORESCENT
            CameraMetadataControlAwbModeApi.WARM_FLUORESCENT -> CameraMetadata.CONTROL_AWB_MODE_WARM_FLUORESCENT
            CameraMetadataControlAwbModeApi.DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_DAYLIGHT
            CameraMetadataControlAwbModeApi.CLOUDY_DAYLIGHT -> CameraMetadata.CONTROL_AWB_MODE_CLOUDY_DAYLIGHT
            CameraMetadataControlAwbModeApi.TWILIGHT -> CameraMetadata.CONTROL_AWB_MODE_TWILIGHT
            CameraMetadataControlAwbModeApi.SHADE -> CameraMetadata.CONTROL_AWB_MODE_SHADE
        }.toLong()
    }
}
