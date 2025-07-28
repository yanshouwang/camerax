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
    
    public var linearZoom: Double {
        return ZoomMath.getLinearZoomFromZoomRatio(zoomRatio: zoomRatio, minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio)
    }
    
    init(minZoomRatio: Double, maxZoomRatio: Double, zoomRatio: Double) {
        self.minZoomRatio = minZoomRatio
        self.maxZoomRatio = maxZoomRatio
        self.zoomRatio = zoomRatio
    }
    
    public override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? ZoomState else { return false }
        return object.minZoomRatio == self.minZoomRatio && object.maxZoomRatio == self.maxZoomRatio && object.zoomRatio == self.zoomRatio
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(self.minZoomRatio)
        hasher.combine(self.maxZoomRatio)
        hasher.combine(self.zoomRatio)
        return hasher.finalize()
    }
}
