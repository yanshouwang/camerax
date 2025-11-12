//
//  SizeDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/20.
//

import Foundation

class SizeDelegate: PigeonApiDelegateSizeProxyApi {
    func pigeonDefaultConstructor(pigeonApi: PigeonApiSizeProxyApi, width: Int64, height: Int64) throws -> Size {
        return Size(width: width, height: height)
    }
    
    func width(pigeonApi: PigeonApiSizeProxyApi, pigeonInstance: Size) throws -> Int64 {
        return pigeonInstance.width
    }
    
    func height(pigeonApi: PigeonApiSizeProxyApi, pigeonInstance: Size) throws -> Int64 {
        return pigeonInstance.height
    }
}
