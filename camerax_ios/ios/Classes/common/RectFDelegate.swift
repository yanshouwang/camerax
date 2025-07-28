//
//  RectFDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/24.
//

import Foundation

class RectFDelegate: PigeonApiDelegateRectFApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRectFApi, left: Double, top: Double, right: Double, bottom: Double) throws -> RectF {
        return RectF(left: left, top: top, right: right, bottom: bottom)
    }
    
    func left(pigeonApi: PigeonApiRectFApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.left
    }
    
    func top(pigeonApi: PigeonApiRectFApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.top
    }
    
    func right(pigeonApi: PigeonApiRectFApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.right
    }
    
    func bottom(pigeonApi: PigeonApiRectFApi, pigeonInstance: RectF) throws -> Double {
        return pigeonInstance.bottom
    }
}
