//
//  ImageInfoDelegate.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/5/16.
//

import Foundation
import AVFoundation

class ImageInfoDelegate: PigeonApiDelegateImageInfoProxyApi {
    func timestamp(pigeonApi: PigeonApiImageInfoProxyApi, pigeonInstance: ImageInfo) throws -> Int64 {
        return pigeonInstance.timestamp.api
    }
    
    func rotationDegrees(pigeonApi: PigeonApiImageInfoProxyApi, pigeonInstance: ImageInfo) throws -> Int64 {
        return Int64(pigeonInstance.rotationDegrees)
    }
}
