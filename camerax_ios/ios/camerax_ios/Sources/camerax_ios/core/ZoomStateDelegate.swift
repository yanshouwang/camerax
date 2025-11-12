//
//  ZoomStateDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class ZoomStateDelegate: PigeonApiDelegateZoomStateProxyApi {
    func minZoomRatio(pigeonApi: PigeonApiZoomStateProxyApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.minZoomRatio
    }
    
    func maxZoomRatio(pigeonApi: PigeonApiZoomStateProxyApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.maxZoomRatio
    }
    
    func zoomRatio(pigeonApi: PigeonApiZoomStateProxyApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.zoomRatio
    }
    
    func linearZoom(pigeonApi: PigeonApiZoomStateProxyApi, pigeonInstance: ZoomState) throws -> Double {
        return pigeonInstance.linearZoom
    }
}
