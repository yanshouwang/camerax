//
//  ZoomState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

class ZoomState: NSObject {
    let minZoomRatio: Double
    let maxZoomRatio: Double
    let zoomRatio: Double
    
    init(minZoomRatio: Double, maxZoomRatio: Double, zoomRatio: Double) {
        self.minZoomRatio = minZoomRatio
        self.maxZoomRatio = maxZoomRatio
        self.zoomRatio = zoomRatio
    }
    
    var linearZoom: Double {
        (zoomRatio - minZoomRatio) / (maxZoomRatio - minZoomRatio)
    }
}
