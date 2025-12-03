//
//  File.swift
//  camerax_ios
//
//  Created by 闫守旺 on 2025/11/12.
//

import Foundation
import AVFoundation

class AVMetadataBodyObjectDelegate: PigeonApiDelegateAVMetadataBodyObjectProxyApi {
    func getBodyID(pigeonApi: PigeonApiAVMetadataBodyObjectProxyApi, pigeonInstance: AVMetadataBodyObject) throws -> Int64 {
        return Int64(pigeonInstance.bodyID)
    }
}
