package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.BitDepth
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.Encoding
import dev.hebei.camerax_android.legacy.PigeonApiDynamicRange

class DynamicRange(registrar: CameraXRegistrar) : PigeonApiDynamicRange(registrar) {
    override fun pigeon_defaultConstructor(
        encoding: Encoding, bitDepth: BitDepth
    ): dev.hebei.camerax_android.core.DynamicRange {
        return dev.hebei.camerax_android.core.DynamicRange(encoding.obj, bitDepth.obj)
    }

    override fun getEncoding(pigeon_instance: dev.hebei.camerax_android.core.DynamicRange): Encoding {
        return pigeon_instance.encoding.args
    }

    override fun getBitDepth(pigeon_instance: dev.hebei.camerax_android.core.DynamicRange): BitDepth {
        return pigeon_instance.bitDepth.args
    }
}

val Encoding.obj
    get() = when (this) {
        Encoding.UNSPECIFIED -> dev.hebei.camerax_android.core.DynamicRange.Encoding.UNSPECIFIED
        Encoding.SDR -> dev.hebei.camerax_android.core.DynamicRange.Encoding.SDR
        Encoding.HDR_UNSPECIFIED -> dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR_UNSPECIFIED
        Encoding.HLG -> dev.hebei.camerax_android.core.DynamicRange.Encoding.HLG
        Encoding.HDR10 -> dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR10
        Encoding.HDR10PLUS -> dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR10_PLUS
        Encoding.DOLBY_VISION -> dev.hebei.camerax_android.core.DynamicRange.Encoding.DOLBY_VISION
    }

val BitDepth.obj
    get() = when (this) {
        BitDepth.UNSPECIFIED -> dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_UNSPECIFIED
        BitDepth.WITH8BIT -> dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_8_BIT
        BitDepth.WITH10BIT -> dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_10_BIT
    }

val dev.hebei.camerax_android.core.DynamicRange.Encoding.args
    get() = when (this) {
        dev.hebei.camerax_android.core.DynamicRange.Encoding.UNSPECIFIED -> Encoding.UNSPECIFIED
        dev.hebei.camerax_android.core.DynamicRange.Encoding.SDR -> Encoding.SDR
        dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR_UNSPECIFIED -> Encoding.HDR_UNSPECIFIED
        dev.hebei.camerax_android.core.DynamicRange.Encoding.HLG -> Encoding.HLG
        dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR10 -> Encoding.HDR10
        dev.hebei.camerax_android.core.DynamicRange.Encoding.HDR10_PLUS -> Encoding.HDR10PLUS
        dev.hebei.camerax_android.core.DynamicRange.Encoding.DOLBY_VISION -> Encoding.DOLBY_VISION
    }

val dev.hebei.camerax_android.core.DynamicRange.BitDepth.args
    get() = when (this) {
        dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_UNSPECIFIED -> BitDepth.UNSPECIFIED
        dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_8_BIT -> BitDepth.WITH8BIT
        dev.hebei.camerax_android.core.DynamicRange.BitDepth.BIT_DEPTH_10_BIT -> BitDepth.WITH10BIT
    }