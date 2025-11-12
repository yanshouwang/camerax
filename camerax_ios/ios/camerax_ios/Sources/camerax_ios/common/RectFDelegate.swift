//
//  RectFDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class RectFDelegate: PigeonApiDelegateRectFProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRectFProxyApi, left: Double, top: Double, right: Double, bottom: Double) throws -> RectF {
        return RectF(left: left, top: top, right: right, bottom: bottom)
    }
    
    func left(pigeonApi: PigeonApiRectFProxyApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.left
    }
    
    func top(pigeonApi: PigeonApiRectFProxyApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.top
    }
    
    func right(pigeonApi: PigeonApiRectFProxyApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.right
    }
    
    func bottom(pigeonApi: PigeonApiRectFProxyApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.bottom
    }
}
