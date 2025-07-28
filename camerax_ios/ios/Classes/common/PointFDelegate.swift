//
//  PointFDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class PointFDelegate: PigeonApiDelegatePointFApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiPointFApi, x: Double, y: Double) throws -> PointF {
        return PointF(x: x, y: y)
    }
    
    func x(pigeonApi: PigeonApiPointFApi, pigeonInstance: PointF) throws -> Double {
        return pigeonInstance.x
    }
    
    func y(pigeonApi: PigeonApiPointFApi, pigeonInstance: PointF) throws -> Double {
        return pigeonInstance.y
    }
}
