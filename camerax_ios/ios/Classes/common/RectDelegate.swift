//
//  RectDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class RectDelegate: PigeonApiDelegateRectApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiRectApi, left: Int64, top: Int64, right: Int64, bottom: Int64) throws -> Rect {
        return Rect(left: Int(left), top: Int(top), right: Int(right), bottom: Int(bottom))
    }
    
    func left(pigeonApi: PigeonApiRectApi, pigeonInstance: Rect) throws -> Int64 {
        return Int64(pigeonInstance.left)
    }
    
    func top(pigeonApi: PigeonApiRectApi, pigeonInstance: Rect) throws -> Int64 {
        return Int64(pigeonInstance.top)
    }
    
    func right(pigeonApi: PigeonApiRectApi, pigeonInstance: Rect) throws -> Int64 {
        return Int64(pigeonInstance.right)
    }
    
    func bottom(pigeonApi: PigeonApiRectApi, pigeonInstance: Rect) throws -> Int64 {
        return Int64(pigeonInstance.bottom)
    }    
}
