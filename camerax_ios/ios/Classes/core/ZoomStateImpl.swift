//
//  ZoomStateImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class ZoomStateImpl: PigeonApiDelegateZoomStateApi {
    func minZoomRatio(pigeonApi: PigeonApiZoomStateApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.minZoomRatio
    }
    
    func maxZoomRatio(pigeonApi: PigeonApiZoomStateApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.maxZoomRatio
    }
    
    func zoomRatio(pigeonApi: PigeonApiZoomStateApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.zoomRatio
    }
    
    func linearZoom(pigeonApi: PigeonApiZoomStateApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.linearZoom
    }
}
