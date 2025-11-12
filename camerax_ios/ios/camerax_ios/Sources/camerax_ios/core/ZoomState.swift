//
//  ZoomState.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2024/7/12.
//

import Foundation

public class ZoomState: NSObject {
    public let minZoomRatio: CGFloat
    public let maxZoomRatio: CGFloat
    public let zoomRatio: CGFloat
    
    public var linearZoom: CGFloat {
        return ZoomMath.getLinearZoomFromZoomRatio(zoomRatio: zoomRatio, minZoomRatio: minZoomRatio, maxZoomRatio: maxZoomRatio)
    }
    
    init(minZoomRatio: CGFloat, maxZoomRatio: CGFloat, zoomRatio: CGFloat) {
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
