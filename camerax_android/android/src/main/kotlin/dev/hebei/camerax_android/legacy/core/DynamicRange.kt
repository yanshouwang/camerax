package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.BitDepth
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.Encoding
import dev.hebei.camerax_android.legacy.PigeonApiDynamicRange

class DynamicRange(registrar: CameraXRegistrar) : PigeonApiDynamicRange(registrar) {
    override fun pigeon_defaultConstructor(encoding: Encoding, bitDepth: BitDepth): androidx.camera.core.DynamicRange {
        return androidx.camera.core.DynamicRange(encoding.obj, bitDepth.obj)
    }

    override fun getEncoding(pigeon_instance: androidx.camera.core.DynamicRange): Encoding {
        return pigeon_instance.encoding.encodingArgs
    }

    override fun getBitDepth(pigeon_instance: androidx.camera.core.DynamicRange): BitDepth {
        return pigeon_instance.bitDepth.bitDepthArgs
    }
}

val Encoding.obj
    get() = when (this) {
        Encoding.UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED
        Encoding.SDR -> androidx.camera.core.DynamicRange.ENCODING_SDR
        Encoding.HDR_UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED
        Encoding.HLG -> androidx.camera.core.DynamicRange.ENCODING_HLG
        Encoding.HDR10 -> androidx.camera.core.DynamicRange.ENCODING_HDR10
        Encoding.HDR10PLUS -> androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS
        Encoding.DOLBY_VISION -> androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION
    }

val BitDepth.obj
    get() = when (this) {
        BitDepth.BIT_DEPTH_UNSPECIFIED -> androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED
        BitDepth.BIT_DEPTH8BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT
        BitDepth.BIT_DEPTH10BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT
    }

val Int.encodingArgs
    get() = when (this) {
        androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED -> Encoding.UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_SDR -> Encoding.SDR
        androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED -> Encoding.HDR_UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_HLG -> Encoding.HLG
        androidx.camera.core.DynamicRange.ENCODING_HDR10 -> Encoding.HDR10
        androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS -> Encoding.HDR10PLUS
        androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION -> Encoding.DOLBY_VISION
        else -> throw IllegalArgumentException()
    }

val Int.bitDepthArgs
    get() = when (this) {
        androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED -> BitDepth.BIT_DEPTH_UNSPECIFIED
        androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT -> BitDepth.BIT_DEPTH8BIT
        androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT -> BitDepth.BIT_DEPTH10BIT
        else -> throw IllegalArgumentException()
    }