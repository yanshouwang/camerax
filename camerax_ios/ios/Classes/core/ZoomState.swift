//
//  ZoomState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

public class ZoomState: NSObject {
    public let minZoomRatio: Double
    public let maxZoomRatio: Double
    public let zoomRatio: Double
    
    init(minZoomRatio: Double, maxZoomRatio: Double, zoomRatio: Double) {
        self.minZoomRatio = minZoomRatio
        self.maxZoomRatio = maxZoomRatio
        self.zoomRatio = zoomRatio
    }
    
    public var linearZoom: Double {
        return ZoomMath.getLinearZoomFromZoomRatio(zoomRatio: zoomRatio, minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio)
    }
}
