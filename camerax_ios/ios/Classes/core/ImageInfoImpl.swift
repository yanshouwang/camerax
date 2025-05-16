//
//  ImageInfoImpl.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation

class ImageInfoImpl: PigeonApiDelegateImageInfoApi {
    func timestamp(pigeonApi: PigeonApiImageInfoApi, pigeonInstance: ImageInfo) throws -> Int64 {
        return Int64(pigeonInstance.timestamp)
    }
    
    func rotationDegrees(pigeonApi: PigeonApiImageInfoApi, pigeonInstance: ImageInfo) throws -> Int64 {
        return Int64(pigeonInstance.rotationDegrees)
    }
}
