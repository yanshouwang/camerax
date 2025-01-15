//
//  ZoomState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

@objc public class ZoomState: NSObject {
    @objc public let minZoomRatio: Double
    @objc public let maxZoomRatio: Double
    @objc public let zoomRatio: Double
    
    init(minZoomRatio: Double, maxZoomRatio: Double, zoomRatio: Double) {
        self.minZoomRatio = minZoomRatio
        self.maxZoomRatio = maxZoomRatio
        self.zoomRatio = zoomRatio
    }
    
    @objc public var linearZoom: Double {
        (zoomRatio - minZoomRatio) / (maxZoomRatio - minZoomRatio)
    }
}
