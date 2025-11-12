//
//  RectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class RectDelegate: PigeonApiDelegateRectProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRectProxyApi, left: Int64, top: Int64, right: Int64, bottom: Int64) throws -> Rect {
        return Rect(left: left, top: top, right: right, bottom: bottom)
    }
    
    func left(pigeonApi: PigeonApiRectProxyApi, pigeonInstance: Rect) throws -> Int64 {
        return pigeonInstance.left
    }
    
    func top(pigeonApi: PigeonApiRectProxyApi, pigeonInstance: Rect) throws -> Int64 {
        return pigeonInstance.top
    }
    
    func right(pigeonApi: PigeonApiRectProxyApi, pigeonInstance: Rect) throws -> Int64 {
        return pigeonInstance.right
    }
    
    func bottom(pigeonApi: PigeonApiRectProxyApi, pigeonInstance: Rect) throws -> Int64 {
        return pigeonInstance.bottom
    }    
}
