//
//  SizeDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class SizeDelegate: PigeonApiDelegateSizeApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiSizeApi, width: Int64, height: Int64) throws -> IntSize {
        return IntSize(width: Int(width), height: Int(height))
    }
    
    func width(pigeonApi: PigeonApiSizeApi, pigeonInstance: IntSize) throws -> Int64 {
        return Int64(pigeonInstance.width)
    }
    
    func height(pigeonApi: PigeonApiSizeApi, pigeonInstance: IntSize) throws -> Int64 {
        return Int64(pigeonInstance.height)
    }
}

class IntSize: Size<Int> {}
