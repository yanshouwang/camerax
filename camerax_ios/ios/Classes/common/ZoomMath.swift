//
//  ZoomMath.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/15.
//

import Foundation

/// This class is used for containing the mathematical calculations for ZoomControl, mainly the
/// conversions between zoomRatio and linearZoom.
///
/// The linearZoom is the percentage of zoom amount i.e. how much cropWidth is being used, so
/// linearZoom = 0.5 should represent the middle point of [minZoomCropWidth, maxZoomCropWidth] range.
/// But that does not mean it should be the same as (minZoom + maxZoom) / 2. For example, consider
/// the case where original cropWidth = 10000 for zoomRatio = 1.0f, minZoomRatio = 1.0f, maxZoomRatio
/// = 10.0f, zoomRatio = 5.5f may not represent linearZoom = 0.5 i.e. the half zoom amount. Here,
/// zoomRatio = 1.0f, cropWidth = 10000, zoomRatio = 5.5f, cropWidth = 1818.18 zoomRatio = 10.0f,
/// cropWidth = 1000 As observed, zoomRatio = 5.5f does not yield cropWidth = 5500 which would be the
/// actual zooming amount middle point.
public class ZoomMath {
    private init() {}
    
    public static func getLinearZoomFromZoomRatio(zoomRatio: Double, minZoomRatio: Double, maxZoomRatio: Double) -> Double {
        // if zoom is not supported i.e. minZoomRatio = maxZoomRatio, return 0
        if areFloatsEqual(minZoomRatio, maxZoomRatio) {
            return 0.0
        }
        if nearZero(zoomRatio) {
            return 0.0
        }
        if areFloatsEqual(zoomRatio, maxZoomRatio) {
            return 1.0
        }
        if areFloatsEqual(zoomRatio, minZoomRatio) {
            return 0.0
        }
        // linearZoom should represent the percentage of zoom amount based on how much cropWidth is
        // visible.
        //
        // The original sensor region width is considered as 1.0f here as we only need the
        // linearZoom ratio, not the actual crop width.
        let relativeCropWidth = 1.0 / zoomRatio
        let relativeCropWidthInMaxZoom = 1.0 / maxZoomRatio
        let relativeCropWidthInMinZoom = 1.0 / minZoomRatio
        let linearZoom = (relativeCropWidthInMinZoom - relativeCropWidth) / (relativeCropWidthInMinZoom - relativeCropWidthInMaxZoom)
        return MathUtils.clamp(linearZoom, min: 0.0, max: 1.0)
    }
    
    public static func getZoomRatioFromLinearZoom(linearZoom: Double, minZoomRatio: Double, maxZoomRatio: Double) -> Double {
        if areFloatsEqual(linearZoom, 1.0) {
            return maxZoomRatio
        }
        if areFloatsEqual(linearZoom, 0.0) {
            return minZoomRatio
        }
        // This crop width is proportional to the real crop width. The real crop with = sensorWidth/
        // zoomRatio, but we need the ratio only so we can assume sensorWidth as 1.0f.
        let relativeCropWidthInMaxZoom = 1.0 / maxZoomRatio
        let relativeCropWidthInMinZoom = 1.0 / minZoomRatio
        let cropWidth = relativeCropWidthInMinZoom - (relativeCropWidthInMinZoom - relativeCropWidthInMaxZoom) * linearZoom
        let ratio = 1.0 / cropWidth
        return MathUtils.clamp(ratio, min: minZoomRatio, max: maxZoomRatio)
    }
    
    private static func areFloatsEqual(_ num1: Double, _ num2: Double) -> Bool {
        return nearZero(num1 - num2)
    }
    
    internal static func nearZero(_ num: Double) -> Bool {
        return abs(num) < 2.0 * abs(num).ulp
    }
}
