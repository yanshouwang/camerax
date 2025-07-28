//
//  PointDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/7/23.
//

import Foundation

class PointDelegate: PigeonApiDelegatePointApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiPointApi, x: Int64, y: Int64) throws -> Point {
        return Point(x: x, y: y)
    }
    
    func x(pigeonApi: PigeonApiPointApi, pigeonInstance: Point) throws -> Int64 {
        return pigeonInstance.x
    }
    
    func y(pigeonApi: PigeonApiPointApi, pigeonInstance: Point) throws -> Int64 {
        return pigeonInstance.y
    }
}
