//
//  PointFDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class PointFDelegate: PigeonApiDelegatePointFProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiPointFProxyApi, x: Double, y: Double) throws -> PointF {
        return PointF(x: x, y: y)
    }
    
    func x(pigeonApi: PigeonApiPointFProxyApi, pigeonInstance: PointF) throws -> Double {
        return pigeonInstance.x
    }
    
    func y(pigeonApi: PigeonApiPointFProxyApi, pigeonInstance: PointF) throws -> Double {
        return pigeonInstance.y
    }
}
